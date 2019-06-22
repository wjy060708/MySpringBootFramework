package com.jiangxinsoft.scorpio.config;

public interface IAppConfig {
	
	/**
	 * 获取数据库名称
	 * @return
	 */
	public String getDbName();
	
	/**
	 * 获取数据库用户名
	 * @return
	 */
	public String getDbUsername();
	
	/**
	 * 获取数据库密码
	 * @return
	 */
	public String getDbPassword();
	
	/**
	 * 获取数据库安装路径
	 * @return
	 */
	public String getDbInstallPath();
	
	/**
	 * 获取上传资源存储路径
	 * @return
	 */
	public String getWebResourceRoot();
	
	/**
	 * 获取文档索引目录
	 * @return
	 */
	public String getWebIndexRoot();
	
	/**
	 * 获取OpenOffice的安装目录
	 * @return
	 */
	public String getOfficeHomePath();
	
}
