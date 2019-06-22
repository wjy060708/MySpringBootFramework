package com.jiangxinsoft.scorpio.sys.constants;

/**
 * 系统常量定义
 * @author J01052050
 *
 */
public class SysConstants {
	
	public final static String FILE_STATUS_NOT_ENABLED = "0";	// 未启用
	public final static String FILE_STATUS_ENABLED = "1";	// 已启用
	public final static String FILE_STATUS_CONVERTING = "2";	// 转换中
	public final static String FILE_STATUS_CONVERTED = "3";	// 转换完成
	public final static String FILE_STATUS_DELETED = "4";	// 已删除
	
	/**
	 * 系统默认密码
	 */
	public final static String DEFAULT_LOGIN_PASSWORD = "123456";
	
	/* 系统用户类型定义 */
	public final static String USER_KIND_COMMON = "0";	/* 普通用户 */
	public final static String USER_KIND_ADMIN = "1";	/* 系统管理员  */
	public final static String USER_KIND_SECRECY = "2";	/* 安全保密员  */
	public final static String USER_KIND_AUDITOR = "3";	/* 安全审计员  */
	public final static String USER_KIND_OPERATOR = "4";	/* 系统维护员  */
	public final static String USER_KIND_BUG_MANAGER = "5";	/* 系统维护员  */
	
	/* 系统用户状态定义 */
	public final static String USER_STATE_DEFAULT = "0";	/* 缺省状态  */
	public final static String USER_STATE_ENABLED = "1";	/* 已激活 */
	public final static String USER_STATE_DISABLED = "2";	/* 已冻结 */
	
	public final static String[] SYS_USER_PROPERTY = new String[] {"userSeq", "userName", "trueName", "departmentCode", "userRemark"};
	
	/* 项目状态定义 */
	public final static String ASSESS_PROJECT_DRAFT = "0";	/* 缺省: 未发布 */
	public final static String ASSESS_PROJECT_PUBLISHED = "1";	/* 已发布 ，相当与启动项目 */
	public final static String ASSESS_PROJECT_STOP = "2";	/* 已取消 ，主动取消项目 */
	public final static String ASSESS_PROJECT_FINISH = "3";	/* 已完成 ，主动完成项目 */
	
	/**
	 * 错误返回页面
	 */
	public final static String ERROR_FOR_DIV_PAGE = "error/div-error";
	public final static String ERROR_FOR_SCORE_PAGE = "error/score-error";
	public final static String ERROR_FOR_FRM_PAGE = "error/frm-error";
	
}
