package com.jiangxinsoft.scorpio.knowledge.controller;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;

import com.jiangxinsoft.scorpio.common.Constants;
import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.knowledge.model.KnowMode;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModePrevention;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModeReason;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModePreventionService;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeService;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;

@RequestMapping("/knowledge/mode/prevention")
@Controller
public class KnowledgeModePreventionController {
	
	@Autowired
	private IKnowModePreventionService knowModePreventionService;
	
	@Autowired
	private IKnowModeService iKnowModeService;
	
	@RequestMapping("/default")
	public ModelAndView page(String modeId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotEmpty(modeId)) {
			KnowMode knowMode = iKnowModeService.findByPrimaryKey(modeId);
			
			modelAndView.addObject("knowMode", knowMode);
			modelAndView.setViewName("knowledge/mode/prevention/default1");
			
			return modelAndView;
		}
		
		modelAndView.setViewName("knowledge/mode/prevention/default");
		return modelAndView;
	}
	
	@RequestMapping("/new")
	public ModelAndView pageNew(String modeId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotEmpty(modeId)) {
			KnowMode knowMode = iKnowModeService.findByPrimaryKey(modeId);
			
			modelAndView.addObject("knowMode", knowMode);
		}		
		modelAndView.setViewName("knowledge/mode/prevention/new");
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping("/save")
	public RestResponse save(KnowModePrevention pojo) {
		
		knowModePreventionService.save(pojo);
		return RestResponse.success("保存缺陷模式成功!");
	}
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<KnowModePrevention> listPage(KnowModePrevention pojoVo, int page, int rows, String sort, String order) {
		PageInfo<KnowModePrevention> retPage = knowModePreventionService.findByPage(pojoVo, page, rows, sort, order);
		
		return retPage;
	}
	
	@RequestMapping("/edit")
	public ModelAndView pageEdit(String preventionId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotBlank(preventionId)) {
			KnowModePrevention knowModePrevention = knowModePreventionService.findByPrimaryKey(preventionId);
			if(knowModePrevention != null) {
				modelAndView.addObject("knowModePrevention", knowModePrevention);
				modelAndView.setViewName("knowledge/mode/prevention/edit");
				
				return modelAndView;
			}
		}
		
		modelAndView.addObject("message", "没有指定需要编辑的缺陷预防,或缺陷预防已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public RestResponse update(KnowModePrevention pojo) {
		knowModePreventionService.update(pojo);
		
		return RestResponse.success("更新缺陷预防成功!");
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public RestResponse delete(String[] preventionIds) {
		knowModePreventionService.deleteByPrimaryKeys(preventionIds);
		
		return RestResponse.success("删除缺陷预防成功!");
	}
}
