package com.jiangxinsoft.scorpio.sys.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import org.apache.commons.lang3.StringUtils;

import com.jiangxinsoft.scorpio.common.Constants;
import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.model.SysOrganization;
import com.jiangxinsoft.scorpio.sys.service.ISysOrganizationService;
import com.jiangxinsoft.scorpio.sys.vo.OrganizationVo;

@RequestMapping("/sys/org")
@Controller
public class SysDepartmentController {
	
	@Autowired
	private ISysOrganizationService sysOrganizationService;
	
	@RequestMapping("/default")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sys/org/default");
		return modelAndView;
	}
	
	@RequestMapping("/new")
	public ModelAndView pageNew() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sys/org/new");
		return modelAndView;
	}
	
	@RequestMapping("/edit")
	public ModelAndView pageEdit(String departmentId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotBlank(departmentId)) {
			SysOrganization organization = sysOrganizationService.getOrganizationById(departmentId);
			if(organization != null) {
				modelAndView.addObject("organization", organization);
				modelAndView.setViewName("sys/org/edit");
				
				return modelAndView;
			}
		}
		
		modelAndView.addObject("message", "没有指定需要编辑的组织机构,或组织机构已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}
	
	@RequestMapping("/orgDialog")
	public ModelAndView pageDialog() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sys/org/orgDialog");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/listOrg")
	public List<SysOrganization> listAllOrg(OrganizationVo organizationVo) {
		List<SysOrganization> list = sysOrganizationService.getOrganizations(organizationVo);
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/listOrgPage")
	public PageInfo<SysOrganization> listOrgPage(OrganizationVo organizationVo, int page, int rows, String sort, String order) {
		PageInfo<SysOrganization> retPage = sysOrganizationService.getOrganizationPage(organizationVo, page, rows, sort, order);
		return retPage;
	}
	
	@ResponseBody
	@RequestMapping("/save")
	public RestResponse save(SysOrganization organization) {
		sysOrganizationService.saveOrganization(organization);
		
		return RestResponse.success("保存组织机构成功!");
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public RestResponse update(SysOrganization organization) {
		sysOrganizationService.updateOrganization(organization);
		
		return RestResponse.success("更新组织机构成功!");
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public RestResponse delete(String departmentId) {
		sysOrganizationService.deleteOrganizationById(departmentId);
		
		return RestResponse.success("删除组织机构成功!");
	}
	
}
