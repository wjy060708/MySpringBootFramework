package com.jiangxinsoft.scorpio.sys.service;

/**
 * 实现异步清理文档操作
 * @author J01052050
 *
 */
public interface ISysFileResourceCleaner {
	
	/**
	 * 定时监测文档资源清理
	 */
	public void fileResourceInspect();
	
	/**
	 * 清理文件资源记录以及物理存储的文件
	 * @param fileId
	 */
	public void cleanFileResource(String fileId);

}
