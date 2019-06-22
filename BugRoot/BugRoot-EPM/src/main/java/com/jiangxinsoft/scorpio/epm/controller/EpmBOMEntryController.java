package com.jiangxinsoft.scorpio.epm.controller;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiangxinsoft.scorpio.common.Constants;
import com.jiangxinsoft.scorpio.epm.model.EpmBOMEntry;
import com.jiangxinsoft.scorpio.epm.model.EpmProjectInfo;
import com.jiangxinsoft.scorpio.epm.service.IEpmBOMEntryService;
import com.jiangxinsoft.scorpio.epm.service.IEpmProjectInfoService;
import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;

@RequestMapping("/epm/bom/entry")
@Controller
public class EpmBOMEntryController {
	
	@Autowired
	private IEpmBOMEntryService epmBOMEntryService;
	
	@Autowired
	private IEpmProjectInfoService epmProjectInfoService;
	
	@RequestMapping("/default")
	public ModelAndView page(String projectId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotEmpty(projectId)) {
			EpmProjectInfo epmProjectInfo = epmProjectInfoService.findByPrimaryKey(projectId);
			
			modelAndView.addObject(epmProjectInfo);
			modelAndView.setViewName("epm/bom/entry/default1");	
			
			return modelAndView;
		}
		
		modelAndView.setViewName("epm/bom/entry/default");
		
		return modelAndView;
	}
	
	@RequestMapping("/new")
	public ModelAndView pageNew() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("epm/bom/entry/new");
	
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/listTemplateEntrys")
	public List<EpmBOMEntry> listTemplateEntrys(EpmBOMEntry pojo) {	
		List<EpmBOMEntry> list = null;
		
		String templateId = pojo.getTemplateId();
		if(StringUtils.isNotBlank(templateId)) {
			list = epmBOMEntryService.find(pojo);;
		}
		
		return list;	
	}
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<EpmBOMEntry> listPage(EpmBOMEntry pojoVo, int page, int rows, String sort, String order) {
		PageInfo<EpmBOMEntry> retPage = epmBOMEntryService.findByPage(pojoVo, page, rows, sort, order);
		
		return retPage;
	}
	
	@RequestMapping("/edit")
	public ModelAndView pageEdit(String entryId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotBlank(entryId)) {
			EpmBOMEntry epmBOMEntry = epmBOMEntryService.findByPrimaryKey(entryId);
			if(epmBOMEntry != null) {
				modelAndView.addObject("epmBOMEntry", epmBOMEntry);
				modelAndView.setViewName("epm/bom/entry/edit");
				
				return modelAndView;
			}
		}
		
		modelAndView.addObject("message", "没有指定需要编辑的项目产品清单,或项目产品清单已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/save")
	public RestResponse save(EpmBOMEntry pojo) {
		epmBOMEntryService.save(pojo);
		
		return RestResponse.success("保存项目产品清单成功!");
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public RestResponse update(EpmBOMEntry pojo) {
		epmBOMEntryService.update(pojo);
		
		return RestResponse.success("更新项目产品清单成功!");
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public RestResponse delete(String entryId) {
		epmBOMEntryService.deleteByPrimaryKey(entryId);
		
		return RestResponse.success("删除项目产品清单成功!");
	}

}
