package com.jiangxinsoft.scorpio.sys.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.sys.model.SysRole;
import com.jiangxinsoft.scorpio.sys.model.SysRoleMember;
import com.jiangxinsoft.scorpio.sys.service.ISysRoleService;

@RequestMapping("/sys/role/auth")
@Controller
public class SysRoleAuthController {
	
	@Autowired
	private ISysRoleService sysRoleService;
	
	@RequestMapping("/default")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sys/role/auth/default");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/saveMembers")
	public RestResponse saveMembers(@RequestBody List<SysRoleMember> members) {
		sysRoleService.saveRoleMembers(members);
		
		return RestResponse.success("保存角色成员成功!");
	}
	
	@ResponseBody
	@RequestMapping("/deleteMembers")
	public RestResponse deleteMembers(@RequestBody List<SysRoleMember> members) {
		sysRoleService.deleteRoleMembers(members);
		
		return RestResponse.success("删除角色成员成功!");
	}
	
	// 返回用户角色
	@ResponseBody
	@RequestMapping("/listUserRole")
	public List<SysRole> listUserRole(String userId) {
		List<SysRole> list = null;
		if(StringUtils.isNotBlank(userId)) {
			list = sysRoleService.getUserRoles(userId);
		} else {
			list = new ArrayList<SysRole>();
		}
		return list;
	}
}
