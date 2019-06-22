package com.jiangxinsoft.scorpio.sys.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;

import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.constants.SysConstants;
import com.jiangxinsoft.scorpio.sys.mapper.SysFileResourceMapper;
import com.jiangxinsoft.scorpio.sys.model.SysFileResource;
import com.jiangxinsoft.scorpio.sys.service.ISysFileResourceService;
import com.jiangxinsoft.scorpio.sys.vo.FileResourceVo;
import com.jiangxinsoft.scorpio.util.KeyGenerator;
import com.jiangxinsoft.scorpio.exception.OperationException;

@Service
public class SysFileResourceService implements ISysFileResourceService {

	@Autowired
	private SysFileResourceMapper sysFileResourceMapper;
	
	public SysFileResourceService() {
	}
	
	@Transactional
	@Override
	public void saveFileResource(SysFileResource fileResource) {
		fileResource.setFileId(KeyGenerator.getUUIDKey());
		fileResource.setCreateTime(new Date());
		fileResource.setUpdateTime(new Date());
		
		sysFileResourceMapper.insert(fileResource);
	}

	@Transactional
	@Override
	public void updateFileResource(SysFileResource fileResource) {
		fileResource.setUpdateTime(new Date());
		sysFileResourceMapper.updateByPrimaryKey(fileResource);
	}

	@Override
	public SysFileResource getFileResourceById(String fileId) {
		if(StringUtils.isNotBlank(fileId)) {
			return sysFileResourceMapper.selectByPrimaryKey(fileId);
		}
		return null;
	}

	@Override
	public List<SysFileResource> getFileResources(FileResourceVo fileResourceVo) {
		List<SysFileResource> list = sysFileResourceMapper.select(fileResourceVo);
		return list;
	}

	@Override
	public PageInfo<SysFileResource> getFileResourcePage(
			FileResourceVo fileResourceVo, int currentPage, int pageSize,
			String sortName, String sortOrder) {
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			PageHelper.startPage(currentPage, pageSize);
		}
		
		List<SysFileResource> list = sysFileResourceMapper.select(fileResourceVo);
		PageInfo<SysFileResource> page = new PageInfo<SysFileResource>(list);
		
		return page;
	}

	@Transactional
	@Override
	public void deleteFileResourceById(String fileId) throws OperationException {
		if(StringUtils.isBlank(fileId)) {
			throw new OperationException("删除文件资源失败,未指定删除的文件资源!");
		}
		
		SysFileResource fileResource = sysFileResourceMapper.selectByPrimaryKey(fileId);
		if(fileResource == null) {
			throw new OperationException("删除文件资源失败,删除的文件资源已不存在!");
		}
		
		if(SysConstants.FILE_STATUS_NOT_ENABLED.equals(fileResource.getFileStatus())) {	// 只能删除为使用的文件资源
			fileResource.setFileStatus(SysConstants.FILE_STATUS_DELETED);
			sysFileResourceMapper.updateByPrimaryKey(fileResource);
		} else {
			throw new OperationException("删除文件资源失败,文件资源已被使用!");
		}
	}

	@Transactional
	@Override
	public void deleteFileResourceByIds(String[] fileIds) throws OperationException {
		if(fileIds == null) {
			throw new OperationException("删除文件资源失败,未指定删除的文件资源!");
		}
		
		for(String fileId : fileIds) {
			this.deleteFileResourceById(fileId);
		}
	}
}
