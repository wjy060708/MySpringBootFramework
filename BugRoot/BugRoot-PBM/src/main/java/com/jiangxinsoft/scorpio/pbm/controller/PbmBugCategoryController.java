package com.jiangxinsoft.scorpio.pbm.controller;

import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiangxinsoft.scorpio.common.Constants;
import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.pbm.model.PbmBugCategory;
import com.jiangxinsoft.scorpio.pbm.service.IPbmBugCategoryService;

@RequestMapping("/pbm/bug/category")
@Controller
public class PbmBugCategoryController {
	
	@Autowired
	private IPbmBugCategoryService pbmBugCategoryService;
	
	@RequestMapping("/default")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("pbm/bug/category/default");
		return modelAndView;
	}
	
	@RequestMapping("/new")
	public ModelAndView pageNew() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("pbm/bug/category/new");
		return modelAndView;
	}
	
	@RequestMapping("/edit")
	public ModelAndView pageEdit(String categoryId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotBlank(categoryId)) {
			PbmBugCategory bugCategory = pbmBugCategoryService.findByPrimaryKey(categoryId);
			if(bugCategory != null) {
				
				modelAndView.addObject("bugCategory", bugCategory);
				modelAndView.setViewName("pbm/bug/category/edit");
				
				return modelAndView;
			}
		}
		
		modelAndView.addObject("message", "没有指定需要编辑的项目信息,或项目信息已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/save")
	public RestResponse save(PbmBugCategory pojo) {
		pbmBugCategoryService.save(pojo);
		
		return RestResponse.success("保存项目信息成功!");
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public RestResponse update(PbmBugCategory pojo) {
		pbmBugCategoryService.update(pojo);
		
		return RestResponse.success("更新项目信息成功!");
	}
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<PbmBugCategory> listPage(PbmBugCategory pojoVo, int page, int rows, String sort, String order) {
		PageInfo<PbmBugCategory> retPage = pbmBugCategoryService.findByPage(pojoVo, page, rows, sort, order);
		
		return retPage;
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public RestResponse delete(String[] categoryIds) {
		pbmBugCategoryService.deleteByPrimaryKeys(categoryIds);
		
		return RestResponse.success("删除项目信息成功!");
	}
	
}
