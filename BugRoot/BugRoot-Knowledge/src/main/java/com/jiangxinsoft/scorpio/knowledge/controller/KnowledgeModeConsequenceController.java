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
import com.jiangxinsoft.scorpio.knowledge.model.KnowModeConsequence;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeConsequenceService;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeService;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;

@RequestMapping("/knowledge/mode/consequence")
@Controller
public class KnowledgeModeConsequenceController {
	
	@Autowired
	private IKnowModeConsequenceService knowModeConsequenceService;
	
	@Autowired
	private IKnowModeService iKnowModeService;
	
	@RequestMapping("/default")
	public ModelAndView page(String modeId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotEmpty(modeId)) {
			KnowMode knowMode = iKnowModeService.findByPrimaryKey(modeId);
			
			modelAndView.addObject("knowMode", knowMode);
			modelAndView.setViewName("knowledge/mode/consequence/default1");
			
			return modelAndView;
		}
		modelAndView.setViewName("knowledge/mode/consequence/default");
		return modelAndView;
	}
	
	@RequestMapping("/new")
	public ModelAndView pageNew(String modeId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotEmpty(modeId)) {
			KnowMode knowMode = iKnowModeService.findByPrimaryKey(modeId);
			
			modelAndView.addObject("knowMode", knowMode);
		}		
		modelAndView.setViewName("knowledge/mode/consequence/new");
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping("/save")
	public RestResponse save(KnowModeConsequence pojo) {

		knowModeConsequenceService.save(pojo);
		return RestResponse.success("保存缺陷模式成功!");
	}
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<KnowModeConsequence> listPage(KnowModeConsequence pojoVo, int page, int rows, String sort, String order) {
		PageInfo<KnowModeConsequence> retPage = knowModeConsequenceService.findByPage(pojoVo, page, rows, sort, order);
		
		return retPage;
	}
	
	@RequestMapping("/edit")
	public ModelAndView pageEdit(String consequenceId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotBlank(consequenceId)) {
			KnowModeConsequence knowModeConsequence = knowModeConsequenceService.findByPrimaryKey(consequenceId);
			if(knowModeConsequence != null) {
				modelAndView.addObject("knowModeConsequence", knowModeConsequence);
				modelAndView.setViewName("knowledge/mode/consequence/edit");
				
				return modelAndView;
			}
		}
		
		modelAndView.addObject("message", "没有指定需要编辑的缺陷后果,或缺陷后果已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public RestResponse update(KnowModeConsequence pojo) {
		knowModeConsequenceService.update(pojo);
		
		return RestResponse.success("更新缺陷后果成功!");
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public RestResponse delete(String[] consequenceIds) {
		knowModeConsequenceService.deleteByPrimaryKeys(consequenceIds);
		
		return RestResponse.success("删除缺陷后果成功!");
	}
}
