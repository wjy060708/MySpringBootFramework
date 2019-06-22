package com.jiangxinsoft.scorpio.sys.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import org.apache.commons.lang3.StringUtils;

import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.base.SysCurrentUser;
import com.jiangxinsoft.scorpio.sys.model.SysUser;
import com.jiangxinsoft.scorpio.sys.service.ISysUserService;
import com.jiangxinsoft.scorpio.sys.vo.RoleMemberVo;
import com.jiangxinsoft.scorpio.sys.vo.UserVo;

@RequestMapping("/sys/user")
@Controller
public class SysUserController {
	
	@Autowired
	private ISysUserService sysUserService;
	
	@GetMapping("userInfo")
	public String userInfo(Model model) {
		SysUser sysUser = sysUserService.getUserById(SysCurrentUser.getUserId());
		model.addAttribute("userinfo", sysUser);
		return "sys/user/userInfo";
	}
	
	@RequestMapping("/editpwd")
	public ModelAndView pageEditPassword() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sys/user/editpwd");
		return modelAndView;
	}
	
	@RequestMapping("/singleDialog")
	public ModelAndView pageSingleDialog() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sys/user/singleDialog");
		return modelAndView;
	}
	
	@RequestMapping("/multiDialog")
	public ModelAndView pageMultiDialog() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sys/user/multiDialog");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<SysUser> listPage(RoleMemberVo roleMemberVo, int page, int rows, String sort, String order) {
		PageInfo<SysUser> retPage = null;
		String roleId = roleMemberVo.getRoleId();
		
		if(StringUtils.isNotBlank(roleId)) {
			retPage = sysUserService.getMemberPage(roleMemberVo, page, rows, sort, order);
		} else {
			retPage = sysUserService.getUserPage(roleMemberVo, page, rows, sort, order);
		}
		
		return retPage;
	}
	
	@ResponseBody
	@RequestMapping("/listUser")
	public List<SysUser> listUser(UserVo userVo) {		
		 List<SysUser> list = sysUserService.getUserList(userVo);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/modifyPassword")
	public RestResponse modifyPassword(String oldPassword, String newPassword1, String newPassword2) {
		
		if(StringUtils.isBlank(oldPassword)) {
			throw new OperationException("修改密码失败,原密码不能为空!");
		}
		if(StringUtils.isBlank(newPassword1)) {
			throw new OperationException("修改密码失败,新密码不能为空!");
		}
        if(StringUtils.isBlank(newPassword2)){
            return RestResponse.failure("修改密码失败,确认密码不能为空");
        }
        if(!newPassword2.equals(newPassword1)){
            return RestResponse.failure("修改密码失败,确认密码与新密码不一致");
        }
		
        sysUserService.updateUserPassword(SysCurrentUser.getUserId(), oldPassword, newPassword1);
		
		return RestResponse.success("修改密码成功!");
	}
	
	@ResponseBody
	@PostMapping("saveUserinfo")
    public RestResponse saveUserInfo(SysUser user) {
		sysUserService.updateUser(user);
        
        return RestResponse.success("更改个人资料成功!");
    }
}
