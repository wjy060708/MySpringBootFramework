package com.jiangxinsoft.scorpio.knowledge.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModeRule;
import com.jiangxinsoft.scorpio.service.IService;

public interface IKnowModeRuleService extends IService<KnowModeRule>{
	
	public void downloadDocument(String ruleId, HttpServletRequest request, HttpServletResponse response) throws OperationException;
	
	public boolean isDocumentReady(String ruleId) throws OperationException;
	
	public void downloadPdfDocument(String ruleId, HttpServletRequest request, HttpServletResponse response) throws OperationException;
	
	public void getPdfDocument(String ruleId, HttpServletRequest request, HttpServletResponse response) throws OperationException;
}
