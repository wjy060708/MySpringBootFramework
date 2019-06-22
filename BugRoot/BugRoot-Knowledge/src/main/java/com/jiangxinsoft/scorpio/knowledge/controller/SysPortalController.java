
package com.jiangxinsoft.scorpio.knowledge.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jiangxinsoft.scorpio.knowledge.model.KnowMode;
import com.jiangxinsoft.scorpio.knowledge.model.KnowType;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeService;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowTypeService;
import com.jiangxinsoft.scorpio.sys.base.SysCurrentUser;
import com.jiangxinsoft.scorpio.sys.model.SysUser;
import com.jiangxinsoft.scorpio.sys.service.ISysUserService;
import com.jiangxinsoft.scorpio.sys.vo.UserVo;

@Controller
public class SysPortalController {
	@Autowired
	private ISysUserService sysUserService;
	
	@Autowired
	private IKnowModeService iKnowModeService;
	
	@Autowired
	private IKnowTypeService knowTypeService;
	
/*
	@GetMapping("search")
	public String showView(KnowMode knowMode,Model model) {
		SysUser sysUser = sysUserService.getUserById(SysCurrentUser.getUserId());
		
		List<KnowMode> listModes = iKnowModeService.findPre5(knowMode);
		
		model.addAttribute("listModes", listModes);	
		model.addAttribute("userinfo", sysUser);
		
		return "portal/search";
	}
*/
	
	@GetMapping("index1")
	public String showView1(KnowMode knowMode,KnowType knowType , Model model,UserVo userVo) {
		SysUser sysUser = sysUserService.getUserById(SysCurrentUser.getUserId());
		
		List<KnowType> listFirstTypes = knowTypeService.findFirstType(knowType);

		List<KnowMode> listGreatModes = iKnowModeService.findGreat5(knowMode);	
		List<KnowMode> listNewModes = iKnowModeService.findNew5(knowMode);	
		List<SysUser> listUsers = sysUserService.getUserList(userVo);

		model.addAttribute("listGreatModes", listGreatModes);
		model.addAttribute("listNewModes", listNewModes);
		model.addAttribute("listFirstTypes", listFirstTypes);	
		model.addAttribute("userinfo", sysUser);
		
		model.addAttribute("listUsers", listUsers);
		
		return "portal/index1";
	}
	
	@GetMapping("index")
	public String showView1(Model model) {
		SysUser sysUser = sysUserService.getUserById(SysCurrentUser.getUserId());
		
		model.addAttribute("userinfo", sysUser);
		
		return "portal/index";
	}
	
	@GetMapping("main")
	public String main(Model model){
		return "portal/main";
	}
	
}

