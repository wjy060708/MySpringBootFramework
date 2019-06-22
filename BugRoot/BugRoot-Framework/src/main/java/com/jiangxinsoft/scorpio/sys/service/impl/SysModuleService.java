package com.jiangxinsoft.scorpio.sys.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;

import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.mapper.SysModuleMapper;
import com.jiangxinsoft.scorpio.sys.model.SysModule;
import com.jiangxinsoft.scorpio.sys.service.ISysModuleService;
import com.jiangxinsoft.scorpio.sys.vo.ModuleVo;
import com.jiangxinsoft.scorpio.util.KeyGenerator;
import com.jiangxinsoft.scorpio.exception.OperationException;

@Service
public class SysModuleService implements ISysModuleService {

	@Autowired
	private SysModuleMapper sysModuleMapper;
	
	@Transactional
	@Override
	public void saveModule(SysModule module) {
		module.setModuleId(KeyGenerator.getUUIDKey());
		module.setCreateTime(new Date());
		module.setUpdateTime(new Date());
		
		sysModuleMapper.insert(module);
	}

	@Transactional
	@Override
	public void updateModule(SysModule module) {
		module.setUpdateTime(new Date());
		
		sysModuleMapper.updateByPrimaryKey(module);
	}

	@Override
	public SysModule getModuleById(String moduleId) {
		if(StringUtils.isNotBlank(moduleId)) {
			return sysModuleMapper.selectByPrimaryKey(moduleId);
		}
		return null;
	}

	@Override
	public List<SysModule> getModules(ModuleVo moduleVo) {
		String orderBy = "ModuleOrder Asc";
		PageHelper.orderBy(orderBy);
		
		List<SysModule> list = sysModuleMapper.select(moduleVo);
		return list;
	}
	
	@Override
	public List<SysModule> getModulesForLoginUser(String userId) {
		String orderBy = "ModuleOrder Asc";
		PageHelper.orderBy(orderBy);
		
		List<SysModule> list = sysModuleMapper.selectByLoginUserId(userId);
		return list;
	}
	
	@Override
	public PageInfo<SysModule> getModulePage(ModuleVo moduleVo, int currentPage, int pageSize, String sortName, 
			String sortOrder) {
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "ModuleOrder Asc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<SysModule> list = sysModuleMapper.select(moduleVo);
		PageInfo<SysModule> page = new PageInfo<SysModule>(list);
		
		return page;
	}

	@Transactional
	@Override
	public void deleteModuleById(String moduleId) throws OperationException {
		if(StringUtils.isBlank(moduleId)) {
			throw new OperationException("删除模块失败,未指定删除的模块!");
		}
		
		sysModuleMapper.deleteByPrimaryKey(moduleId);
	}

	@Transactional
	@Override
	public void deleteModuleByIds(String[] moduleIds) throws OperationException {
		if(moduleIds == null) {
			throw new OperationException("删除模块失败,未指定删除的模块!");
		}
		sysModuleMapper.deleteByPrimaryKeys(moduleIds);
	}

}
