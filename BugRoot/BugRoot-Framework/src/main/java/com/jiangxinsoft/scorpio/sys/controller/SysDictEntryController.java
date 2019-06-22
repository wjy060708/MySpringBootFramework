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
import com.jiangxinsoft.scorpio.sys.model.SysDictEntry;
import com.jiangxinsoft.scorpio.sys.service.ISysDictEntryService;
import com.jiangxinsoft.scorpio.sys.vo.DictEntryVo;

@RequestMapping("/sys/dict/entry")
@Controller
public class SysDictEntryController {
	
	@Autowired
	private ISysDictEntryService sysDictEntryService;
	
	@RequestMapping("/default")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sys/dict/entry/default");
		return modelAndView;
	}
	
	@RequestMapping("/new")
	public ModelAndView pageNew() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sys/dict/entry/new");
		return modelAndView;
	}
	
	@RequestMapping("/edit")
	public ModelAndView pageEdit(String entryId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotBlank(entryId)) {
			SysDictEntry dictEntry = sysDictEntryService.findByPrimaryKey(entryId);
			if(dictEntry != null) {
				modelAndView.addObject("dictEntry", dictEntry);
				modelAndView.setViewName("sys/dict/entry/edit");
				return modelAndView;
			}
		}
		
		modelAndView.addObject("message", "没有指定需要编辑的数据字典条目,或数据字典条目已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/listAll")
	public List<SysDictEntry> listAll(DictEntryVo dictEntryVo) {
		List<SysDictEntry> list = sysDictEntryService.find(dictEntryVo);
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<SysDictEntry> listPage(DictEntryVo dictEntryVo, int page, int rows, String sort, String order) {
		PageInfo<SysDictEntry> retPage = sysDictEntryService.findByPage(dictEntryVo, page, rows, sort, order);
		return retPage;
	}
	
	@ResponseBody
	@RequestMapping("/save")
	@SysControllerLog(value="保存数据字典条目")
	public RestResponse save(SysDictEntry dictEntry) {
		sysDictEntryService.save(dictEntry);
		
		return RestResponse.success("保存数据字典条目成功!");
	}
	
	@ResponseBody
	@RequestMapping("/update")
	@SysControllerLog(value="更新数据字典条目")
	public RestResponse update(SysDictEntry dictEntry) {
		sysDictEntryService.update(dictEntry);
		
		return RestResponse.success("更新数据字典条目成功!");
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	@SysControllerLog(value="删除数据字典条目")
	public RestResponse delete(String[] entryIds) {
		sysDictEntryService.deleteByPrimaryKeys(entryIds);
		
		return RestResponse.success("删除数据字典条目成功!");
	}
	
}
