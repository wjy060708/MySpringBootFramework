package com.jiangxinsoft.scorpio.sys.service;

import java.util.List;


import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.model.SysModule;
import com.jiangxinsoft.scorpio.sys.vo.ModuleVo;

public interface ISysModuleService {

	/**
	 * 插入子系统
	 * @param module
	 */
	public void saveModule(SysModule module);
	
	/**
	 * 更新子系统
	 * @param module
	 */
	public void updateModule(SysModule module);
	
	/**
	 * 根据子系统ID查找子系统
	 * @param moduleId
	 * @return
	 */
	public SysModule getModuleById(String moduleId);
	
	/**
	 * 查询所有子系统列表
	 * @return
	 */
	public List<SysModule> getModules(ModuleVo moduleVo);
	
	/**
	 * 查询所有子系统列表
	 * @return
	 */
	public List<SysModule> getModulesForLoginUser(String userId);
	
	/**
	 * 查询子系统列表
	 * @return
	 */
	public PageInfo<SysModule> getModulePage(ModuleVo moduleVo, int currentPage, 
			int pageSize, String sortName, String sortOrder);
	
	/**
	 * 根据子系统ID删除子系统
	 * @param moduleId
	 */
	public void deleteModuleById(String moduleId) throws OperationException;
	
	/**
	 * 根据子系统ID批量删除子系统
	 * @param ids
	 */
	public void deleteModuleByIds(String[] moduleIds) throws OperationException;
}
