package com.jiangxinsoft.scorpio.sys.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.mapper.SysLogMapper;
import com.jiangxinsoft.scorpio.sys.model.SysLog;
import com.jiangxinsoft.scorpio.sys.service.ISysLogService;
import com.jiangxinsoft.scorpio.sys.vo.LogVo;
import com.jiangxinsoft.scorpio.util.KeyGenerator;

@Service
public class SysLogService implements ISysLogService {

	@Autowired
	private SysLogMapper sysLogMapper;
	
	@Override
	public void saveLog(SysLog log) {
		log.setId(KeyGenerator.getUUIDKey());
		sysLogMapper.insert(log);
	}
	
	@Override
	public PageInfo<SysLog> getAdminLogPage(LogVo logVo, int currentPage,
			int pageSize, String sortName, String sortOrder) {
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "CreateDate Desc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<SysLog> list = sysLogMapper.selectAdminLog(logVo);
		PageInfo<SysLog> page = new PageInfo<SysLog>(list);
		
		return page;
	}
	
	@Override
	public PageInfo<SysLog> getAuditLogPage(LogVo logVo, int currentPage,
			int pageSize, String sortName, String sortOrder) {
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "CreateDate Desc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<SysLog> list = sysLogMapper.selectAuditLog(logVo);
		PageInfo<SysLog> page = new PageInfo<SysLog>(list);
		
		return page;
	}
	
	@Override
	public PageInfo<SysLog> getSecrecyLogPage(LogVo logVo, int currentPage,
			int pageSize, String sortName, String sortOrder) {
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "CreateDate Desc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<SysLog> list = sysLogMapper.selectSecrecyLog(logVo);
		PageInfo<SysLog> page = new PageInfo<SysLog>(list);
		
		return page;
	}

}
