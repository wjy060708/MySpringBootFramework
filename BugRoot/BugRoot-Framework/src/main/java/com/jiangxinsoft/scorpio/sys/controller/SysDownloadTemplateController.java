package com.jiangxinsoft.scorpio.sys.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/sys/download")
@Controller
public class SysDownloadTemplateController {
	
	@RequestMapping("/fileDownload")
	public void downloadDocument(String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
        if(StringUtils.isNoneBlank(fileName)) {
        	InputStream fis = null;
        	InputStream bis = null;   
            OutputStream bos = null;
            
            String resourcePath = "/templates/";
            try {
            	response.setContentType("application/x-msdownload;");
            	
            	fileName = new String(fileName.getBytes("utf-8"), "ISO8859-1");
            	response.setHeader("Content-disposition", "attachment; filename=" + fileName);
            	
            	fis = this.getClass().getResourceAsStream(resourcePath + fileName);
            	if(fis != null) {
            		bis = new BufferedInputStream(fis);
                	bos = new BufferedOutputStream(response.getOutputStream());
                    
                    byte[] bytes = new byte[2048];
                    int bytesRead;
                    
                    while (-1 != (bytesRead = bis.read(bytes, 0, bytes.length))) {
                    	bos.write(bytes, 0, bytesRead);
                    }
            	}
            } catch (Exception e) {
            	e.printStackTrace();
            } finally {
            	if (bis != null) {
            		bis.close();   
            	}
            	if (fis != null) {
            		fis.close();   
            	}
            	if (bos != null) {
            		bos.close();   
            	}
            }
        }
	}
}
