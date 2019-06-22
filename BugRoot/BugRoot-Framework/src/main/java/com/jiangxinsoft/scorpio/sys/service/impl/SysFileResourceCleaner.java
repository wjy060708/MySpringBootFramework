package com.jiangxinsoft.scorpio.sys.service.impl;

import java.io.File;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.jiangxinsoft.scorpio.sys.mapper.SysFileResourceMapper;
import com.jiangxinsoft.scorpio.sys.model.SysFileResource;
import com.jiangxinsoft.scorpio.sys.service.ISysFileResourceCleaner;
import com.jiangxinsoft.scorpio.sys.vo.FileResourceVo;
import com.jiangxinsoft.scorpio.sys.constants.SysConstants;
import com.jiangxinsoft.scorpio.util.FileUtil;

@Service
public class SysFileResourceCleaner implements ISysFileResourceCleaner {

	@Autowired
	private SysFileResourceMapper sysFileResourceMapper;
	
	/**
	 * 文档清理任务
	 * 没十分钟清理一次
	 */
	@Scheduled(cron="0 0/10 * * * ? ")
	@Override
	public void fileResourceInspect() {
		FileResourceVo fileResourceVo = new FileResourceVo();
		fileResourceVo.setFileStatus(SysConstants.FILE_STATUS_DELETED);	// 已删除文档
		
		List<SysFileResource> list = sysFileResourceMapper.select(fileResourceVo);
		if(list != null) {
			for(SysFileResource fileResource : list) {
				this.cleanFileResource(fileResource.getFileId());	// 异步调用
			}
		}
	}
	
	/**
	 * 异步调用
	 */
	@Async
	@Override
	public void cleanFileResource(String fileId) {
		if(StringUtils.isNotBlank(fileId)) {
			SysFileResource fileResource = sysFileResourceMapper.selectByPrimaryKey(fileId);
			if(fileResource != null) {
				// 1.删除数据库记录
				sysFileResourceMapper.deleteByPrimaryKey(fileId);
				
				// 2.删除物理文件
				String fileDirectory = fileResource.getFileDirectory();
				String filePath = fileResource.getFilePath();
				String fileName = fileResource.getFileName();
				File file = FileUtil.getFile(fileDirectory, filePath, fileName);
				if(file != null) {
					if(file.exists()) {
						file.delete();
					}
				}
			}
		}
	}
}
