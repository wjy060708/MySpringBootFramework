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
import com.jiangxinsoft.scorpio.knowledge.model.KnowProcess;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowProcessService;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;

@RequestMapping("/knowledge/process")
@Controller
public class KnowProcessController {
	
	@Autowired
	private IKnowProcessService iKnowProcessService;
	
	@RequestMapping("/default")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("knowledge/process/default");
		return modelAndView;
	}
	
	@RequestMapping("/new")
	public ModelAndView pageNew() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("knowledge/process/new");
		return modelAndView;
	}
	
	@RequestMapping("/edit")
	public ModelAndView pageEdit(String processId) {
		ModelAndView modelAndView = new ModelAndView();
	
		if(StringUtils.isNotBlank(processId)) {
			KnowProcess knowProcess = iKnowProcessService.findByPrimaryKey(processId);
			if(knowProcess != null) {
				
				modelAndView.addObject("knowProcess", knowProcess);
				modelAndView.setViewName("knowledge/process/edit");
				
				return modelAndView;
			}
		}
		
		modelAndView.addObject("message", "没有指定需要编辑的过程信息,或过程信息已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}
	
	
	@ResponseBody
	@RequestMapping("/save")
	public RestResponse save(KnowProcess pojo) {
		
		iKnowProcessService.save(pojo);
		return RestResponse.success("保存过程信息成功!");
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public RestResponse update(KnowProcess pojo) {
		iKnowProcessService.update(pojo);
		
		return RestResponse.success("更新过程信息成功!");
	}
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<KnowProcess> listPage(KnowProcess pojoVo, int page, int rows, String sort, String order) {
		PageInfo<KnowProcess> retPage = iKnowProcessService.findByPage(pojoVo, page, rows, sort, order);
		
		return retPage;
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public RestResponse delete(String[] processIds) {
		iKnowProcessService.deleteByPrimaryKeys(processIds);
		
		return RestResponse.success("删除过程信息成功!");
	}
	
	@ResponseBody
	@RequestMapping("/listAll")
	public List<KnowProcess> listAll(KnowProcess pojoVo) {
		
		List<KnowProcess> list = iKnowProcessService.getProcess(pojoVo);
		System.out.println(list);
		
		return list;
	}
	
}
