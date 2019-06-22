package com.jiangxinsoft.scorpio.sys.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import org.apache.commons.lang3.StringUtils;

import com.jiangxinsoft.scorpio.common.Constants;
import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.sys.model.SysOrganization;
import com.jiangxinsoft.scorpio.sys.model.SysPosition;
import com.jiangxinsoft.scorpio.sys.model.SysRole;
import com.jiangxinsoft.scorpio.sys.model.SysRoleMember;
import com.jiangxinsoft.scorpio.sys.model.SysUser;
import com.jiangxinsoft.scorpio.sys.service.ISysOrganizationService;
import com.jiangxinsoft.scorpio.sys.service.ISysPositionService;
import com.jiangxinsoft.scorpio.sys.service.ISysRoleService;
import com.jiangxinsoft.scorpio.sys.service.ISysUserService;

@RequestMapping("/sys/user/auth")
@Controller
public class SysUserAuthController {
	
	@Autowired
	private ISysUserService sysUserService;
	
	@Autowired
	private ISysRoleService sysRoleService;
	
	@Autowired
	private ISysPositionService sysPositionService;
	
	@Autowired
	private ISysOrganizationService sysOrganizationService;
	
	@RequestMapping("/default")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sys/user/auth/default");
		return modelAndView;
	}
	
	@RequestMapping("/grant")
	public ModelAndView pageGrant(String userId) {
		ModelAndView modelAndView = new ModelAndView();
		if(StringUtils.isNotBlank(userId)) {
			SysUser user = sysUserService.getUserById(userId);
			if(user != null) {
				modelAndView.addObject("user", user);
				modelAndView.setViewName("sys/user/auth/grant");
				
				return modelAndView;
			}
		} 
		
		modelAndView.addObject("message", "没有指定需要授权的系统用户,或系统用户已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/ajaxGrant")
	public RestResponse ajaxGrant(String userId, @RequestBody List<SysRoleMember> userRoles) {
		sysRoleService.saveUserRoles(userId, userRoles);
		
		return RestResponse.success("设置人员角色成功!");
	}
	
	@ResponseBody
	@RequestMapping("/enable")
	public RestResponse enable(String[] userIds) {
		sysUserService.enableUser(userIds);
		
		return RestResponse.success("激活系统用户成功!");
	}
	
	@ResponseBody
	@RequestMapping("/disable")
	public RestResponse disable(String[] userIds) {
		sysUserService.disableUser(userIds);
		
		return RestResponse.success("冻结系统用户成功!");
	}
	
	@ResponseBody
	@RequestMapping("/reset")
	public RestResponse resetPassword(String[] userIds) {
		sysUserService.resetUserPassword(userIds);
		
		return RestResponse.success("重置系统用户密码成功!");
	}
	
	// 返回用户角色
	@ResponseBody
	@RequestMapping("/listRole")
	public List<SysRole> listUserRole(String userId) {
		List<SysRole> list = null;
		if(StringUtils.isNotBlank(userId)) {
			list = sysRoleService.getUserGrantedRoles(userId);
		} else {
			list = new ArrayList<SysRole>();
		}
		return list;
	}
	
	// 返回用户岗位
	@ResponseBody
	@RequestMapping("/listPosition")
	public List<SysPosition> listUserPosition(String userId) {
		List<SysPosition> list = null;
		if(StringUtils.isNotBlank(userId)) {
			list = sysPositionService.getUserPositions(userId);
		} else {
			list = new ArrayList<SysPosition>();
		}
		return list;
	}
	
	// 返回用户岗位
	@ResponseBody
	@RequestMapping("/listDepartment")
	public List<SysOrganization> listUserDepartment(String userId) {
		List<SysOrganization> list = null;
		if(StringUtils.isNotBlank(userId)) {
			list = sysOrganizationService.getUserOrganizations(userId);
		} else {
			list = new ArrayList<SysOrganization>();
		}
		return list;
	}
}
