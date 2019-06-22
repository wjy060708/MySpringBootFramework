package com.jiangxinsoft.scorpio.sys.controller;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.model.SysPosition;
import com.jiangxinsoft.scorpio.sys.model.SysPositionMember;
import com.jiangxinsoft.scorpio.sys.model.SysPositionScope;
import com.jiangxinsoft.scorpio.sys.service.ISysPositionService;
import com.jiangxinsoft.scorpio.sys.vo.PositionMemberVo;
import com.jiangxinsoft.scorpio.sys.vo.PositionScopeVo;
import com.jiangxinsoft.scorpio.sys.vo.PositionVo;

@RequestMapping("/sys/position/auth")
@Controller
public class SysPositionAuthController {
	
	@Autowired
	private ISysPositionService sysPositionService;
	
	@RequestMapping("/default")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sys/position/auth/default");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<SysPosition> listPage(PositionVo positionVo, int page, int rows, String sort, String order) {
		PageInfo<SysPosition> retPage = sysPositionService.getPositionPage(positionVo, page, rows, sort, order);
		return retPage;
	}
	
	@ResponseBody
	@RequestMapping("/saveScopes")
	public RestResponse savePositionScopes(@RequestBody List<SysPositionScope> positionScopes) {
		sysPositionService.savePositionScopes(positionScopes);
		
		return RestResponse.success("保存岗位责任部门成功!");
	}
	
	@ResponseBody
	@RequestMapping("/deleteScopes")
	public RestResponse deletePositionScopes(@RequestBody List<SysPositionScope> positionScopes) {
		sysPositionService.deletePositionScopes(positionScopes);
		
		return RestResponse.success("删除岗位责任部门成功!");
	}
	
	@ResponseBody
	@RequestMapping("/listScope")
	public PageInfo<SysPositionScope> listScopePage(PositionScopeVo positionScopeVo, int page, int rows, String sort, String order) {
		PageInfo<SysPositionScope> retPage = null;
		String positionId = positionScopeVo.getPositionId();
		if(StringUtils.isNotBlank(positionId)) {
			retPage = sysPositionService.getPositionScopePage(positionScopeVo, page, rows, sort, order);
		}
		
		return retPage;
	}
	
	@ResponseBody
	@RequestMapping("/saveMembers")
	public RestResponse savePositionMembers(@RequestBody List<SysPositionMember> positionMembers) {
		sysPositionService.savePositionMembers(positionMembers);
		
		return RestResponse.success("保存岗位成员成功!");
	}
	
	@ResponseBody
	@RequestMapping("/deleteMembers")
	public RestResponse deletePositionMembers(@RequestBody List<SysPositionMember> positionMembers) {
		sysPositionService.deletePositionMembers(positionMembers);
		
		return RestResponse.success("删除岗位成员成功!");
	}
	
	@ResponseBody
	@RequestMapping("/listMember")
	public PageInfo<SysPositionMember> listMemberPage(PositionMemberVo positionMemberVo, int page, int rows, String sort, String order) {
		PageInfo<SysPositionMember> retPage = null;
		String positionId = positionMemberVo.getPositionId();
		if(StringUtils.isNotBlank(positionId)) {
			retPage = sysPositionService.getPositionMemberPage(positionMemberVo, page, rows, sort, order);
		}
		
		return retPage;
	}
	
}
