package com.jiangxinsoft.scorpio.util;

import java.io.File;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.io.FileUtils;

public class FileUtil {

	/**
	 * 获取文件的后缀名
	 * @param fileName
	 * @return
	 */
	public static String getFileExtension(String fileName) {
		if (fileName == null) {
			return null;
		}

		int pos = fileName.lastIndexOf(".");

		if (pos != -1) {
			return fileName.substring(pos + 1, fileName.length());
		}

		return null;
	}
	
	/**
	 * 去掉文件扩展名
	 * @param fileName
	 * @return
	 */
	public static String getFileTitle(String fileName) {
		if (fileName == null) {
			return null;
		}

		int pos = fileName.lastIndexOf(".");

		if (pos > 0) {
			return fileName.substring(0, pos);
		}

		return fileName;
	}
	
	/**
	 * 获取唯一的文件名称
	 * @return
	 */
	public static String getUniqueFileName(String extension) {
		return KeyGenerator.getUUIDKey() + "." + extension;
	}
	
	/**
	 * 获取唯一的文件名称
	 * @return
	 */
	public static String getUniqueFileName() {
		return KeyGenerator.getUUIDKey();
	}
	
	/**
	 * 自动生成文件存储目录
	 * @return
	 */
	public static String getUniqueFilePath() {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH);
		int day = calendar.get(Calendar.DAY_OF_MONTH);
		int hour = calendar.get(Calendar.HOUR_OF_DAY);
		
		return new Integer(year).toString() + File.separator + new Integer(month).toString() + File.separator + new Integer(day).toString() + File.separator + new Integer(hour).toString();
	}
	
	/**
	 * 创建指定的文件夹
	 * @param parentDirectory
	 * @return
	 */
	public static File makeFileDirectory(String parentDirectory, String filePath) {
		File accessFile = FileUtils.getFile(parentDirectory, filePath);
		if (! accessFile.exists()) {
			accessFile.mkdirs();
		}
		return accessFile;
	}
	
	public static File getFile(String parentDirectory, String fileName) {
		File accessFile = null;
		if(fileName != null) {
			accessFile = FileUtils.getFile(parentDirectory, fileName);
		}
		
		return accessFile;
	}
	
	public static File getFile(String parentDirectory, String filePath, String fileName) {
		File accessFile = null;
		if(fileName != null) {
			accessFile = FileUtils.getFile(parentDirectory, filePath, fileName);
		}
		
		return accessFile;
	}
}
