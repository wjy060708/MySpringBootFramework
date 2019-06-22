package com.jiangxinsoft.scorpio.knowledge.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;

import com.jiangxinsoft.scorpio.knowledge.model.KnowMode;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModePrivate;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModePrivateService;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeService;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.base.SysCurrentUser;
import com.jiangxinsoft.scorpio.sys.model.SysUser;
import com.jiangxinsoft.scorpio.sys.service.ISysUserService;

@RequestMapping("/knowledge/user")
@Controller
public class KnowledgeUserController {
	

	@Autowired
	private IKnowModeService iKnowModeService;
	
	@Autowired
	private IKnowModePrivateService iKnowModePrivateService;
	
	@Autowired
	private ISysUserService sysUserService;
	
	@RequestMapping("/home")
	public ModelAndView pagePublish() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("knowledge/user/home");
		return modelAndView;
	}
	
	@RequestMapping("/base")
	public ModelAndView pageBase(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
	    Object author =  session.getAttribute("org.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEY");
		List<KnowMode>  knowModes = iKnowModeService.findByAuthor(author+"");
		String userId = sysUserService.getUserByUsername(author+"").getUserId();
		List<KnowModePrivate>  knowModePrivates = iKnowModePrivateService.findByUser(userId);
		
		int countMyModes = knowModes.size();
		int countMyPrivate = knowModePrivates.size();
		int maxMyModes = countMyModes;
		int maxMyPraivate = countMyPrivate;
		if(maxMyModes > 10) {
			maxMyModes = 10;
		} 
		
		if(maxMyPraivate > 10) {
			maxMyPraivate = 10;
		} 

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("countMyModes", countMyModes);	
		modelAndView.addObject("countMyPrivate", countMyPrivate);
		modelAndView.addObject("knowModes", knowModes.subList(0, maxMyModes));	
		modelAndView.addObject("knowModePrivates", knowModePrivates.subList(0,maxMyPraivate));	
		modelAndView.setViewName("knowledge/user/base");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<KnowMode> listPage(KnowMode pojoVo, int page, int rows, String sort, String order,HttpServletRequest request) {
		HttpSession session = request.getSession();
	    Object author =  session.getAttribute("org.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEY");
	    pojoVo.setAuthor(author+"");
		PageInfo<KnowMode> retPage = iKnowModeService.findByPage(pojoVo, page, rows, sort, order);
		return retPage;
	}
	
	@ResponseBody
	@RequestMapping("/listPagePrivate")
	public PageInfo<KnowModePrivate> listPagePrivate(KnowModePrivate pojoVo, int page, int rows, String sort, String order,HttpServletRequest request) {
		HttpSession session = request.getSession();
	    Object author =  session.getAttribute("org.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEY");
	    String userId = sysUserService.getUserByUsername(author+"").getUserId();
	    pojoVo.setUserId(userId);
	    
		PageInfo<KnowModePrivate> retPage = iKnowModePrivateService.findByPage(pojoVo, page, rows, sort, order);
		return retPage;
	}
	
	@RequestMapping("/document")
	public ModelAndView pageDocument() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("knowledge/user/document");
		return modelAndView;
	}
	
	@RequestMapping("/theme")
	public ModelAndView pageTheme() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("knowledge/user/theme");
		return modelAndView;
	}
	
	@RequestMapping("/our")
	public ModelAndView pageOur() {
		SysUser user = sysUserService.getUserById(SysCurrentUser.getUserId());
		String userIcon = user.getUserIcon();
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userIcon",userIcon);
		modelAndView.setViewName("knowledge/user/our");
		return modelAndView;
	}
	
	@RequestMapping("/private")
	public ModelAndView pagePrivate() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("knowledge/user/private");
		return modelAndView;
	}
	
	

}
