package com.jiangxinsoft.scorpio.knowledge.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.knowledge.mapper.KnowProcessMapper;
import com.jiangxinsoft.scorpio.knowledge.model.KnowProcess;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowProcessService;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.util.KeyGenerator;

@Service
public class KnowProcessService implements IKnowProcessService {

	@Autowired
	private KnowProcessMapper knowProcessMapper;

	@Override
	public void save(KnowProcess pojo) throws RuntimeException {
		pojo.setProcessId(KeyGenerator.getUUIDKey());

		pojo.setCreateTime(new Date());
		pojo.setUpdateTime(new Date());
		knowProcessMapper.insert(pojo);
	}

	@Override
	public void update(KnowProcess pojo) throws RuntimeException {
		pojo.setUpdateTime(new Date());
		knowProcessMapper.updateByPrimaryKey(pojo);
	}

	@Override
	public KnowProcess findByPrimaryKey(String processId) {
		
		if(StringUtils.isNotBlank(processId)) {
			return knowProcessMapper.selectByPrimaryKey(processId);
		}
		
		return null;
	}

	@Override
	public List<KnowProcess> find(KnowProcess pojo) {
		return null;
	}

	@Override
	public PageInfo<KnowProcess> findByPage(KnowProcess pojoVo,
			int currentPage, int pageSize, String sortName, String sortOrder) {
		
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "CreateTime Asc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<KnowProcess> list = knowProcessMapper.select(pojoVo);
		PageInfo<KnowProcess> page = new PageInfo<KnowProcess>(list);
		
		return page;
	}

	@Override
	public void deleteByPrimaryKey(String id) throws RuntimeException {

	}

	@Override
	public void deleteByPrimaryKeys(String[] categoryIds) throws RuntimeException {
		if(categoryIds != null) {
			knowProcessMapper.deleteByPrimaryKeys(categoryIds);
		} else {
			throw new OperationException("删除过程类型失败,未指定删除的过程类型!");
		}
	}
	
	@Override
	public List<KnowProcess> getProcess(KnowProcess pojoVo) {
		String orderBy = "CreateTime Asc";
		PageHelper.orderBy(orderBy);
		
		List<KnowProcess> list = knowProcessMapper.select(pojoVo);
		return list;
	}

}
