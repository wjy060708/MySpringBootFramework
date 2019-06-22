package com.jiangxinsoft.scorpio.knowledge.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;

import com.jiangxinsoft.scorpio.common.Constants;
import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.knowledge.model.KnowMode;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModeReason;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeReasonService;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeService;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;

@RequestMapping("/knowledge/mode/reason")
@Controller
public class KnowledgeModeReasonController {
	
	@Autowired
	private IKnowModeReasonService knowModeReasonService;
	
	@Autowired
	private IKnowModeService iKnowModeService;
	
	@RequestMapping("/default")
	public ModelAndView page(String modeId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotEmpty(modeId)) {
			KnowMode knowMode = iKnowModeService.findByPrimaryKey(modeId);
			
			modelAndView.addObject("knowMode", knowMode);
			modelAndView.setViewName("knowledge/mode/reason/default1");
			
			return modelAndView;
		}
		modelAndView.setViewName("knowledge/mode/reason/default");
		return modelAndView;
	}
	
	@RequestMapping("/new")
	public ModelAndView pageNew(String modeId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotEmpty(modeId)) {
			KnowMode knowMode = iKnowModeService.findByPrimaryKey(modeId);
			
			modelAndView.addObject("knowMode", knowMode);
		}		
		modelAndView.setViewName("knowledge/mode/reason/new");
		return modelAndView;
	}
	
	@RequestMapping("/edit")
	public ModelAndView pageEdit(String reasonId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotBlank(reasonId)) {
			KnowModeReason knowModeReason = knowModeReasonService.findByPrimaryKey(reasonId);
			if(knowModeReason != null) {
				modelAndView.addObject("knowModeReason", knowModeReason);
				modelAndView.setViewName("knowledge/mode/reason/edit");
				
				return modelAndView;
			}
		}
		
		modelAndView.addObject("message", "没有指定需要编辑的项目模板,或项目模板已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping("/save")
	public RestResponse save(KnowModeReason pojo) {
		
		knowModeReasonService.save(pojo);
		return RestResponse.success("保存缺陷模式成功!");
	}

	@ResponseBody
	@RequestMapping("/update")
	public RestResponse update(KnowModeReason pojo) {
		knowModeReasonService.update(pojo);
		
		return RestResponse.success("更新缺陷原因成功!");
	}
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<KnowModeReason> listPage(KnowModeReason pojoVo, int page, int rows, String sort, String order) {
		PageInfo<KnowModeReason> retPage = knowModeReasonService.findByPage(pojoVo, page, rows, sort, order);
		
		return retPage;
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public RestResponse delete(String[] reasonIds) {
		knowModeReasonService.deleteByPrimaryKeys(reasonIds);
		
		return RestResponse.success("删除缺陷原因成功!");
	}
}
