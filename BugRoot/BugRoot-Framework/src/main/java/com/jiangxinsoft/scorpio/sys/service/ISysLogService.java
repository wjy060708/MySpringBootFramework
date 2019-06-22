package com.jiangxinsoft.scorpio.sys.service;

import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.model.SysLog;
import com.jiangxinsoft.scorpio.sys.vo.LogVo;

public interface ISysLogService {
	
	/**
	 * 插入系统日志
	 */
	public void saveLog(SysLog log);
	
	/**
	 * 查询系统管理员日志列表
	 * @param logVo
	 * @param currentPage
	 * @param pageSize
	 * @param sortName
	 * @param sortOrder
	 * @return
	 */
	public PageInfo<SysLog> getAdminLogPage(LogVo logVo, int currentPage, int pageSize, String sortName, String sortOrder);

	/**
	 * 查询安全审计员日志列表
	 * @param logVo
	 * @param currentPage
	 * @param pageSize
	 * @param sortName
	 * @param sortOrder
	 * @return
	 */
	public PageInfo<SysLog> getAuditLogPage(LogVo logVo, int currentPage, int pageSize, String sortName, String sortOrder);
	
	/**
	 * 查询安全保密员日志列表
	 * @param logVo
	 * @param currentPage
	 * @param pageSize
	 * @param sortName
	 * @param sortOrder
	 * @return
	 */
	public PageInfo<SysLog> getSecrecyLogPage(LogVo logVo, int currentPage, int pageSize, String sortName, String sortOrder);
}
