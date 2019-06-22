package com.jiangxinsoft.scorpio.epm.controller;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiangxinsoft.scorpio.common.Constants;
import com.jiangxinsoft.scorpio.epm.model.EpmProjectGroup;
import com.jiangxinsoft.scorpio.epm.service.IEpmProjectGroupService;
import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;

@RequestMapping("/epm/project/group")
@Controller
public class EpmProjectGroupController {
	
	@Autowired
	private IEpmProjectGroupService epmProjectGroupService;
	
	@RequestMapping("/default")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("epm/project/group/default");
		
		return modelAndView;
	}
	
	@RequestMapping("/new")
	public ModelAndView pageNew() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("epm/project/group/new");
		
		return modelAndView;
	}
	
	@RequestMapping("/edit")
	public ModelAndView pageEdit(String groupId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotBlank(groupId)) {
			EpmProjectGroup projectGroup = epmProjectGroupService.findByPrimaryKey(groupId);
			if(projectGroup != null) {
				modelAndView.addObject("projectGroup", projectGroup);
				modelAndView.setViewName("epm/project/group/edit");
				
				return modelAndView;
			}
		}
		
		modelAndView.addObject("message", "没有指定需要编辑的项目群,或项目群已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/listAll")
	public List<EpmProjectGroup> listAll(EpmProjectGroup pojoVo) {
		List<EpmProjectGroup> list = epmProjectGroupService.find(pojoVo);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<EpmProjectGroup> listPage(EpmProjectGroup pojoVo, int page, int rows, String sort, String order) {
		PageInfo<EpmProjectGroup> retPage = epmProjectGroupService.findByPage(pojoVo, page, rows, sort, order);
		
		return retPage;
	}
	
	@ResponseBody
	@RequestMapping("/save")
	public RestResponse save(EpmProjectGroup pojo) {
		epmProjectGroupService.save(pojo);
		
		return RestResponse.success("保存项目群成功!");
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public RestResponse update(EpmProjectGroup pojo) {
		epmProjectGroupService.update(pojo);
		
		return RestResponse.success("更新项目群成功!");
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public RestResponse delete(String[] groupIds) {
		epmProjectGroupService.deleteByPrimaryKeys(groupIds);
		
		return RestResponse.success("删除项目群成功!");
	}
	
}
