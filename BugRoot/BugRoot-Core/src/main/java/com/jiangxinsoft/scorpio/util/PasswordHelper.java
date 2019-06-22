package com.jiangxinsoft.scorpio.util;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

/**
 * 密码辅助类
 * @author J01052050
 *
 */
public class PasswordHelper {
	
    private final static String algorithmName = "md5";
    private final static int hashIterations = 2;
    
    public static String encryptPassword(String password, String salt) {
    	String newPassword = null;
    	if(StringUtils.isNotBlank(password)) {
    		if(StringUtils.isNotBlank(salt)) {
    			newPassword = new SimpleHash(algorithmName, password, ByteSource.Util.bytes(salt), hashIterations).toHex();
    		} else {
    			newPassword = new SimpleHash(algorithmName, password, null, hashIterations).toHex();
    		}
    	}
        
        return newPassword;
    }
    
    public static String encryptPassword(String password) {
    	String newPassword = null;
    	if(StringUtils.isNotBlank(password)) {
    		newPassword = new SimpleHash(algorithmName, password, null, hashIterations).toHex();
    	}
        
        return newPassword;
    }
    
    public static void main(String[] args) {
    	String newPassword = encryptPassword("123456", null);
    	System.out.println("newPassword: " + newPassword);
    }
}
