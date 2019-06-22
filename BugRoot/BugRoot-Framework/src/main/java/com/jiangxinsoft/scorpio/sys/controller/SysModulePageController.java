package com.jiangxinsoft.scorpio.sys.controller;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiangxinsoft.scorpio.common.Constants;
import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.model.SysModulePage;
import com.jiangxinsoft.scorpio.sys.model.SysRolePage;
import com.jiangxinsoft.scorpio.sys.service.ISysModulePageService;
import com.jiangxinsoft.scorpio.sys.vo.ModulePageVo;
import com.jiangxinsoft.scorpio.sys.vo.RolePageVo;

@RequestMapping("/sys/page")
@Controller
public class SysModulePageController {
	
	@Autowired
	private ISysModulePageService sysModulePageService;
	
	@RequestMapping("/default")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sys/page/default");
		return modelAndView;
	}
	
	@RequestMapping("/new")
	public ModelAndView pageNew() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sys/page/new");
		return modelAndView;
	}
	
	@RequestMapping("/edit")
	public ModelAndView pageEdit(String pageId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotBlank(pageId)) {
			SysModulePage modulePage = sysModulePageService.getModulePageById(pageId);
			if(modulePage != null) {
				modelAndView.addObject("modulePage", modulePage);
				modelAndView.setViewName("sys/page/edit");
				return modelAndView;
			}
		}
		
		modelAndView.addObject("message", "没有指定需要编辑的功能页面,或功能页面已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/listAll")
	public List<SysModulePage> listAll(ModulePageVo modulePageVo) {
		List<SysModulePage> list = sysModulePageService.getModulePages(modulePageVo);
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/listRolePages")
	public List<SysRolePage> listRolePages(RolePageVo rolePageVo) {
		List<SysRolePage> list = sysModulePageService.getRoleModuleList(rolePageVo);
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/listModulePages")
	public List<SysModulePage> listModulePages(ModulePageVo modulePageVo) {
		List<SysModulePage> list = sysModulePageService.getModulePages(modulePageVo);
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<SysModulePage> listPage(ModulePageVo modulePageVo, int page, int rows, String sort, String order) {
		PageInfo<SysModulePage> retPage = sysModulePageService.getModulePage(modulePageVo, page, rows, sort, order);
		return retPage;
	}
	
	@ResponseBody
	@RequestMapping("/save")
	public RestResponse save(SysModulePage modulePage) {
		sysModulePageService.saveModulePage(modulePage);
		
		return RestResponse.success("保存功能页面成功!");
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public RestResponse update(SysModulePage modulePage) {
		sysModulePageService.updateModulePage(modulePage);
		
		return RestResponse.success("更新功能页面成功!");
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public RestResponse delete(String pageId) {
		sysModulePageService.deleteModulePageById(pageId);
		
		return RestResponse.success("删除功能页面成功!");
	}
	
}
