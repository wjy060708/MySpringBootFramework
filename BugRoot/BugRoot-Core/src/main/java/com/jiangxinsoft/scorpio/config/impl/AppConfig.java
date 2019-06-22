package com.jiangxinsoft.scorpio.config.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jiangxinsoft.scorpio.config.IAppConfig;

public class AppConfig implements IAppConfig {
	
	private static final Logger logger = LoggerFactory.getLogger(AppConfig.class);
	
	private static final String MYSQL_INSTALL_PATH = "mysql-install-path";
	
	private static final String WEB_RESOURCE_PATH = "web-resource-path";
	
	private static final String WEB_OFFICE_PATH = "web-office-path";
	
	private static final String WEB_INDEX_PATH = "web-index-path";
	
	/**
	 * 默认的配置文件
	 */
	private final static String DEFAULT_CONFIG_FILE = "app-config.xml";
	
	// 数据库名称
	private String dbName;
	
	// 数据库用户名
	private String dbUsername;
	
	// 数据库用户密码
	private String dbPassword;
	
	/**
	 * 配置参数表
	 */
	private Map<String, String> paramMap = new HashMap<String, String>();
	
	public AppConfig() {
		intConfig();	// 参数初始化
	}
	
	@SuppressWarnings("unchecked")
	private void intConfig() {
		InputStream is = null;
		SAXReader saxReader  = new SAXReader();
		
		try {
			is = AppConfig.class.getClassLoader().getResourceAsStream(DEFAULT_CONFIG_FILE);
			Document document = saxReader.read(is);
			if(document != null) {
				Element root = document.getRootElement();
				if(root != null) {
					Iterator<Element> itr= root.elementIterator();
					while(itr.hasNext()) {
						Element e = itr.next();
						String paramName = e.getName();	// 属性名称
						String paramValue = e.getText();	// 属性取值
						
						// 设置参数配置信息
						paramMap.put(paramName, paramValue);
					}
				}
			}
			
		} catch (DocumentException e) {
			logger.debug("解析应用参数配置异常!", e);
		} finally {
			if(is != null) {
				try {
					is.close();
				} catch (IOException e) {
					logger.debug("解析应用参数配置异常!", e);
				}
			}
		}
	}

	@Override
	public String getDbName() {
		return dbName;
	}

	public void setDbName(String dbName) {
		this.dbName = dbName;
	}

	@Override
	public String getDbUsername() {
		return dbUsername;
	}

	public void setDbUsername(String dbUsername) {
		this.dbUsername = dbUsername;
	}

	@Override
	public String getDbPassword() {
		return dbPassword;
	}

	public void setDbPassword(String dbPassword) {
		this.dbPassword = dbPassword;
	}
	
	@Override
	public String getDbInstallPath() {
		if(paramMap.containsKey(MYSQL_INSTALL_PATH)) {
			String mysqlInstallPath = paramMap.get(MYSQL_INSTALL_PATH);
			if(mysqlInstallPath != null) {
				mysqlInstallPath = mysqlInstallPath.replace("\\", "/");
			}
			return mysqlInstallPath;
		}
		return null;
	}
	
	@Override
	public String getWebResourceRoot() {
		if(paramMap.containsKey(WEB_RESOURCE_PATH)) {
			String webResourcePath = paramMap.get(WEB_RESOURCE_PATH);
			
			if(webResourcePath != null) {
				webResourcePath = webResourcePath.replace("\\", "/");
			}
			return webResourcePath;
		}
		return null;
	}
	
	@Override
	public String getWebIndexRoot() {
		if(paramMap.containsKey(WEB_INDEX_PATH)) {
			String webResourcePath = paramMap.get(WEB_INDEX_PATH);
			
			if(webResourcePath != null) {
				webResourcePath = webResourcePath.replace("\\", "/");
			}
			return webResourcePath;
		}
		return null;
	}
	
	@Override
	public String getOfficeHomePath() {
		if(paramMap.containsKey(WEB_OFFICE_PATH)) {
			String webResourcePath = paramMap.get(WEB_OFFICE_PATH);
			
			if(webResourcePath != null) {
				webResourcePath = webResourcePath.replace("\\", "/");
			}
			return webResourcePath;
		}
		return null;
	}

	public Map<String, String> getParamMap() {
		return paramMap;
	}

	public void setParamMap(Map<String, String> paramMap) {
		this.paramMap = paramMap;
	}
	
}
