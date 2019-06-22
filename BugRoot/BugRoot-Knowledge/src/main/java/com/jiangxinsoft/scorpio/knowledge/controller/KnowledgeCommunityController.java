package com.jiangxinsoft.scorpio.knowledge.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/knowledge/community")
@Controller
public class KnowledgeCommunityController {
	
	@RequestMapping("/default")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("knowledge/community/default");
		return modelAndView;
	}
	
	@RequestMapping("/qa")
	public ModelAndView pageNew() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("knowledge/community/qa");
		return modelAndView;
	}
	
}
