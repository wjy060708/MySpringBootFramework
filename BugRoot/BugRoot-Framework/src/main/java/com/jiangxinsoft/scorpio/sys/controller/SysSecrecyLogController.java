package com.jiangxinsoft.scorpio.sys.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.model.SysLog;
import com.jiangxinsoft.scorpio.sys.service.ISysLogService;
import com.jiangxinsoft.scorpio.sys.vo.LogVo;

@RequestMapping("/sys/log/secrecy")
@Controller
public class SysSecrecyLogController {
	
	@Autowired
	private ISysLogService sysLogService;
	
	@RequestMapping("/default")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sys/log/secrecy/default");
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<SysLog> listPage(LogVo sysLogVo, int page, int rows, String sort, String order) {
		PageInfo<SysLog> retPage = sysLogService.getSecrecyLogPage(sysLogVo, page, rows, sort, order);
		return retPage;
	}
	
}
