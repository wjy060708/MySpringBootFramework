package com.jiangxinsoft.scorpio.knowledge.controller;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;

import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.knowledge.model.KnowMode;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModeContent;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeContentService;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeService;

@RequestMapping("/knowledge/content")
@Controller
public class KnowledgeModeContentController {
	
	@Autowired
	private IKnowModeContentService knowModeContentService;
	
	@Autowired
	private IKnowModeService iKnowModeService;
	
	@RequestMapping("/default")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("knowledge/modeContent/default");
		return modelAndView;
	}
	
	@RequestMapping("/new")
	public ModelAndView pageNew(String modeId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotEmpty(modeId)) {
			KnowMode knowMode = iKnowModeService.findByPrimaryKey(modeId);
			
			modelAndView.addObject("knowMode", knowMode);
		}		
		modelAndView.setViewName("knowledge/content/new");
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping("/save")
	public RestResponse save(KnowModeContent pojo) {
		
		knowModeContentService.save(pojo);
		return RestResponse.success("保存缺陷模式成功!");
	}
	
	@ResponseBody
	@RequestMapping("/listModeContent")
	public List<KnowModeContent> listPage(KnowModeContent pojo) {
		List<KnowModeContent> list = null;

		String modeId = pojo.getModeId();
		System.out.println(modeId);
		if (StringUtils.isNotBlank(modeId)) {
			list = knowModeContentService.find(pojo);
		}

		return list;
	}
}
