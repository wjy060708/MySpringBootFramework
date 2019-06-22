package com.jiangxinsoft.scorpio.epm.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiangxinsoft.scorpio.epm.service.IEpmProjectInfoService;
import com.jiangxinsoft.scorpio.epm.vo.ProjectInfoVo;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;

@RequestMapping("/epm/my/project")
@Controller
public class EpmMyProjectController {
	
	@Autowired
	private IEpmProjectInfoService epmProjectInfoService;
	
	@RequestMapping("/default")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();	
		modelAndView.setViewName("epm/my/project/default");
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/listMyProject")
	public PageInfo<ProjectInfoVo> listPage(ProjectInfoVo pojoVo, int page, int rows, String sort, String order) {
		PageInfo<ProjectInfoVo> retPage = epmProjectInfoService.findPublishProject(pojoVo, page, rows, sort, order);
		
		return retPage;
	}
	
	@RequestMapping("/manage")
	public ModelAndView pageManage(String projectId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotEmpty(projectId)) {
			ProjectInfoVo projectInfoVo = epmProjectInfoService.findByPrimaryKey(projectId);
			modelAndView.addObject(projectInfoVo);
		}
		modelAndView.setViewName("epm/my/manage");
		
		return modelAndView;
	}
	
}
