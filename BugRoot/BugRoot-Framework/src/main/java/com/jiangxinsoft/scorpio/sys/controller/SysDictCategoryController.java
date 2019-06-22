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
import com.jiangxinsoft.scorpio.sys.model.SysDictCategory;
import com.jiangxinsoft.scorpio.sys.service.ISysDictCategoryService;
import com.jiangxinsoft.scorpio.sys.vo.DictCategoryVo;

@RequestMapping("/sys/dict/category")
@Controller
public class SysDictCategoryController {
	
	@Autowired
	private ISysDictCategoryService sysDictCategoryService;
	
	@RequestMapping("/default")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sys/dict/category/default");
		return modelAndView;
	}
	
	@RequestMapping("/new")
	public ModelAndView pageNew() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sys/dict/category/new");
		return modelAndView;
	}
	
	@RequestMapping("/edit")
	public ModelAndView pageEdit(String categoryId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotBlank(categoryId)) {
			SysDictCategory dictCategory = sysDictCategoryService.findByPrimaryKey(categoryId);
			if(dictCategory != null) {
				modelAndView.addObject("dictCategory", dictCategory);
				modelAndView.setViewName("sys/dict/category/edit");
				return modelAndView;
			}
		}
		
		modelAndView.addObject("message", "没有指定需要编辑的数据字典类别,或数据字典类别已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/listAll")
	public List<SysDictCategory> listAll(DictCategoryVo dictCategoryVo) {
		List<SysDictCategory> list = sysDictCategoryService.find(dictCategoryVo);
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<SysDictCategory> listPage(DictCategoryVo dictCategoryVo, int page, int rows, String sort, String order) {
		PageInfo<SysDictCategory> retPage = sysDictCategoryService.findByPage(dictCategoryVo, page, rows, sort, order);
		return retPage;
	}
	
	@ResponseBody
	@RequestMapping("/save")
	@SysControllerLog(value="保存数据字典类别")
	public RestResponse save(SysDictCategory dictCategory) {
		sysDictCategoryService.save(dictCategory);
		
		return RestResponse.success("保存数据字典类别成功!");
	}
	
	@ResponseBody
	@RequestMapping("/update")
	@SysControllerLog(value="更新数据字典类别")
	public RestResponse update(SysDictCategory dictCategory) {
		sysDictCategoryService.update(dictCategory);
		
		return RestResponse.success("更新数据字典类别成功!");
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	@SysControllerLog(value="删除数据字典类别")
	public RestResponse delete(String categoryId) {
		sysDictCategoryService.deleteByPrimaryKey(categoryId);
		
		return RestResponse.success("删除数据字典类别成功!");
	}
	
}
