package com.jiangxinsoft.scorpio.sys.controller;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.model.SysRole;
import com.jiangxinsoft.scorpio.sys.model.SysRoleMember;
import com.jiangxinsoft.scorpio.sys.service.ISysRoleService;
import com.jiangxinsoft.scorpio.sys.vo.RoleMemberVo;
import com.jiangxinsoft.scorpio.sys.vo.RoleVo;

@RequestMapping("/sys/role")
@Controller
public class SysRoleController {
	
	@Autowired
	private ISysRoleService sysRoleService;
	
	@ResponseBody
	@RequestMapping("/listAll")
	public List<SysRole> listAll(RoleVo roleVo) {
		List<SysRole> list = sysRoleService.getAllRoles(roleVo);
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<SysRole> listPage(RoleVo roleVo, int page, int rows, String sort, String order) {
		PageInfo<SysRole> retPage = sysRoleService.getRolePage(roleVo, page, rows, sort, order);
		return retPage;
	}
	
	// 返回角色成员
	@ResponseBody
	@RequestMapping("/listMembers")
	public PageInfo<SysRoleMember> listPosMember(RoleMemberVo roleMemberVo, int page, int rows, String sort, String order) {
		PageInfo<SysRoleMember> retPage = null;
		
		String roleId = roleMemberVo.getRoleId();
		if(StringUtils.isNotBlank(roleId)) {
			retPage = sysRoleService.getRoleMemberPage(roleMemberVo, page, rows, sort, order);
		}
		
		return retPage;
	}
}

