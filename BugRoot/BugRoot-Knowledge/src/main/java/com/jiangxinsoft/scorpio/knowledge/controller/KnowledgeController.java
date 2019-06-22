package com.jiangxinsoft.scorpio.knowledge.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import com.jiangxinsoft.scorpio.knowledge.model.KnowMode;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModeConsequence;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModePrevention;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModeReason;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModeRule;
import com.jiangxinsoft.scorpio.knowledge.model.KnowRemark;
import com.jiangxinsoft.scorpio.knowledge.model.KnowType;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeConsequenceService;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModePreventionService;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeReasonService;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeRuleService;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeService;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowRemarkService;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowTypeService;
import com.jiangxinsoft.scorpio.sys.model.SysUser;
import com.jiangxinsoft.scorpio.sys.service.ISysUserService;

@RequestMapping("/knowledge")
@Controller
public class KnowledgeController {
	
	@Autowired
	private IKnowModeReasonService knowModeReasonService;
	
	@Autowired
	private IKnowModePreventionService knowModePreventionService;
	
	@Autowired
	private IKnowModeConsequenceService knowModeConsequenceService;
	
	@Autowired
	private IKnowModeService iKnowModeService;
	
	@Autowired
	private IKnowModeRuleService knowModeRuleService;
	
	@Autowired
	private IKnowRemarkService knowRemarkService;
	
	@Autowired
	private IKnowTypeService knowTypeService;
	
	@Autowired
	private ISysUserService sysUserService;
	
	@RequestMapping("/details")
	public ModelAndView page(String modeId,KnowModeReason knowModeReason
			,KnowModeConsequence knowModeConsequence
			,KnowModePrevention knowModePrevention,KnowModeRule knowModeRule
			,KnowRemark knowRemark,KnowMode knowMode1,HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();

	    Object name1 =  SecurityUtils.getSubject().getPrincipal();
	    SysUser sysUser = sysUserService.getUserByUsername(name1+"");
	    
		KnowMode knowMode = iKnowModeService.findByPrimaryKey(modeId);
		
		String typeId = knowMode.getTypeId();
		KnowMode knowMode2 = new KnowMode();
		knowMode2.setTypeId(typeId);
		List<KnowMode> list2 = iKnowModeService.find(knowMode2);
		
		List<String> keyWords = new ArrayList<>();
		String keyString = knowMode.getKeyWords();
		if(keyString !=null && keyString != "") {
		   keyWords = Arrays.asList(StringUtils.split(keyString,";"));
		} else {
			keyWords.add("<font color='red'>未添加标签</font>");
		}
		
		List<KnowModeReason> listReasons = knowModeReasonService.find(knowModeReason);
		List<KnowModeConsequence> listConsequences = knowModeConsequenceService.find(knowModeConsequence);
		List<KnowModePrevention> listPreventions = knowModePreventionService.find(knowModePrevention);
		List<KnowModeRule> listRules = knowModeRuleService.find(knowModeRule);
		List<KnowRemark> listRemarks = knowRemarkService.find(knowRemark);
		
		int max = list2.size();
		if(max > 20) {
			max =20;
		}
		modelAndView.addObject("list2", list2.subList(0, max));
		modelAndView.addObject("knowMode", knowMode);
		modelAndView.addObject("keyWords", keyWords);
		modelAndView.addObject("listReasons", listReasons);
		modelAndView.addObject("listConsequences", listConsequences);
		modelAndView.addObject("listPreventions", listPreventions);
		modelAndView.addObject("listRules", listRules);
		modelAndView.addObject("listRemarks", listRemarks);
		modelAndView.addObject("userId", sysUser.getUserId());
		modelAndView.addObject("sysUser",sysUser);

		modelAndView.setViewName("knowledge/details");
		return modelAndView;
	}
	
	@RequestMapping("/publishResult")
	public ModelAndView pagePublish() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("knowledge/publishResult");
		return modelAndView;
	}
	


	@RequestMapping("/knowledgeModule")
	public ModelAndView knowledgeModule(KnowType knowType) {
		List<KnowType> listFirstTypes = knowTypeService.findFirstType(knowType);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("listFirstTypes", listFirstTypes);
		modelAndView.setViewName("knowledge/module/knowledgeModule");
		return modelAndView;
	}
	
	@RequestMapping("/moduleDetails")
	public ModelAndView moduleDetails(String typeId,KnowMode knowMode) {
		ModelAndView modelAndView = new ModelAndView();
		
		List<KnowMode> listThirdAllModes = new ArrayList<>();
		
		String parentId = typeId;
		knowMode.setTypeId(typeId);
		
		KnowType knowType = knowTypeService.findByPrimaryKey(typeId);
		
		List<KnowMode> listFirstModes = iKnowModeService.find(knowMode);	
		List<KnowMode> listSecondModes = iKnowModeService.findNeed(parentId);
		List<KnowType> listSecondTypes = knowTypeService.findByPrarentKey(parentId);
		
		listThirdAllModes.addAll(listFirstModes);
		listThirdAllModes.addAll(listSecondModes);
		
		for (int i = 0; i < listSecondTypes.size(); i++) {
			parentId = listSecondModes.get(i).getTypeId(); 
			List<KnowMode> listThirdModes = iKnowModeService.findNeed(parentId);
	
			listThirdAllModes.addAll(listThirdModes);
			
		}
		
		modelAndView.addObject("knowType", knowType);
		modelAndView.addObject("listThirdAllModes", listThirdAllModes);
		modelAndView.setViewName("knowledge/module/moduleDetails");
		return modelAndView;
	}
	
	@RequestMapping("/toRegPage")
	public String toPageReg() {
		return "knowledge/reg";
	}
	
	@RequestMapping("/toPublishKnow")
	public String toPagePublishKnow() {
		return "knowledge/publishKnow";
	}
}
