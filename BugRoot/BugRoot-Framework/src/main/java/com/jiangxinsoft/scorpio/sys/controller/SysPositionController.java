package com.jiangxinsoft.scorpio.sys.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.model.SysPosition;
import com.jiangxinsoft.scorpio.sys.model.SysPositionMember;
import com.jiangxinsoft.scorpio.sys.model.SysPositionScope;
import com.jiangxinsoft.scorpio.sys.service.ISysPositionService;
import com.jiangxinsoft.scorpio.sys.vo.PositionMemberVo;
import com.jiangxinsoft.scorpio.sys.vo.PositionScopeVo;
import com.jiangxinsoft.scorpio.sys.vo.PositionVo;

@RequestMapping("/sys/position")
@Controller
public class SysPositionController {
	
	@Autowired
	private ISysPositionService sysPositionService;
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<SysPosition> listPage(PositionVo positionVo, int page, int rows, String sort, String order) {
		PageInfo<SysPosition> retPage = sysPositionService.getPositionPage(positionVo, page, rows, sort, order);
		return retPage;
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
