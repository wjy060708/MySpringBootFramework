package com.jiangxinsoft.scorpio.knowledge.controller;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiangxinsoft.scorpio.common.Constants;
import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.knowledge.model.KnowMode;
import com.jiangxinsoft.scorpio.knowledge.model.KnowType;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeService;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowTypeService;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;

@Controller
@RequestMapping("/knowledge/type")
public class KnowledgeTypeController {
	
	@Autowired
	private IKnowTypeService iKnowTypeService;
	
	@Autowired
	private IKnowModeService iKnowModeService;
	
	@RequestMapping("/default")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("knowledge/type/default");
		return modelAndView;
	}
	
	@RequestMapping("/new")
	public ModelAndView pageNew() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("knowledge/type/new");
		return modelAndView;
	}
	
	@RequestMapping("/list")
	public ModelAndView pageList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("knowledge/type/list");
		return modelAndView;
	}
	
	@RequestMapping("/module")
	public ModelAndView pageModule(KnowMode knowMode) {
		ModelAndView modelAndView = new ModelAndView();
		
		List<KnowMode> listModes = iKnowModeService.find(knowMode);
		List<KnowMode> listCurKnowModes = iKnowModeService.findCurDate(knowMode);
		List<KnowMode> listPreKnowModes = iKnowModeService.findPreDate(knowMode);
		
		int countCur = listCurKnowModes.size();
		int countPre = listPreKnowModes.size();
		int countAll = listModes.size();
		int total = listModes.size();
		
		if(total > 10) {
			total = 10;
		}
		modelAndView.addObject("listModes", listModes.subList(0,total));
		modelAndView.addObject("countCur", countCur);	
		modelAndView.addObject("countPre", countPre);
		modelAndView.addObject("countAll", countAll);
		
		modelAndView.setViewName("knowledge/type/module");
		
		return modelAndView;
	}
	
	@RequestMapping("/edit")
	public ModelAndView pageEdit(String typeId) {
		ModelAndView modelAndView = new ModelAndView();
	
		if(StringUtils.isNotBlank(typeId)) {
			KnowType knowType = iKnowTypeService.findByPrimaryKey(typeId);
			if(knowType != null) {
				
				modelAndView.addObject("knowType", knowType);
				modelAndView.setViewName("knowledge/type/edit");
				
				return modelAndView;
			}
		}
		
		modelAndView.addObject("message", "没有指定需要编辑的知识类型信息,或知识类型信息已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}
	
	
	@ResponseBody
	@RequestMapping("/save")
	public RestResponse save(KnowType pojo) {
		
		iKnowTypeService.save(pojo);
		return RestResponse.success("保存知识类型信息成功!");
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public RestResponse update(KnowType pojo) {
		iKnowTypeService.update(pojo);
		
		return RestResponse.success("更新知识类型信息成功!");
	}
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<KnowType> listPage(KnowType pojoVo, int page, int rows, String sort, String order) {
		PageInfo<KnowType> retPage = iKnowTypeService.findByPage(pojoVo, page, rows, sort, order);
		
		return retPage;
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public RestResponse delete(String typeId) {
		
		iKnowTypeService.deleteByPrimaryKey(typeId);
		
		return RestResponse.success("删除知识分类信息成功!");
	}

	@ResponseBody
	@RequestMapping("/listAll")
	public List<KnowType> listAll(KnowType pojoVo) {		
		List<KnowType> list = iKnowTypeService.getType(pojoVo);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/listProcessTypes")
	public List<KnowType> listProcessTypes(KnowType pojoVo) {
		List<KnowType> list = iKnowTypeService.find(pojoVo);
		
		return list;
	}
	
}
