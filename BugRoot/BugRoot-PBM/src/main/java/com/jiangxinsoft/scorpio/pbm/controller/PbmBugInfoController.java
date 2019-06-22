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
import com.jiangxinsoft.scorpio.pbm.model.PbmBugInfo;
import com.jiangxinsoft.scorpio.pbm.service.IPbmBugInfoService;

@RequestMapping("/pbm/bug/info")
@Controller
public class PbmBugInfoController {
	
	@Autowired
	private IPbmBugInfoService pbmBugInfoService;
	
	@RequestMapping("/default")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("pbm/bug/info/default");
		return modelAndView;
	}
	
	@RequestMapping("/new")
	public ModelAndView pageNew() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("pbm/bug/info/new");
		return modelAndView;
	}
	
	@RequestMapping("/edit")
	public ModelAndView pageEdit(String bugId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotBlank(bugId)) {
			PbmBugInfo pbmBugInfo = pbmBugInfoService.findByPrimaryKey(bugId);
			if(pbmBugInfo != null) {
				modelAndView.addObject("pbmBugInfo", pbmBugInfo);
				modelAndView.setViewName("pbm/bug/info/edit");
				
				return modelAndView;
			}
		}
		
		modelAndView.addObject("message", "没有指定需要编辑的缺陷信息,或缺陷信息已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/save")
	public RestResponse save(PbmBugInfo pojo) {
		pbmBugInfoService.save(pojo);
		
		return RestResponse.success("保存缺陷信息成功!");
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public RestResponse update(PbmBugInfo pojo) {
		pbmBugInfoService.update(pojo);
		
		return RestResponse.success("更新缺陷信息成功!");
	}
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<PbmBugInfo> listPage(PbmBugInfo pojoVo, int page, int rows, String sort, String order) {
		PageInfo<PbmBugInfo> retPage = pbmBugInfoService.findByPage(pojoVo, page, rows, sort, order);
		
		return retPage;
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public RestResponse delete(String[] bugIds) {
		pbmBugInfoService.deleteByPrimaryKeys(bugIds);
		
		return RestResponse.success("删除缺陷类型成功!");
	}
	
}
