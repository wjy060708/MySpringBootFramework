package com.jiangxinsoft.scorpio.sys.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;

import com.jiangxinsoft.scorpio.sys.mapper.SysDictEntryMapper;
import com.jiangxinsoft.scorpio.sys.model.SysDictEntry;
import com.jiangxinsoft.scorpio.sys.service.ISysDictEntryService;
import com.jiangxinsoft.scorpio.util.KeyGenerator;

@Service
public class SysDictEntryService implements ISysDictEntryService {

	@Autowired
	private SysDictEntryMapper sysDictEntryMapper;

	@Override
	public void save(SysDictEntry pojo) throws RuntimeException {
		pojo.setEntryId(KeyGenerator.getUUIDKey());
		
		pojo.setCreateTime(new Date());
		pojo.setUpdateTime(new Date());
		
		sysDictEntryMapper.insert(pojo);
	}

	@Override
	public void update(SysDictEntry pojo) throws RuntimeException {
		pojo.setUpdateTime(new Date());
		
		sysDictEntryMapper.updateByPrimaryKey(pojo);
	}

	@Override
	public SysDictEntry findByPrimaryKey(String id) {
		if(StringUtils.isNotBlank(id)) {
			return sysDictEntryMapper.selectByPrimaryKey(id);
		}
		return null;
	}

	@Override
	public List<SysDictEntry> find(SysDictEntry pojo) {
		String orderBy = "EntryOrder Asc";
		PageHelper.orderBy(orderBy);
		
		List<SysDictEntry> list = sysDictEntryMapper.select(pojo);
		return list;
	}

	@Override
	public PageInfo<SysDictEntry> findByPage(SysDictEntry pojoVo,
			int currentPage, int pageSize, String sortName, String sortOrder) {
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "EntryOrder Asc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<SysDictEntry> list = sysDictEntryMapper.select(pojoVo);
		PageInfo<SysDictEntry> page = new PageInfo<SysDictEntry>(list);
		
		return page;
	}

	@Override
	public void deleteByPrimaryKey(String id) throws RuntimeException {
		if(StringUtils.isBlank(id)) {
			throw new OperationException("删除数据字典条目失败,未指定删除的数据字典条目!");
		}
		
		sysDictEntryMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void deleteByPrimaryKeys(String[] ids) throws RuntimeException {
		if(ids != null) {
			sysDictEntryMapper.deleteByPrimaryKeys(ids);
		} else {
			throw new OperationException("删除数据字典条目失败,未指定删除的数据字典条目!");
		}
	}
	
}
