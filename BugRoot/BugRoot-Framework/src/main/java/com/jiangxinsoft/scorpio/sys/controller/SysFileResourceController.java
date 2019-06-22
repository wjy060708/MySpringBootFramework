package com.jiangxinsoft.scorpio.sys.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.collect.Maps;

import com.jiangxinsoft.scorpio.config.IAppConfig;
import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.base.SysCurrentUser;
import com.jiangxinsoft.scorpio.sys.constants.SysConstants;
import com.jiangxinsoft.scorpio.sys.model.SysFileResource;
import com.jiangxinsoft.scorpio.sys.service.ISysFileResourceService;
import com.jiangxinsoft.scorpio.sys.vo.FileResourceVo;
import com.jiangxinsoft.scorpio.util.FileUtil;
import com.jiangxinsoft.scorpio.util.OfficeUtil;

@RequestMapping("/sys/file")
@Controller
public class SysFileResourceController {
	
	@Autowired
	private IAppConfig appConfig;
	
	@Autowired
	private ISysFileResourceService sysFileResourceService;
	
	@RequestMapping("/default")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sys/file/default");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<SysFileResource> listPage(FileResourceVo fileResourceVo, int page, int rows, String sort, String order) {
		PageInfo<SysFileResource> retPage = sysFileResourceService.getFileResourcePage(fileResourceVo, page, rows, sort, order);
		return retPage;
	}
	
	/**
	 * 文件上传
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/upload")
	public RestResponse fileUpload(@RequestParam("file")MultipartFile fileData,HttpServletRequest request) {
		
		Map<String,Object> map = Maps.newHashMap();
		
		// 创建临时文件
		String fileResourceRoot = appConfig.getWebResourceRoot();
		if(StringUtils.isNotBlank(fileResourceRoot)) {
			
			// 文件标题
			String origFileName = fileData.getOriginalFilename();
			
			// 文件扩展名
			String fileExtension = FileUtil.getFileExtension(origFileName);
			if(OfficeUtil.isTypeSupport(fileExtension)) {	// 对上传的文件类型进行判断
				SysFileResource fileResource = new SysFileResource();
				String filePath = FileUtil.getUniqueFilePath();
				String fileName = FileUtil.getUniqueFileName();
				String fileTitle = FileUtil.getFileTitle(origFileName);
				
				FileUtil.makeFileDirectory(fileResourceRoot, filePath);
				
				fileResource.setUserId(SysCurrentUser.getUserId());
				fileResource.setFileTitle(fileTitle);
				fileResource.setFileDirectory(fileResourceRoot);
				fileResource.setFileName(fileName);
				fileResource.setFileExtension(fileExtension);
				fileResource.setFilePath(filePath);
				fileResource.setFileStatus(SysConstants.FILE_STATUS_NOT_ENABLED);
				
				File file = FileUtil.getFile(fileResourceRoot, filePath, fileName);
				
				try {
					// 文件转存
					fileData.transferTo(file);
					
					// 存储文件记录
					sysFileResourceService.saveFileResource(fileResource);
					
					map.put("fileId", fileResource.getFileId());
					map.put("fileName", fileTitle);
					return RestResponse.success("文件上传成功!").setData(map);
					
				} catch (IllegalStateException e) {
					
					return RestResponse.failure("文件上传失败!");
				} catch (IOException e) {
					return RestResponse.failure("文件上传失败!");
				}	
			} else {
				return RestResponse.failure("文件上传失败,文件类型不支持!");
			}
		} else {
			return RestResponse.failure("文件上传失败!");
		}
	}
	
	/**
	 * 文件上传
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/uploadfile")
	public RestResponse fileUpload2(@RequestParam("Filedata")MultipartFile fileData,HttpServletRequest request) {
		
		Map<String,Object> map = Maps.newHashMap();
		
		// 创建临时文件
		String fileResourceRoot = appConfig.getWebResourceRoot();
		if(StringUtils.isNotBlank(fileResourceRoot)) {
			
			// 文件标题
			String origFileName = fileData.getOriginalFilename();
			
			// 文件扩展名
			String fileExtension = FileUtil.getFileExtension(origFileName);
			if(OfficeUtil.isTypeSupport(fileExtension)) {	// 对上传的文件类型进行判断
				SysFileResource fileResource = new SysFileResource();
				String filePath = FileUtil.getUniqueFilePath();
				String fileName = FileUtil.getUniqueFileName();
				String fileTitle = FileUtil.getFileTitle(origFileName);
				
				FileUtil.makeFileDirectory(fileResourceRoot, filePath);
				
				fileResource.setUserId(SysCurrentUser.getUserId());
				fileResource.setFileTitle(fileTitle);
				fileResource.setFileDirectory(fileResourceRoot);
				fileResource.setFileName(fileName);
				fileResource.setFileExtension(fileExtension);
				fileResource.setFilePath(filePath);
				fileResource.setFileStatus(SysConstants.FILE_STATUS_NOT_ENABLED);
				
				File file = FileUtil.getFile(fileResourceRoot, filePath, fileName);
				
				try {
					// 文件转存
					fileData.transferTo(file);
					
					// 存储文件记录
					sysFileResourceService.saveFileResource(fileResource);
					
					map.put("fileId", fileResource.getFileId());
					map.put("fileName", fileTitle);
					return RestResponse.success("文件上传成功!").setData(map);
					
				} catch (IllegalStateException e) {
					
					return RestResponse.failure("文件上传失败!");
				} catch (IOException e) {
					return RestResponse.failure("文件上传失败!");
				}	
			} else {
				return RestResponse.failure("文件上传失败,文件类型不支持!");
			}
		} else {
			return RestResponse.failure("文件上传失败!");
		}
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public RestResponse delete(String[] ids) {
		sysFileResourceService.deleteFileResourceByIds(ids);
		
		return RestResponse.success("删除文件资源成功!");
	}

}
