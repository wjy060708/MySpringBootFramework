package com.jiangxinsoft.scorpio.sys.mapper;

public interface SysSnUtilMapper {
	
	/**
	 * 生成流水号
	 * @param tableKey
	 */
	public String getSerialKey(String tableKey);

}