package com.jiangxinsoft.scorpio.pbm.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.pbm.mapper.PbmBugInfoMapper;
import com.jiangxinsoft.scorpio.pbm.model.PbmBugInfo;
import com.jiangxinsoft.scorpio.pbm.service.IPbmBugInfoService;
import com.jiangxinsoft.scorpio.util.KeyGenerator;

@Service
public class PbmBugInfoService implements IPbmBugInfoService {
	
	@Autowired
	private PbmBugInfoMapper pbmBugInfoMapper;

	@Override
	public void save(PbmBugInfo pojo) throws RuntimeException {
		pojo.setBugId(KeyGenerator.getUUIDKey());
		
		pojo.setCreateTime(new Date());
		pojo.setUpdateTime(new Date());
		
		pbmBugInfoMapper.insert(pojo);	
		
	}

	@Override
	public void update(PbmBugInfo pojo) throws RuntimeException {
		pojo.setUpdateTime(new Date());
		
		pbmBugInfoMapper.updateByPrimaryKey(pojo);
		
	}

	@Override
	public PbmBugInfo findByPrimaryKey(String bugId) {
		if(StringUtils.isNotBlank(bugId)) {
			return pbmBugInfoMapper.selectByPrimaryKey(bugId);
		}
		
		return null;
	}

	@Override
	public List<PbmBugInfo> find(PbmBugInfo pojo) {
		return null;
	}

	@Override
	public PageInfo<PbmBugInfo> findByPage(PbmBugInfo pojoVo, int currentPage,
			int pageSize, String sortName, String sortOrder) {
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "CreateTime Asc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<PbmBugInfo> list = pbmBugInfoMapper.select(pojoVo);
		PageInfo<PbmBugInfo> page = new PageInfo<PbmBugInfo>(list);
		
		return page;
	}

	@Override
	public void deleteByPrimaryKey(String id) throws RuntimeException {
		
	}

	@Override
	public void deleteByPrimaryKeys(String[] bugIds) throws RuntimeException {
		if(bugIds != null) {
			pbmBugInfoMapper.deleteByPrimaryKeys(bugIds);
		} else {
			throw new OperationException("删除缺陷失败,未指定删除的缺陷!");
		}
		
		
	}

}
