package com.jiangxinsoft.scorpio.epm.controller;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiangxinsoft.scorpio.common.Constants;
import com.jiangxinsoft.scorpio.epm.model.EpmProjectInfo;
import com.jiangxinsoft.scorpio.epm.model.EpmTaskInfo;
import com.jiangxinsoft.scorpio.epm.service.IEpmProjectInfoService;
import com.jiangxinsoft.scorpio.epm.service.IEpmTaskInfoService;
import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;

@RequestMapping("/epm/task/info")
@Controller
public class EpmTaskInfoController {
	
	@Autowired
	private IEpmTaskInfoService epmTaskInfoService;
	
	@Autowired
	private IEpmProjectInfoService epmProjectInfoService;
	
	@RequestMapping("/default")
	public ModelAndView page(String projectId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotEmpty(projectId)) {
			EpmProjectInfo epmProjectInfo = epmProjectInfoService.findByPrimaryKey(projectId);
			modelAndView.addObject(epmProjectInfo);
		}		
		modelAndView.setViewName("epm/task/info/default");
		
		return modelAndView;
	}
	
	@RequestMapping("/new")
	public ModelAndView pageNew(String projectId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotEmpty(projectId)) {
			EpmProjectInfo epmProjectInfo = epmProjectInfoService.findByPrimaryKey(projectId);
			
			modelAndView.addObject(epmProjectInfo);	
			modelAndView.setViewName("epm/task/info/new1");
			
			return modelAndView;
		}else{
			modelAndView.setViewName("epm/task/info/new");
			
			return modelAndView;
		}
		
	}
	
	@RequestMapping("/edit")
	public ModelAndView pageEdit(String taskId,String projectId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotBlank(taskId)) {
			EpmTaskInfo epmTaskInfo = epmTaskInfoService.findByPrimaryKey(taskId);
			if(epmTaskInfo != null) {
				if(StringUtils.isNotBlank(projectId)) {
					modelAndView.addObject("epmTaskInfo", epmTaskInfo);
					modelAndView.setViewName("epm/task/info/edit1");
					
					return modelAndView;
				}else{
					modelAndView.addObject("epmTaskInfo", epmTaskInfo);
					modelAndView.setViewName("epm/task/info/edit");
					
					return modelAndView;
				}
				
			}
		}
		
		modelAndView.addObject("message", "没有指定需要编辑的项目计划,或项目计划已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public RestResponse update(EpmTaskInfo pojo) {
		epmTaskInfoService.update(pojo);
		
		return RestResponse.success("更新项目计划成功!");
	}
	
	@ResponseBody
	@RequestMapping("/save")
	public RestResponse save(EpmTaskInfo pojo) {
		epmTaskInfoService.save(pojo);
		
		return RestResponse.success("保存项目计划成功!");
	}
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<EpmTaskInfo> listPage(EpmTaskInfo pojoVo, int page, int rows, String sort, String order) {
		PageInfo<EpmTaskInfo> retPage = epmTaskInfoService.findByPage(pojoVo, page, rows, sort, order);
		
		return retPage;
	}
	
	@ResponseBody
	@RequestMapping("/listProjectTasks")
	public List<EpmTaskInfo> listAll(EpmTaskInfo pojoVo) {
		List<EpmTaskInfo> list = epmTaskInfoService.find(pojoVo);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public RestResponse delete(String taskId) {
		epmTaskInfoService.deleteByPrimaryKey(taskId);
		
		return RestResponse.success("删除项目计划成功!");
	}
	
}
