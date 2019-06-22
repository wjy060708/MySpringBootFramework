package com.jiangxinsoft.scorpio.knowledge.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Maps;
import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.sys.base.SysCurrentUser;
import com.jiangxinsoft.scorpio.sys.model.SysUser;
import com.jiangxinsoft.scorpio.sys.service.ISysUserService;
/**
 * 上传图片
 * @author Administrator
 *
 */
@Controller
public class UploadImageController {
	
	@Autowired
	private ISysUserService sysUserService;
	
	@ResponseBody
	@RequestMapping("/uploadImages")
	public String uploadImage(ServletRequest request,@RequestParam("file")MultipartFile file) throws IllegalStateException, IOException {
		
		System.out.println("12233");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmSSss");
		String res = sdf.format(new Date());


		String rootPath = ResourceUtils.getURL("classpath:static/uploadImages").getPath();
		
		//源文件名
		String origFileName = file.getOriginalFilename();
		String newFileName = res + origFileName.substring(origFileName.lastIndexOf("."));
		
		//创建年月日文件
		Calendar data = Calendar.getInstance();
		File dataDirs = new File(data.get(Calendar.YEAR) + File.separator + (data.get(Calendar.MONTH) + 1));
		File newFile=  new File(rootPath + File.separator + newFileName);
		
		if(!newFile.getParentFile().exists()) {
			newFile.getParentFile().mkdirs();
		}
	 
	    file.transferTo(newFile);
	    //完整的url
	    String fileUrl = "uploadImages/" +newFileName;
	 
	    Map<String,Object> map = new HashMap<String,Object>();
	    Map<String,Object> map2 = new HashMap<String,Object>();
	    map.put("code", 0);
	    map.put("msg", "上传成功");
	    map.put("data", map2);
	    map2.put("src", fileUrl);
	    map2.put("title", newFileName);
	    String result = new JSONObject(map).toString();
		return result;
	}
	
	/**
	 * 富文本框上穿图片
	 * @param request
	 * @param file
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping("/uploadImages2")
	public String uploadImage2(ServletRequest request,@RequestParam("file")MultipartFile file) throws IllegalStateException, IOException {
		
		System.out.println("12233");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmSSss");
		String res = sdf.format(new Date());


		String rootPath = ResourceUtils.getURL("classpath:static/uploadImages").getPath();
		
		//源文件名
		String origFileName = file.getOriginalFilename();
		String newFileName = res + origFileName.substring(origFileName.lastIndexOf("."));
		
		//创建年月日文件
		Calendar data = Calendar.getInstance();
		File dataDirs = new File(data.get(Calendar.YEAR) + File.separator + (data.get(Calendar.MONTH) + 1));
		File newFile=  new File(rootPath + File.separator + newFileName);
		
		if(!newFile.getParentFile().exists()) {
			newFile.getParentFile().mkdirs();
		}
	 
	    file.transferTo(newFile);
	    //完整的url
	    String fileUrl = "/uploadImages/" +newFileName;
	 
	    Map<String,Object> map = new HashMap<String,Object>();
	    Map<String,Object> map2 = new HashMap<String,Object>();
	    map.put("code", 0);
	    map.put("msg", "上传成功");
	    map.put("data", map2);
	    map2.put("src", fileUrl);
	    map2.put("title", newFileName);
	    String result = new JSONObject(map).toString();
		return result;
	}

	@ResponseBody
	@RequestMapping("/uploadImage")
	public RestResponse uploadImages(ServletRequest request,@RequestParam("Filedata")MultipartFile fileData) throws IllegalStateException, IOException {
		
		Map<String,Object> map = Maps.newHashMap();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmSSss");
		
		String res = sdf.format(new Date());
		String rootPath = ResourceUtils.getURL("classpath:static/uploadImages").getPath();
		//源文件名
		String origFileName = fileData.getOriginalFilename();
		String newFileName = res + origFileName.substring(origFileName.lastIndexOf("."));
		
		//创建年月日文件
		Calendar data = Calendar.getInstance();
		File dataDirs = new File(data.get(Calendar.YEAR) + File.separator + (data.get(Calendar.MONTH) + 1));
		File newFile=  new File(rootPath + File.separator + newFileName);
		
		if(!newFile.getParentFile().exists()) {
			newFile.getParentFile().mkdirs();
		}
	 
		fileData.transferTo(newFile);
	  
	    String fileUrl = "uploadImages/" +newFileName;
	    
	    try {
	    	map.put("imageUrl", fileUrl);
	 	    
	 	    return RestResponse.success("文件上传成功!").setData(map);
		} catch (IllegalStateException e) {
			
			return RestResponse.failure("文件上传失败!");
		}	
	 
	}
	
	@ResponseBody
	@RequestMapping("/uploadUserIcon")
	public String uploadUserIcon(ServletRequest request,@RequestParam("file")MultipartFile file) throws IllegalStateException, IOException {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmSSss");
		String res = sdf.format(new Date());


		String rootPath = ResourceUtils.getURL("classpath:static/uploadImages").getPath();
		
		//源文件名
		String origFileName = file.getOriginalFilename();
		String newFileName = res + origFileName.substring(origFileName.lastIndexOf("."));
		
		//创建年月日文件
		Calendar data = Calendar.getInstance();
		File dataDirs = new File(data.get(Calendar.YEAR) + File.separator + (data.get(Calendar.MONTH) + 1));
		File newFile=  new File(rootPath + File.separator + newFileName);
		
		if(!newFile.getParentFile().exists()) {
			newFile.getParentFile().mkdirs();
		}
	 
	    file.transferTo(newFile);
	    //完整的url
	    String fileUrl = "uploadImages/" +newFileName;
	 
	    Map<String,Object> map = new HashMap<String,Object>();
	    Map<String,Object> map2 = new HashMap<String,Object>();
	    
	    SysUser user = new SysUser();
	    user.setUserId(SysCurrentUser.getUserId());
	    user.setUserIcon(fileUrl);
	    sysUserService.updateUser(user);
	    
	    map.put("code", 0);
	    map.put("msg", "上传成功");
	    map.put("data", map2);
	    map2.put("src", fileUrl);
	    map2.put("title", newFileName);
	    String result = new JSONObject(map).toString();
		return result;
	}
}
