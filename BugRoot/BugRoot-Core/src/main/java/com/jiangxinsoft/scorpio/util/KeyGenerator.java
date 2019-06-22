package com.jiangxinsoft.scorpio.util;

import java.util.UUID;

public class KeyGenerator {

	/**
	 * 生成唯一的主键
	 * @return
	 */
	public static String getUUIDKey() {
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	/**
	 * 生成为的ID
	 * @return
	 */
	public static String getUUID() {
		return "ID" + UUID.randomUUID().toString().replace("-", "");
	}
	
	public static void main(String[] args) {
		System.out.println(getUUIDKey());
		System.out.println(getUUIDKey());
	}
}
