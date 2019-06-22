package com.jiangxinsoft.scorpio.epm.controller;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiangxinsoft.scorpio.common.Constants;
import com.jiangxinsoft.scorpio.epm.model.EpmBOMTemplate;
import com.jiangxinsoft.scorpio.epm.service.IEpmBOMTemplateService;
import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;

@RequestMapping("/epm/bom/template")
@Controller
public class EpmBOMTemplateController {
	
	@Autowired
	private IEpmBOMTemplateService epmBOMTemplateService;
	
	@RequestMapping("/default")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("epm/bom/template/default");
		
		return modelAndView;
	}
	
	@RequestMapping("/new")
	public ModelAndView pageNew() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("epm/bom/template/new");
		
		return modelAndView;
	}
	
	@RequestMapping("/edit")
	public ModelAndView pageEdit(String templateId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotBlank(templateId)) {
			EpmBOMTemplate BOMTemplate = epmBOMTemplateService.findByPrimaryKey(templateId);
			if(BOMTemplate != null) {
				modelAndView.addObject("BOMTemplate", BOMTemplate);
				modelAndView.setViewName("epm/bom/template/edit");
				
				return modelAndView;
			}
		}
		
		modelAndView.addObject("message", "没有指定需要编辑的项目模板,或项目模板已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<EpmBOMTemplate> listPage(EpmBOMTemplate pojoVo, int page, int rows, String sort, String order) {
		PageInfo<EpmBOMTemplate> retPage = epmBOMTemplateService.findByPage(pojoVo, page, rows, sort, order);
		
		return retPage;
	}
	
	@ResponseBody
	@RequestMapping("/save")
	public RestResponse save(EpmBOMTemplate pojo) {
		epmBOMTemplateService.save(pojo);
		
		return RestResponse.success("保存项目模板成功!");
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public RestResponse update(EpmBOMTemplate pojo) {
		epmBOMTemplateService.update(pojo);
		
		return RestResponse.success("更新项目模板成功!");
	}
	
	@ResponseBody
	@RequestMapping("/listAll")
	public List<EpmBOMTemplate> listAll(EpmBOMTemplate pojoVo) {
		List<EpmBOMTemplate> list = epmBOMTemplateService.find(pojoVo);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public RestResponse delete(String[] templateIds) {
		epmBOMTemplateService.deleteByPrimaryKeys(templateIds);
		
		return RestResponse.success("删除项目模板成功!");
	}
	
}
