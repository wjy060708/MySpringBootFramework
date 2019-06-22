package com.jiangxinsoft.scorpio.sys.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.ConcurrentAccessException;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.ExpiredCredentialsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.subject.Subject;

import com.google.common.collect.Maps;
import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.sys.constants.SysConstants;
import com.jiangxinsoft.scorpio.sys.model.SysUser;
import com.jiangxinsoft.scorpio.sys.service.ISysUserService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SysLoginController {
	
	@Autowired
	private ISysUserService sysUserService;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(SysLoginController.class);
	
	@GetMapping("login")
	public String login(HttpServletRequest request) {
		LOGGER.info("跳到这边的路径为:" + request.getRequestURI());
		Subject s = SecurityUtils.getSubject();
		LOGGER.info("是否记住登录--->" + s.isRemembered() + "<-----是否有权限登录----->" + s.isAuthenticated() + "<----");
		if (s.isAuthenticated()) {
			return "redirect:/search.htm";
		} else {
			return "login";
		}
	}
	
	@PostMapping("login/main")
	@ResponseBody
	public RestResponse loginMain(HttpServletRequest request) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String rememberMe = request.getParameter("rememberMe");
		
		if(StringUtils.isBlank(username) || StringUtils.isBlank(password)){
			return RestResponse.failure("用户名或者密码不能为空");
		}
		
		if(StringUtils.isBlank(rememberMe)){
			return RestResponse.failure("记住我不能为空");
		}
		
		Map<String,Object> map = Maps.newHashMap();
		String error = null;
		HttpSession session = request.getSession();
		if(session == null){
			return RestResponse.failure("session超时");
		}
		
		/*就是代表当前的用户。*/
		Subject user = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(username, password, Boolean.valueOf(rememberMe));
		
		try {
			user.login(token);
			if (user.isAuthenticated()) {
				SysUser sysUser = sysUserService.getUserByUsername(token.getUsername());
				String userKind = sysUser.getUserKind();
			    if (userKind.equals(SysConstants.USER_KIND_COMMON)) {			
					map.put("url", "index1.htm");
				} 
			    else {
					map.put("url", "index.htm");
				}
			}
		}catch (IncorrectCredentialsException e) {
			error = "登录密码错误.";
		} catch (ExcessiveAttemptsException e) {
			error = "登录失败次数过多";
		} catch (LockedAccountException e) {
			error = "帐号已被锁定.";
		} catch (DisabledAccountException e) {
			error = "帐号已被禁用.";
		} catch (ConcurrentAccessException e) {
			error = "帐号未激活.";
		} catch (ExpiredCredentialsException e) {
			error = "帐号已过期.";
		} catch (UnknownAccountException e) {
			error = "帐号不存在";
		} catch (UnauthorizedException e) {
			error = "您没有得到相应的授权！";
		}
		
		if(StringUtils.isBlank(error)){
			return RestResponse.success("登录成功").setData(map);
		}else{
			return RestResponse.failure(error);
		}
	}
	
	/**
	 *  空地址请求
	 * @return
	 */
	@GetMapping(value = "")
	public String index() {
		Subject s = SecurityUtils.getSubject();
		return s.isAuthenticated() ? "redirect:/index.htm" : "login.htm";
	}
	
	@GetMapping("logout")
	public String logOut(){
		SecurityUtils.getSubject().logout();
		return "redirect:/login.htm";
	}
}
