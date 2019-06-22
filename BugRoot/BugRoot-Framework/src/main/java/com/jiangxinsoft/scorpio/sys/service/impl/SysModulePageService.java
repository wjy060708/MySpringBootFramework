package com.jiangxinsoft.scorpio.sys.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;

import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.mapper.SysModulePageMapper;
import com.jiangxinsoft.scorpio.sys.mapper.SysRolePageMapper;
import com.jiangxinsoft.scorpio.sys.model.SysModulePage;
import com.jiangxinsoft.scorpio.sys.model.SysRolePage;
import com.jiangxinsoft.scorpio.sys.service.ISysModulePageService;
import com.jiangxinsoft.scorpio.sys.vo.ModulePageVo;
import com.jiangxinsoft.scorpio.sys.vo.RolePageVo;
import com.jiangxinsoft.scorpio.util.KeyGenerator;
import com.jiangxinsoft.scorpio.exception.OperationException;

@Service
public class SysModulePageService implements ISysModulePageService {

	@Autowired
	private SysModulePageMapper sysModulePageMapper;
	
	@Autowired
	private SysRolePageMapper sysRolePageMapper;
	
	@Transactional
	@Override
	public void saveModulePage(SysModulePage modulePage) {
		modulePage.setPageId(KeyGenerator.getUUIDKey());
		modulePage.setCreateTime(new Date());
		modulePage.setUpdateTime(new Date());
		
		sysModulePageMapper.insert(modulePage);
	}

	@Transactional
	@Override
	public void updateModulePage(SysModulePage modulePage) {
		modulePage.setUpdateTime(new Date());
		
		sysModulePageMapper.updateByPrimaryKey(modulePage);
	}

	@Override
	public SysModulePage getModulePageById(String pageId) {
		if(StringUtils.isNotBlank(pageId)) {
			return sysModulePageMapper.selectByPrimaryKey(pageId);
		}
		return null;
	}

	@Override
	public List<SysModulePage> getModulePages(ModulePageVo modulePageVo) {
		String orderBy = "PageOrder Asc";
		PageHelper.orderBy(orderBy);
		
		List<SysModulePage> list = sysModulePageMapper.select(modulePageVo);
		return list;
	}
	
	@Override
	public List<SysRolePage> getUserModuleList(RolePageVo rolePageVo) {
		String orderBy = "PageOrder Asc";
		PageHelper.orderBy(orderBy);
		
		List<SysRolePage> list = sysRolePageMapper.selectByUserAndModule(rolePageVo);
		return list;
	}
	
	@Override
	public List<SysRolePage> getRoleModuleList(RolePageVo rolePageVo) {
		String orderBy = "PageOrder Asc";
		PageHelper.orderBy(orderBy);
		
		List<SysRolePage> list = sysRolePageMapper.selectByRoleKey(rolePageVo);
		return list;
	}
	
	@Transactional
	@Override
	public void insertRoleModules(String roleId, List<SysRolePage> rolePages) throws OperationException {
		if(StringUtils.isBlank(roleId)) {
			throw new OperationException("没有指定需要设置功能权限的角色!");
		}
		
		// 清理授权信息
		sysRolePageMapper.deleteByRoleKey(roleId);
		
		// 对角色重新授权
		if(rolePages != null) {
			for (SysRolePage rolePage : rolePages) {
				rolePage.setAuthId(KeyGenerator.getUUIDKey());
				sysRolePageMapper.insert(rolePage);
			}
		}
	}

	@Override
	public PageInfo<SysModulePage> getModulePage(ModulePageVo modulePageVo, int currentPage,
			int pageSize, String sortName, String sortOrder) {
		
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "PageOrder Asc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<SysModulePage> list = sysModulePageMapper.select(modulePageVo);
		PageInfo<SysModulePage> page = new PageInfo<SysModulePage>(list);
		
		return page;
	}

	@Transactional
	@Override
	public void deleteModulePageById(String pageId) throws OperationException {
		if(StringUtils.isBlank(pageId)) {
			throw new OperationException("功能页面删除失败,未指定删除的功能页面!");
		}
		
		Integer c = sysModulePageMapper.countByParent(pageId);
		if(c > 0) {
			throw new OperationException("功能页面删除失败,功能页面还有下级子页面!");
		}
		
		sysModulePageMapper.deleteByPrimaryKey(pageId);
	}

}
