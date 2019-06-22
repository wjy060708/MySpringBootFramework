package com.jiangxinsoft.scorpio.sys.controller;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.jiangxinsoft.scorpio.annotation.SysControllerLog;
import com.jiangxinsoft.scorpio.common.Constants;
import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.model.SysModule;
import com.jiangxinsoft.scorpio.sys.service.ISysModuleService;
import com.jiangxinsoft.scorpio.sys.vo.ModuleVo;

@RequestMapping("/sys/module")
@Controller
public class SysModuleController {
	
	@Autowired
	private ISysModuleService sysModuleService;
	
	@RequestMapping("/default")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sys/module/default");
		return modelAndView;
	}
	
	@RequestMapping("/new")
	public ModelAndView pageNew() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sys/module/new");
		return modelAndView;
	}
	
	@RequestMapping("/edit")
	public ModelAndView pageEdit(String moduleId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotBlank(moduleId)) {
			SysModule module = sysModuleService.getModuleById(moduleId);
			if(module != null) {
				modelAndView.addObject("module", module);
				modelAndView.setViewName("sys/module/edit");
				return modelAndView;
			}
		}
		
		modelAndView.addObject("message", "没有指定需要编辑的功能模块,或功能模块已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/listAll")
	public List<SysModule> listAll(ModuleVo systemVo) {
		List<SysModule> list = sysModuleService.getModules(systemVo);
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<SysModule> listPage(ModuleVo systemVo, int page, int rows, String sort, String order) {
		PageInfo<SysModule> retPage = sysModuleService.getModulePage(systemVo, page, rows, sort, order);
		return retPage;
	}
	
	@ResponseBody
	@RequestMapping("/save")
	@SysControllerLog(value="保存功能模块")
	public RestResponse save(SysModule module) {
		sysModuleService.saveModule(module);
		
		return RestResponse.success("保存功能模块成功!");
	}
	
	@ResponseBody
	@RequestMapping("/update")
	@SysControllerLog(value="更新功能模块")
	public RestResponse update(SysModule module) {
		sysModuleService.updateModule(module);
		
		return RestResponse.success("更新功能模块成功!");
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	@SysControllerLog(value="删除功能模块")
	public RestResponse delete(String[] moduleIds) {
		sysModuleService.deleteModuleByIds(moduleIds);
		
		return RestResponse.success("删除功能模块成功!");
	}
	
}
