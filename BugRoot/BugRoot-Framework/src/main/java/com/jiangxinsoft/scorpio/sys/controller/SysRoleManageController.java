package com.jiangxinsoft.scorpio.sys.controller;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiangxinsoft.scorpio.common.Constants;
import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.sys.model.SysRole;
import com.jiangxinsoft.scorpio.sys.model.SysRolePage;
import com.jiangxinsoft.scorpio.sys.service.ISysModulePageService;
import com.jiangxinsoft.scorpio.sys.service.ISysRoleService;

@RequestMapping("/sys/role/manage")
@Controller
public class SysRoleManageController {
	
	@Autowired
	private ISysRoleService sysRoleService;
	
	@Autowired
	private ISysModulePageService sysModuleService;
	
	@RequestMapping("/default")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sys/role/manage/default");
		return modelAndView;
	}
	
	@RequestMapping("/new")
	public ModelAndView pageNew() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sys/role/manage/new");
		return modelAndView;
	}
	
	@RequestMapping("/edit")
	public ModelAndView pageEdit(String roleId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotBlank(roleId)) {
			SysRole role = sysRoleService.getRoleById(roleId);
			if(role != null) {
				modelAndView.addObject("role", role);
				modelAndView.setViewName("sys/role/manage/edit");
				
				return modelAndView;
			}
		}
		
		modelAndView.addObject("message", "没有指定需要编辑的系统角色,或系统角色已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}
	
	@RequestMapping("/grant")
	public ModelAndView pageGrant(String roleId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotBlank(roleId)) {
			SysRole role = sysRoleService.getRoleById(roleId);
			if(role != null) {
				modelAndView.addObject(role);
				modelAndView.setViewName("sys/role/manage/grant");
				
				return modelAndView;
			}
		} 
		
		modelAndView.addObject("message", "没有指定需要授权的系统角色,或系统角色已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/save")
	public RestResponse save(SysRole role) {
		sysRoleService.saveRole(role);
		
		return RestResponse.success("保存系统角色成功!");
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public RestResponse update(SysRole role) {
		sysRoleService.updateRole(role);
		
		return RestResponse.success("更新系统角色成功!");
	}
	
	@ResponseBody
	@RequestMapping("/ajaxGrant")
	public RestResponse ajaxGrant(String roleId, @RequestBody List<SysRolePage> rolePages) {
		sysModuleService.insertRoleModules(roleId, rolePages);
		
		return RestResponse.success("设置角色授权模块成功!");
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public RestResponse delete(String roleId) {
		sysRoleService.deleteRoleById(roleId);
		
		return RestResponse.success("删除系统角色成功!");
	}
	
}
