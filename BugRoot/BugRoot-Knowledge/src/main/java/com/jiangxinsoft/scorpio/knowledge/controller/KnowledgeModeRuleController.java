package com.jiangxinsoft.scorpio.knowledge.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.knowledge.model.KnowMode;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModeRule;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeRuleService;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeService;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.constants.SysConstants;

@RequestMapping("/knowledge/mode/rule")
@Controller
public class KnowledgeModeRuleController {
	
	@Autowired
	private IKnowModeRuleService knowModeRuleService;
	
	@Autowired
	private IKnowModeService iKnowModeService;
	
	@RequestMapping("/default")
	public ModelAndView page(String modeId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotEmpty(modeId)) {
			KnowMode knowMode = iKnowModeService.findByPrimaryKey(modeId);
			
			modelAndView.addObject("knowMode", knowMode);
			modelAndView.setViewName("knowledge/mode/rule/default1");
			
			return modelAndView;
		}
		modelAndView.setViewName("knowledge/mode/rule/default");
		return modelAndView;
	}
	
	@RequestMapping("/new")
	public ModelAndView pageNew(String modeId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotEmpty(modeId)) {
			KnowMode knowMode = iKnowModeService.findByPrimaryKey(modeId);
			
			modelAndView.addObject("knowMode", knowMode);
		}		
		modelAndView.setViewName("knowledge/mode/rule/new");
		return modelAndView;
	}
	
	@RequestMapping("/view")
	public ModelAndView pageView(String ruleId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotBlank(ruleId)) {
			KnowModeRule knowModeRule = knowModeRuleService.findByPrimaryKey(ruleId);
		
			if(knowModeRule != null) {
				modelAndView.addObject("knowModeRule", knowModeRule);
				modelAndView.setViewName("knowledge/mode/rule/view");
				
				return modelAndView;
			}
		}
		
		modelAndView.addObject("message", "没有指定需要浏览的规则文档,或文档已不存在!");
		modelAndView.setViewName(SysConstants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}
	
	@RequestMapping("/getViewer/{ruleId}")
	public ModelAndView getViewer(@PathVariable(name="ruleId") String ruleId) {
		ModelAndView modelAndView = new ModelAndView();
		if(StringUtils.isNotBlank(ruleId)) {
			KnowModeRule knowModeRule = knowModeRuleService.findByPrimaryKey(ruleId);
			
			modelAndView.addObject("knowModeRule", knowModeRule);
			modelAndView.setViewName("knowledge/mode/rule/viewer");
		}
		
		return modelAndView;
	}
	
	@RequestMapping("/getPdfDocument/{ruleId}")
	public void getPdfDocument(@PathVariable(name="ruleId") String ruleId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		knowModeRuleService.getPdfDocument(ruleId, request, response);
	}
	
	@RequestMapping("/fileDownload/{ruleId}")
	public void fileDownload(@PathVariable(name="ruleId") String ruleId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("application/x-msdownload;");
		
		knowModeRuleService.downloadDocument(ruleId, request, response);
	}
	
	@ResponseBody
	@RequestMapping("/documentReady")
	public RestResponse pdfDocumentReady(String ruleId) {
		boolean bReady = knowModeRuleService.isDocumentReady(ruleId);
		if(bReady) {
			return RestResponse.success("Pdf文档已准备好!");
		} else {
			return RestResponse.failure("Pdf文档没有准备好!");
		}
	}
	
	@RequestMapping("/pdfDownload/{ruleId}")
	public void pdfDownload(@PathVariable(name="ruleId") String ruleId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("application/x-msdownload;");
		
		knowModeRuleService.downloadPdfDocument(ruleId, request, response);
	}

	@ResponseBody
	@RequestMapping("/save")
	public RestResponse save(KnowModeRule pojo) {
		knowModeRuleService.save(pojo);
		return RestResponse.success("保存缺陷规则成功!");
	}
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<KnowModeRule> listPage(KnowModeRule pojoVo, int page, int rows, String sort, String order) {
		PageInfo<KnowModeRule> retPage = knowModeRuleService.findByPage(pojoVo, page, rows, sort, order);
		
		return retPage;
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public RestResponse delete(String[] ids) {
		
		knowModeRuleService.deleteByPrimaryKeys(ids);
		return RestResponse.success("删除缺陷规则成功!");
	}
}
