package com.jiangxinsoft.scorpio.sys.service;

import java.util.List;


import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.model.SysModulePage;
import com.jiangxinsoft.scorpio.sys.model.SysRolePage;
import com.jiangxinsoft.scorpio.sys.vo.ModulePageVo;
import com.jiangxinsoft.scorpio.sys.vo.RolePageVo;

public interface ISysModulePageService {

	/**
	 * 插入系统功能模块
	 * @param modulePage
	 */
	public void saveModulePage(SysModulePage modulePage);
	
	/**
	 * 更新系统功能模块
	 * @param modulePage
	 */
	public void updateModulePage(SysModulePage modulePage);
	
	/**
	 * 根据系统功能模块ID查找系统功能模块
	 * @param pageId
	 * @return
	 */
	public SysModulePage getModulePageById(String pageId);
	
	/**
	 * 查询所有系统功能模块列表
	 * @return
	 */
	public List<SysModulePage> getModulePages(ModulePageVo modulePageVo);
	
	/**
	 * 根据系统ID查询系统功能模块列表
	 * @return
	 */
	public List<SysRolePage> getUserModuleList(RolePageVo rolePageVo);
	
	/**
	 * 查询特定角色包含的系统功能模块列表
	 * @return
	 */
	public List<SysRolePage> getRoleModuleList(RolePageVo rolePageVo);
	
	/**
	 * 角色授权模块
	 * @param roleId
	 * @param listModules
	 */
	public void insertRoleModules(String roleId, List<SysRolePage> rolePages) throws OperationException;
	
	/**
	 * 查询系统功能模块列表
	 * @return
	 */
	public PageInfo<SysModulePage> getModulePage(ModulePageVo modulePageVo, 
			int currentPage, int pageSize, String sortName, String sortOrder);
	
	/**
	 * 根据系统功能模块ID删除系统功能模块
	 * @param pageId
	 * @return TODO
	 */
	public void deleteModulePageById(String pageId) throws OperationException;
}
