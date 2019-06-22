package com.jiangxinsoft.scorpio.sys.mapper;

import java.util.List;

import com.jiangxinsoft.scorpio.sys.model.SysLog;
import com.jiangxinsoft.scorpio.sys.vo.LogVo;

public interface SysLogMapper {
	
	/**
	 * 插入系统日志
	 * @param sysLog
	 */
	public void insert(SysLog sysLog);
	
	/**
	 * 查询系统管理员日志列表
	 * @param sysLogVo
	 * @return
	 */
	public List<SysLog> selectAdminLog(LogVo sysLogVo);
	
	/**
	 * 查询安全审计员日志列表
	 * @param sysLogVo
	 * @return
	 */
	public List<SysLog> selectAuditLog(LogVo sysLogVo);
	
	/**
	 * 查询安全保密员日志列表
	 * @param sysLogVo
	 * @return
	 */
	public List<SysLog> selectSecrecyLog(LogVo sysLogVo);
}