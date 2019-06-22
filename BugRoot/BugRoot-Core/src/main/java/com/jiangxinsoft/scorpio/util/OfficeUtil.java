package com.jiangxinsoft.scorpio.util;

import org.apache.commons.lang3.StringUtils;

public class OfficeUtil {

	private final static String[] FILE_TYPE_OFFICE = new String[]{
		"doc",
		"docx",
		"xls",
		"xlsx",
		"ppt",
		"pptx"
	};
	
	/**
	 * 是否支持文件类型
	 * @param extension
	 * @return
	 */
	public static boolean isTypeSupport(String extension) {
		if (StringUtils.isEmpty(extension)) {
			return false;
		}
		
		extension = extension.toLowerCase();
		for(String ext : FILE_TYPE_OFFICE) {
			if(ext.equals(extension)) {
				return true;
			}
		}
		
		return ("pdf".equals(extension));
	}
	
	/**
	 * 根据文档后缀名判断文档是否为Office文档
	 * @param extension
	 * @return
	 */
	public static boolean isOffice(String extension) {
		if (StringUtils.isEmpty(extension)) {
			return false;
		}

		extension = extension.toLowerCase();
		for(String ext : FILE_TYPE_OFFICE) {
			if(ext.equals(extension)) {
				return true;
			}
		}
		
		return false;
	}
	
	/**
	 * 根据文档后缀名判断文档是否为Pdf文档
	 * @param extension
	 * @return
	 */
	public static boolean isPdfDocument(String extension) {
		if (StringUtils.isEmpty(extension)) {
			return false;
		}

		extension = extension.toLowerCase();

		return ("pdf".equals(extension));
	}
}
