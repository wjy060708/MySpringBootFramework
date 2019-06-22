package com.jiangxinsoft.scorpio.epm.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import com.jiangxinsoft.scorpio.epm.mapper.EpmTaskInfoMapper;
import com.jiangxinsoft.scorpio.epm.model.EpmTaskInfo;
import com.jiangxinsoft.scorpio.epm.service.IEpmTaskInfoService;
import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.util.KeyGenerator;

@Service
public class EpmTaskInfoService implements IEpmTaskInfoService {
	
	@Autowired
	private EpmTaskInfoMapper epmTaskInfoMapper;

	@Override
	public void save(EpmTaskInfo pojo) throws RuntimeException {
		pojo.setTaskId(KeyGenerator.getUUIDKey());
		
		pojo.setCreateTime(new Date());
		pojo.setUpdateTime(new Date());
		
		epmTaskInfoMapper.insert(pojo);			
	}

	@Override
	public void update(EpmTaskInfo pojo) throws RuntimeException {
		pojo.setUpdateTime(new Date());
		
		epmTaskInfoMapper.updateByPrimaryKey(pojo);			
	}

	@Override
	public EpmTaskInfo findByPrimaryKey(String taskId) {
		if(StringUtils.isNotBlank(taskId)) {
			return epmTaskInfoMapper.selectByPrimaryKey(taskId);
		}
		
		return null;
	}

	@Override
	public List<EpmTaskInfo> find(EpmTaskInfo pojo) {
		String orderBy = "CreateTime Asc";
		PageHelper.orderBy(orderBy);
		
		List<EpmTaskInfo> list = epmTaskInfoMapper.select(pojo);
		return list;
	}

	@Override
	public PageInfo<EpmTaskInfo> findByPage(EpmTaskInfo pojoVo,
			int currentPage, int pageSize, String sortName, String sortOrder) {
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "CreateTime Asc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<EpmTaskInfo> list = epmTaskInfoMapper.select(pojoVo);
		PageInfo<EpmTaskInfo> page = new PageInfo<EpmTaskInfo>(list);
		
		return page;
	}

	@Override
	public void deleteByPrimaryKey(String taskId) throws RuntimeException {
		if(StringUtils.isBlank(taskId)) {
			throw new OperationException("项目计划删除失败,未指定删除的项目计划!");
		}
		
		Integer c = epmTaskInfoMapper.countByParent(taskId);
		if(c > 0) {
			throw new OperationException("项目计划删除失败,项目计划还有下级子计划!");
		}
		
		epmTaskInfoMapper.deleteByPrimaryKey(taskId);
		
	}

	@Override
	public void deleteByPrimaryKeys(String[] taskIds) throws RuntimeException {
		
	}

}
