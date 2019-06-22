package com.jiangxinsoft.scorpio.sys.model;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class SysLog {
	/**
	 * 日志ID
	 */
	private String id;
	
	/**
	 * 请求类型
	 */
	private String type;
	
	/**
	 * 日志标题
	 */
	private String title;
	
	/**
	 * 操作IP地址
	 */
	private String remoteAddr;
	
	/**
	 * 用户名
	 */
	private String userName;
	
	/**
	 * 用户类型
	 */
	private String userKind;
	
	/**
	 * 操作人姓名
	 */
	private String trueName;
	
	/**
	 * 请求URI
	 */
	private String requestUri;
	
	/**
	 * 操作方式
	 */
	private String httpMethod;
	
	/**
	 * 请求类型方法
	 */
	private String classMethod;
	
	/**
	 * 操作提交的数据
	 */
	private String params;
	
	/**
	 * 返回的内容
	 */
	private String response;
	
	/**
	 * 方法执行的时间
	 */
	private long useTime;
	
	/**
	 * 异常信息
	 */
	private String exception;
	
	/**
	 * 创建者
	 */
	private String createBy;
	
	/**
	 * 操作时间
	 */
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date createDate;

	/**
	 * 备注信息
	 */
	private String remarks;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRemoteAddr() {
		return remoteAddr;
	}

	public void setRemoteAddr(String remoteAddr) {
		this.remoteAddr = remoteAddr;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserKind() {
		return userKind;
	}

	public void setUserKind(String userKind) {
		this.userKind = userKind;
	}

	public String getTrueName() {
		return trueName;
	}

	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}

	public String getRequestUri() {
		return requestUri;
	}

	public void setRequestUri(String requestUri) {
		this.requestUri = requestUri;
	}

	public String getHttpMethod() {
		return httpMethod;
	}

	public void setHttpMethod(String httpMethod) {
		this.httpMethod = httpMethod;
	}

	public String getClassMethod() {
		return classMethod;
	}

	public void setClassMethod(String classMethod) {
		this.classMethod = classMethod;
	}

	public String getParams() {
		return params;
	}

	public void setParams(String params) {
		this.params = params;
	}

	public String getResponse() {
		return response;
	}

	public void setResponse(String response) {
		this.response = response;
	}

	public long getUseTime() {
		return useTime;
	}

	public void setUseTime(long useTime) {
		this.useTime = useTime;
	}

	public String getException() {
		return exception;
	}

	public void setException(String exception) {
		this.exception = exception;
	}

	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

}
