package com.jiangxinsoft.scorpio.sys.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jiangxinsoft.scorpio.sys.base.SysCurrentUser;
import com.jiangxinsoft.scorpio.sys.model.SysModule;
import com.jiangxinsoft.scorpio.sys.model.SysRolePage;
import com.jiangxinsoft.scorpio.sys.service.ISysModulePageService;
import com.jiangxinsoft.scorpio.sys.service.ISysModuleService;
import com.jiangxinsoft.scorpio.sys.vo.RolePageVo;

@RequestMapping("/sys/navigation")
@Controller
public class SysNavigationController {
	
	@Autowired
	private ISysModuleService sysModuleService;
	
	@Autowired
	private ISysModulePageService sysModulePageService;
	
	@ResponseBody
	@RequestMapping("/listModules")
	public List<SysModule> listMySystem(HttpSession httpSession) {
		List<SysModule> list = sysModuleService.getModulesForLoginUser(SysCurrentUser.getUserId());
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/listPages")
	public List<SysRolePage> listModules(String moduleId) {
		List<SysRolePage> list = null;
		
		if(StringUtils.isNotBlank(moduleId)) {
			RolePageVo rolePageVo = new RolePageVo();
			rolePageVo.setUserId(SysCurrentUser.getUserId());
			rolePageVo.setModuleId(moduleId);
			list = sysModulePageService.getUserModuleList(rolePageVo);
			
			return list;
		} else {
			return new ArrayList<SysRolePage>();
		}
	}
	
}
