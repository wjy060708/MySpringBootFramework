package com.jiangxinsoft.scorpio.sys.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiangxinsoft.scorpio.common.Constants;
import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.model.SysPosition;
import com.jiangxinsoft.scorpio.sys.model.SysPositionMember;
import com.jiangxinsoft.scorpio.sys.model.SysPositionScope;
import com.jiangxinsoft.scorpio.sys.service.ISysPositionService;
import com.jiangxinsoft.scorpio.sys.vo.PositionMemberVo;
import com.jiangxinsoft.scorpio.sys.vo.PositionScopeVo;
import com.jiangxinsoft.scorpio.sys.vo.PositionVo;

@RequestMapping("/sys/position/manage")
@Controller
public class SysPositionManageController {
	
	@Autowired
	private ISysPositionService sysPositionService;
	
	@RequestMapping("/default")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sys/position/manage/default");
		return modelAndView;
	}
	
	@RequestMapping("/new")
	public ModelAndView pageNew() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sys/position/manage/new");
		return modelAndView;
	}
	
	@RequestMapping("/edit")
	public ModelAndView pageEdit(String positionId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotBlank(positionId)) {
			SysPosition position = sysPositionService.getPositionById(positionId);
			if(position != null) {
				modelAndView.addObject("position", position);
				modelAndView.setViewName("sys/position/manage/edit");
				return modelAndView;
			}
		}
		
		modelAndView.addObject("message", "没有指定需要授权的系统岗位,或系统岗位已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}
	
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
	
	@ResponseBody
	@RequestMapping("/save")
	public RestResponse save(SysPosition position) {
		sysPositionService.savePosition(position);
		
		return RestResponse.success("保存岗位成功!");
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public RestResponse update(SysPosition position) {
		sysPositionService.updatePosition(position);
		
		return RestResponse.success("更新岗位成功!");
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public RestResponse delete(String[] positionIds) {
		sysPositionService.deletePositionByIds(positionIds);
		
		return RestResponse.success("删除岗位成功!");
	}
	
}
