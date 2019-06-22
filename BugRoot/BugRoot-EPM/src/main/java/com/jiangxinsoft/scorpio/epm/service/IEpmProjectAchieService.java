package com.jiangxinsoft.scorpio.epm.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jiangxinsoft.scorpio.epm.model.EpmProjectAchie;
import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.service.IService;

public interface IEpmProjectAchieService extends IService<EpmProjectAchie> {
	
	public void downloadDocument(String achieId, HttpServletRequest request, HttpServletResponse response) throws OperationException;
	
	public boolean isDocumentReady(String achieId) throws OperationException;
	
	public void getPdfDocument(String achieId, HttpServletRequest request, HttpServletResponse response) throws OperationException;
	
	public void downloadPdfDocument(String achieId, HttpServletRequest request, HttpServletResponse response) throws OperationException;

}
