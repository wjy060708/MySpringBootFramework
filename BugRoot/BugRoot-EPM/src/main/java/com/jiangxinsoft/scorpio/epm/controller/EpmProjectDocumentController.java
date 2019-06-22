package com.jiangxinsoft.scorpio.epm.controller;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiangxinsoft.scorpio.common.Constants;
import com.jiangxinsoft.scorpio.epm.model.EpmProjectDocument;
import com.jiangxinsoft.scorpio.epm.model.EpmProjectInfo;
import com.jiangxinsoft.scorpio.epm.service.IEpmProjectDocumentService;
import com.jiangxinsoft.scorpio.epm.service.IEpmProjectInfoService;
import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;

@RequestMapping("/epm/project/document")
@Controller
public class EpmProjectDocumentController {
	
	@Autowired
	private IEpmProjectDocumentService epmProjectDocumentService;
	
	@Autowired
	private IEpmProjectInfoService epmProjectInfoService;
	
	@RequestMapping("/default")
	public ModelAndView page(String projectId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotEmpty(projectId)) {
			EpmProjectInfo epmProjectInfo = epmProjectInfoService.findByPrimaryKey(projectId);
			modelAndView.addObject(epmProjectInfo);
		}
		
		modelAndView.setViewName("epm/project/document/default");
		
		return modelAndView;
	}
	
	@RequestMapping("/new")
	public ModelAndView pageNew(String projectId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotEmpty(projectId)) {
			EpmProjectInfo epmProjectInfo = epmProjectInfoService.findByPrimaryKey(projectId);
			modelAndView.addObject(epmProjectInfo);	
			modelAndView.setViewName("epm/project/document/new1");
			
			return modelAndView;
		}else{
			modelAndView.setViewName("epm/project/document/new");
			
			return modelAndView;
		}
	}
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<EpmProjectDocument> listPage(EpmProjectDocument pojoVo, int page, int rows, String sort, String order) {
		PageInfo<EpmProjectDocument> retPage = epmProjectDocumentService.findByPage(pojoVo, page, rows, sort, order);
		
		return retPage;
	}
	
	@ResponseBody
	@RequestMapping("/listProjectDocument")
	public List<EpmProjectDocument> listProjectTasks(EpmProjectDocument pojoVo) {
		List<EpmProjectDocument> list = epmProjectDocumentService.find(pojoVo);
		
		return list;
	}
	
	@RequestMapping("/edit")
	public ModelAndView pageEdit(String documentId,String projectId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotBlank(documentId)) {
			EpmProjectDocument epmProjectDocument = epmProjectDocumentService.findByPrimaryKey(documentId);
			if(epmProjectDocument != null) {
				if(StringUtils.isNotBlank(projectId)){
					modelAndView.addObject("epmProjectDocument", epmProjectDocument);
					modelAndView.setViewName("epm/project/document/edit1");
				
					return modelAndView;
				}else{
					modelAndView.addObject("epmProjectDocument", epmProjectDocument);
					modelAndView.setViewName("epm/project/document/edit");
				
					return modelAndView;
				}
					
			}
		}
		
		modelAndView.addObject("message", "没有指定需要编辑的项目文档,或项目文档已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/save")
	public RestResponse save(EpmProjectDocument pojo) {
		epmProjectDocumentService.save(pojo);
		
		return RestResponse.success("保存项目文档成功!");
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public RestResponse update(EpmProjectDocument pojo) {
		epmProjectDocumentService.update(pojo);
		
		return RestResponse.success("更新项目文档成功!");
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public RestResponse delete(String[] documentIds) {
		epmProjectDocumentService.deleteByPrimaryKeys(documentIds);
		
		return RestResponse.success("删除项目文档成功!");
	}
	

}
