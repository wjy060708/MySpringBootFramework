package com.jiangxinsoft.scorpio.pbm.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.pbm.mapper.PbmBugCategoryMapper;
import com.jiangxinsoft.scorpio.pbm.model.PbmBugCategory;
import com.jiangxinsoft.scorpio.pbm.service.IPbmBugCategoryService;
import com.jiangxinsoft.scorpio.util.KeyGenerator;

@Service
public class PbmBugCategoryService implements IPbmBugCategoryService {
	
	@Autowired
	private PbmBugCategoryMapper pbmBugCategoryMapper;

	@Override
	public void save(PbmBugCategory pojo) throws RuntimeException {
		pojo.setCategoryId(KeyGenerator.getUUIDKey());
		
		pojo.setCreateTime(new Date());
		pojo.setUpdateTime(new Date());
		
		pbmBugCategoryMapper.insert(pojo);	
		
	}

	@Override
	public void update(PbmBugCategory pojo) throws RuntimeException {
		pojo.setUpdateTime(new Date());
		
		pbmBugCategoryMapper.updateByPrimaryKey(pojo);
		
	}

	@Override
	public PbmBugCategory findByPrimaryKey(String categoryId) {
		if(StringUtils.isNotBlank(categoryId)) {
			return pbmBugCategoryMapper.selectByPrimaryKey(categoryId);
		}
		
		return null;
	}

	@Override
	public List<PbmBugCategory> find(PbmBugCategory pojo) {
		return null;
	}

	@Override
	public PageInfo<PbmBugCategory> findByPage(PbmBugCategory pojoVo,
			int currentPage, int pageSize, String sortName, String sortOrder) {
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "CreateTime Asc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<PbmBugCategory> list = pbmBugCategoryMapper.select(pojoVo);
		PageInfo<PbmBugCategory> page = new PageInfo<PbmBugCategory>(list);
		
		return page;
	}

	@Override
	public void deleteByPrimaryKey(String id) throws RuntimeException {
		
	}

	@Override
	public void deleteByPrimaryKeys(String[] categoryIds) throws RuntimeException {
		if(categoryIds != null) {
			pbmBugCategoryMapper.deleteByPrimaryKeys(categoryIds);
		} else {
			throw new OperationException("删除缺陷类型失败,未指定删除的缺陷类型!");
		}
		
	}

}
