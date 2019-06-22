package com.jiangxinsoft.scorpio.knowledge.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import com.jiangxinsoft.scorpio.knowledge.model.KnowMode;
import com.jiangxinsoft.scorpio.knowledge.model.KnowType;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeService;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowTypeService;

@RequestMapping("/knowledge/box")
@Controller
public class KnowledgeBoxController {
	
	@Autowired
	private IKnowModeService iKnowModeService;
	
	@Autowired
	private IKnowTypeService knowTypeService;
	
	@RequestMapping("/default")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("knowledge/box/default");
		return modelAndView;
	}
	
	@RequestMapping("/new")
	public ModelAndView pageNew() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("knowledge/box/new");
		return modelAndView;
	}
	
	@RequestMapping("/index")
	public ModelAndView pageIndex(String parentId,String typeId) {
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("parentId",parentId);
		modelAndView.addObject("typeId",typeId);
		modelAndView.setViewName("knowledge/box/index");
		return modelAndView;
	}
	
	@RequestMapping("/search")
	public ModelAndView pageSearch(String word,KnowType knowType) {
		
		ModelAndView modelAndView = new ModelAndView();
		List<KnowType> listFirstTypes = knowTypeService.findFirstType(knowType);
		Map<String, List<KnowType>> map = new HashMap<String, List<KnowType>>();
		
		for (int i = 0; i < listFirstTypes.size(); i++) {
			String typeName = listFirstTypes.get(i).getTypeName();
			String parentId = listFirstTypes.get(i).getTypeId();
			
			List<KnowType> listSecondTypes = knowTypeService.findByPrarentKey(parentId);
			map.put(typeName, listSecondTypes);
		}
		
		modelAndView.addObject("map", map);
		modelAndView.addObject("listFirstTypes", listFirstTypes);
		modelAndView.addObject("word", word);
		modelAndView.setViewName("knowledge/box/search");
		
		return modelAndView;
	}
	
	@RequestMapping("/searchDetails")
	public ModelAndView pageSearchDetails(String word) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("knowledge/box/searchDetails");
		
		return modelAndView;
	}
	
//	@RequestMapping("/list")
//	public ModelAndView pageList(KnowMode knowMode) {
//		ModelAndView modelAndView = new ModelAndView();
//		
//		List<KnowMode> listModes = iKnowModeService.findPre5(knowMode);
//	
//		modelAndView.addObject("listModes", listModes);
//		modelAndView.setViewName("knowledge/box/list");
//		
//		return modelAndView;
//	}
}
