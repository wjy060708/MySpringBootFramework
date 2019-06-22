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
import com.jiangxinsoft.scorpio.epm.service.IEpmProjectInfoService;
import com.jiangxinsoft.scorpio.epm.vo.ProjectInfoVo;
import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;

@RequestMapping("/epm/project/info")
@Controller
public class EpmProjectInfoController {
	
	@Autowired
	private IEpmProjectInfoService epmProjectInfoService;
	
	@RequestMapping("/default")
	public ModelAndView page(String projectId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotEmpty(projectId)) {
			ProjectInfoVo projectInfoVo = epmProjectInfoService.findByPrimaryKey(projectId);
			modelAndView.addObject(projectInfoVo);
			
			modelAndView.setViewName("epm/project/info/default1");
			return modelAndView;
		}else{
			modelAndView.setViewName("epm/project/info/default");
			
			return modelAndView;
		}
	}
	
	@RequestMapping("/new")
	public ModelAndView pageNew() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("epm/project/info/new");
		
		return modelAndView;
	}
	
	@RequestMapping("/test")
	public ModelAndView pageTest() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("epm/project/info/test");
		
		return modelAndView;
	}
	
	@RequestMapping("/manage")
	public ModelAndView pageManage(String projectId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotEmpty(projectId)) {
			ProjectInfoVo projectInfoVo = epmProjectInfoService.findByPrimaryKey(projectId);
			modelAndView.addObject(projectInfoVo);
		}
		modelAndView.setViewName("epm/project/manage");
		
		return modelAndView;
	}
	
	@RequestMapping("/edit")
	public ModelAndView pageEdit(String projectId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotBlank(projectId)) {
			EpmProjectInfo projectInfo = epmProjectInfoService.findByPrimaryKey(projectId);
			if(projectInfo != null) {
				
				modelAndView.addObject("projectInfo", projectInfo);
				modelAndView.setViewName("epm/project/info/edit");
				
				return modelAndView;
			}
		}
		
		modelAndView.addObject("message", "没有指定需要编辑的项目信息,或项目信息已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/save")
	public RestResponse save(ProjectInfoVo pojo) {
		epmProjectInfoService.save(pojo);
		
		return RestResponse.success("保存项目信息成功!");
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public RestResponse update(ProjectInfoVo pojo) {
		epmProjectInfoService.update(pojo);
		
		return RestResponse.success("更新项目信息成功!");
	}
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<ProjectInfoVo> listPage(ProjectInfoVo pojoVo, int page, int rows, String sort, String order) {
		PageInfo<ProjectInfoVo> retPage = epmProjectInfoService.findByPage(pojoVo, page, rows, sort, order);
		
		return retPage;
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public RestResponse delete(String[] projectIds) {
		epmProjectInfoService.deleteByPrimaryKeys(projectIds);
		
		return RestResponse.success("删除项目信息成功!");
	}
	
	@ResponseBody
	@RequestMapping("/projectStart")
	public RestResponse startProject(String projectId) {
		epmProjectInfoService.updateProjectPublishStatus(projectId);
		
		return RestResponse.success("项目发布成功");
	}
	
	@ResponseBody
	@RequestMapping("/projectStop")
	public RestResponse stopProject(String projectId) {
		epmProjectInfoService.updateProjectStopStatus(projectId);
		
		return RestResponse.success("项目挂起成功");
	}
	
	@ResponseBody
	@RequestMapping("/projectFinish")
	public RestResponse finishProject(String projectId) {
		epmProjectInfoService.updateProjectFinishStatus(projectId);
		
		return RestResponse.success("项目完成成功");
	}
	
	
	@ResponseBody
	@RequestMapping("/listGroupProject")
	public List<ProjectInfoVo> listGroupProject(ProjectInfoVo pojo) {
		List<ProjectInfoVo> list = null;
		
		String groupId = pojo.getGroupId();
		if(StringUtils.isNotBlank(groupId)) {
			list = epmProjectInfoService.find(pojo);;
		}

		return list;
	}
	
	@ResponseBody
	@RequestMapping("/listAll")
	public List<ProjectInfoVo> listAll(ProjectInfoVo pojo) {
		List<ProjectInfoVo> list = epmProjectInfoService.find(pojo);;
	
		return list;
	}
	
}
