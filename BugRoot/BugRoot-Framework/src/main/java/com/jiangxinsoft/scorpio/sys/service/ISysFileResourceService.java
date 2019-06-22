package com.jiangxinsoft.scorpio.sys.service;

import java.util.List;


import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.model.SysFileResource;
import com.jiangxinsoft.scorpio.sys.vo.FileResourceVo;

public interface ISysFileResourceService {
	
	/**
	 * 插入文件资源
	 * @param fileResource
	 */
	public void saveFileResource(SysFileResource fileResource);
	
	/**
	 * 更新文件资源
	 * @param fileResource
	 */
	public void updateFileResource(SysFileResource fileResource);
	
	/**
	 * 根据文件资源ID查找文件资源
	 * @param categoryId
	 * @return
	 */
	public SysFileResource getFileResourceById(String fileId);
	
	/**
	 * 查询所有文件资源列表
	 * @param fileResourceVo
	 * @return
	 */
	public List<SysFileResource> getFileResources(FileResourceVo fileResourceVo);
	
	/**
	 * 查询文件资源列表
	 * @param fileResourceVo
	 * @param currentPage
	 * @param pageSize
	 * @param sortName
	 * @param sortOrder
	 * @return
	 */
	public PageInfo<SysFileResource> getFileResourcePage(FileResourceVo fileResourceVo, 
			int currentPage, int pageSize, String sortName, String sortOrder);
	
	/**
	 * 根据文件资源ID删除文件资源
	 * @param fileId
	 */
	public void deleteFileResourceById(String fileId) throws OperationException;
	
	/**
	 * 根据文件资源ID批量删除文件资源
	 * @param fileIds
	 */
	public void deleteFileResourceByIds(String[] fileIds) throws OperationException;
}
