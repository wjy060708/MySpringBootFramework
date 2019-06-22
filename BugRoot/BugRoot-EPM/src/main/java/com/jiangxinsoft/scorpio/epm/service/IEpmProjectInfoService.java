package com.jiangxinsoft.scorpio.epm.service;

import com.jiangxinsoft.scorpio.epm.vo.ProjectInfoVo;
import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.service.IService;

public interface IEpmProjectInfoService extends IService<ProjectInfoVo> {
	
	/**
	 * 发布项目 
	 */
	public void updateProjectPublishStatus(String projectId) throws OperationException;
	
	/**
	 * 挂起项目 
	 */
	public void updateProjectStopStatus(String projectId) throws OperationException;
	
	/**
	 * 完成项目 
	 */
	public void updateProjectFinishStatus(String projectId) throws OperationException;
	
	/**
	 * 我的项目
	 */
	public PageInfo<ProjectInfoVo> findPublishProject(ProjectInfoVo pojoVo, int page, int rows, String sort, String order) throws OperationException;
	
}
