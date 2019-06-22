package com.jiangxinsoft.scorpio.sys.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;

import com.jiangxinsoft.scorpio.sys.mapper.SysDictCategoryMapper;
import com.jiangxinsoft.scorpio.sys.model.SysDictCategory;
import com.jiangxinsoft.scorpio.sys.service.ISysDictCategoryService;
import com.jiangxinsoft.scorpio.util.KeyGenerator;

@Service
public class SysDictCategoryService implements ISysDictCategoryService {

	@Autowired
	private SysDictCategoryMapper sysDictCategoryMapper;
	
	@Override
	public void save(SysDictCategory pojo) throws RuntimeException {
		pojo.setCategoryId(KeyGenerator.getUUIDKey());
		
		pojo.setCreateTime(new Date());
		pojo.setUpdateTime(new Date());
		
		sysDictCategoryMapper.insert(pojo);
	}

	@Override
	public void update(SysDictCategory pojo) throws RuntimeException {
		pojo.setUpdateTime(new Date());
		
		sysDictCategoryMapper.updateByPrimaryKey(pojo);
	}

	@Override
	public SysDictCategory findByPrimaryKey(String id) {
		if(StringUtils.isNotBlank(id)) {
			return sysDictCategoryMapper.selectByPrimaryKey(id);
		}
		return null;
	}

	@Override
	public List<SysDictCategory> find(SysDictCategory pojo) {
		String orderBy = "CategoryOrder Asc";
		PageHelper.orderBy(orderBy);
		
		List<SysDictCategory> list = sysDictCategoryMapper.select(pojo);
		return list;
	}

	@Override
	public PageInfo<SysDictCategory> findByPage(SysDictCategory pojoVo,
			int currentPage, int pageSize, String sortName, String sortOrder) {
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "CategoryOrder Asc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<SysDictCategory> list = sysDictCategoryMapper.select(pojoVo);
		PageInfo<SysDictCategory> page = new PageInfo<SysDictCategory>(list);
		
		return page;
	}

	@Override
	public void deleteByPrimaryKey(String id) throws RuntimeException {
		if(StringUtils.isBlank(id)) {
			throw new OperationException("删除数据字典类别,未指定删除的数据字典类别!");
		}
		
		sysDictCategoryMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void deleteByPrimaryKeys(String[] ids) throws RuntimeException {
		if(ids != null) {
			sysDictCategoryMapper.deleteByPrimaryKeys(ids);
		} else {
			throw new OperationException("删除数据字典类别,未指定删除的数据字典类别!");
		}
	}

}
