package com.jiangxinsoft.scorpio.knowledge.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 上传图片
 * @author Administrator
 *
 */
@RequestMapping("/knowledge/help")
@Controller
public class HelpCenterontroller {
	
	@RequestMapping("/default")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("knowledge/user/default");
		return modelAndView;
	}
	
	@RequestMapping("/authorRight")
	public ModelAndView pageAuthorRight() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("knowledge/user/authorRight");
		return modelAndView;
	}
	
	@RequestMapping("/downloadInstruction")
	public ModelAndView pageDownload() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("knowledge/user/downloadInstruction");
		return modelAndView;
	}
	
	@RequestMapping("/contactUs")
	public ModelAndView pageContactUs() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("knowledge/user/contactUs");
		return modelAndView;
	}
	
	@RequestMapping("/aboutCompany")
	public ModelAndView pageAboutCompany() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("knowledge/user/aboutCompany");
		return modelAndView;
	}
	
	@RequestMapping("/aboutUs")
	public ModelAndView pageAboutUs() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("knowledge/user/aboutUs");
		return modelAndView;
	}
}
