package com.jiangxinsoft.scorpio.epm.controller;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiangxinsoft.scorpio.common.Constants;
import com.jiangxinsoft.scorpio.epm.model.EpmProjectType;
import com.jiangxinsoft.scorpio.epm.service.IEpmProjectTypeService;
import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;

@RequestMapping("/epm/project/type")
@Controller
public class EpmProjectTypeController {
	
	@Autowired
	private IEpmProjectTypeService epmProjectTypeService;
	
	@RequestMapping("/default")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("epm/project/type/default");
		
		return modelAndView;
	}
	
	@RequestMapping("/new")
	public ModelAndView pageNew() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("epm/project/type/new");
		
		return modelAndView;
	}
	
	@RequestMapping("/edit")
	public ModelAndView pageEdit(String typeId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotBlank(typeId)) {
			EpmProjectType projectType = epmProjectTypeService.findByPrimaryKey(typeId);
			if(projectType != null) {
				modelAndView.addObject("projectType", projectType);
				modelAndView.setViewName("epm/project/type/edit");
				
				return modelAndView;
			}
		}
		
		modelAndView.addObject("message", "没有指定需要编辑的项目信息,或项目信息已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/listAll")
	public List<EpmProjectType> listAll(EpmProjectType pojoVo) {
		List<EpmProjectType> list = epmProjectTypeService.find(pojoVo);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/save")
	public RestResponse save(EpmProjectType pojo) {
		epmProjectTypeService.save(pojo);
		
		return RestResponse.success("保存项目信息成功!");
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public RestResponse update(EpmProjectType pojo) {
		epmProjectTypeService.update(pojo);
		
		return RestResponse.success("更新项目信息成功!");
	}
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<EpmProjectType> listPage(EpmProjectType pojoVo, int page, int rows, String sort, String order) {
		PageInfo<EpmProjectType> retPage = epmProjectTypeService.findByPage(pojoVo, page, rows, sort, order);
		
		return retPage;
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public RestResponse delete(String[] typeIds) {
		epmProjectTypeService.deleteByPrimaryKeys(typeIds);
		
		return RestResponse.success("删除项目类型成功!");
	}
	
}
