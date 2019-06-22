package com.jiangxinsoft.scorpio.sys.controller;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SysExceptionController {
	
	@RequestMapping("/ajax-unauthorized")
	public ModelAndView ajaxUnauthorized(ServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		
		// 未授权
		((HttpServletResponse)response).setHeader("Ajax-Response-Header", "unAuthorized");
		modelAndView.addObject("message", "用户未授权!");
		modelAndView.setViewName("error/ajax-error");
		
		return modelAndView;
	}
	
	@RequestMapping("/ajax-error")
	public ModelAndView ajaxError(String message, ServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotBlank(message)) {
			modelAndView.addObject("message", message);
		} else {
			modelAndView.addObject("message", "操作异常!");
		}
		
		modelAndView.setViewName("error/ajax-error");
		
		return modelAndView;
	}
	
	@RequestMapping("/http-unauthorized")
	public ModelAndView httpUnauthorized() {
		ModelAndView modelAndView = new ModelAndView();
		
		// 未授权
		modelAndView.addObject("message", "抱歉,您未被授权进行该操作!");
		modelAndView.setViewName("error/http-error");
		
		return modelAndView;
	}
	
	@RequestMapping("/http-error")
	public ModelAndView httpError(String message) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotBlank(message)) {
			modelAndView.addObject("message", message);
		} else {
			modelAndView.addObject("message", "操作异常!");
		}
		modelAndView.setViewName("error/http-error");
		
		return modelAndView;
	}
}
