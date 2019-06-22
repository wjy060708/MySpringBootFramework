package com.jiangxinsoft.scorpio.sys.controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.jiangxinsoft.scorpio.common.Constants;
import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.sys.constants.SysConstants;
import com.jiangxinsoft.scorpio.sys.model.SysOrganization;
import com.jiangxinsoft.scorpio.sys.model.SysPosition;
import com.jiangxinsoft.scorpio.sys.model.SysRole;
import com.jiangxinsoft.scorpio.sys.model.SysUser;
import com.jiangxinsoft.scorpio.sys.service.ISysOrganizationService;
import com.jiangxinsoft.scorpio.sys.service.ISysPositionService;
import com.jiangxinsoft.scorpio.sys.service.ISysRoleService;
import com.jiangxinsoft.scorpio.sys.service.ISysUserService;

@RequestMapping("/sys/user/manage")
@Controller
public class SysUserManageController {
	
	@Autowired
	private ISysUserService sysUserService;
	
	@Autowired
	private ISysRoleService sysRoleService;
	
	@Autowired
	private ISysPositionService sysPositionService;
	
	@Autowired
	private ISysOrganizationService sysOrganizationService;
	
	@RequestMapping("/default")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sys/user/manage/default");
		return modelAndView;
	}
	
	@RequestMapping("/new")
	public ModelAndView pageNew() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sys/user/manage/new");
		return modelAndView;
	}
	
	@RequestMapping("/edit")
	public ModelAndView pageEdit(String userId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotBlank(userId)) {
			SysUser user = sysUserService.getUserById(userId);
			if(user != null) {
				modelAndView.addObject("user", user);
				modelAndView.setViewName("sys/user/manage/edit");
				
				return modelAndView;
			}
		}
		
		modelAndView.addObject("message", "没有指定需要编辑的系统用户,或系统用户已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}
	
	@RequestMapping("/upload")
	public ModelAndView pageUpload() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("sys/user/manage/upload");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/save")
	public RestResponse save(SysUser user) {
		sysUserService.saveUser(user);
		
		return RestResponse.success("保存系统用户成功!");
	}
	
	@ResponseBody
	@RequestMapping("/userUpload")
	public RestResponse userUpload(@RequestParam("Filedata")MultipartFile fileData) {
		try {
    		InputStream iStream = fileData.getInputStream();
    		
    		XSSFWorkbook workBook = new XSSFWorkbook(iStream);
            XSSFSheet sheet = workBook.getSheetAt(0);
            if (sheet != null) {
            	List<SysUser> listUsers = new ArrayList<SysUser>();
            	
            	int nRows = sheet.getPhysicalNumberOfRows();
            	if(nRows > 1) {
            		for (int i = 1; i < nRows; i++) {	// 从第一行开始读取导入数据
                        XSSFRow row = sheet.getRow(i);
                        
                        SysUser user = new SysUser();
                        
                        for(int j = 1;j < SysConstants.SYS_USER_PROPERTY.length;j ++) {	// 从第1列开始处理
                        	 XSSFCell cell1 = row.getCell(j);
                        	 BeanUtils.setProperty(user, SysConstants.SYS_USER_PROPERTY[j], cell1.toString());
                        }
                        
                        listUsers.add(user);
                    } 
                	// 对导入的系统用户进行批量存储
            		sysUserService.saveUsers(listUsers);
            		
            		return RestResponse.success("批量导入系统用户成功!");
            	}
            } 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return RestResponse.failure("批量导入系统用户出错!");
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public RestResponse update(SysUser user) {
		sysUserService.updateUser(user);
		
		return RestResponse.success("更新系统用户成功!");
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public RestResponse delete(String[] userIds) {
		sysUserService.deleteUserByIds(userIds);
		
		return RestResponse.success("删除系统用户成功!");
	}
	
	// 返回用户角色
	@ResponseBody
	@RequestMapping("/listRole")
	public List<SysRole> listUserRole(String userId) {
		List<SysRole> list = null;
		if(StringUtils.isNotBlank(userId)) {
			list = sysRoleService.getUserGrantedRoles(userId);
		} else {
			list = new ArrayList<SysRole>();
		}
		return list;
	}
	
	// 返回用户岗位
	@ResponseBody
	@RequestMapping("/listPosition")
	public List<SysPosition> listUserPosition(String userId) {
		List<SysPosition> list = null;
		if(StringUtils.isNotBlank(userId)) {
			list = sysPositionService.getUserPositions(userId);
		} else {
			list = new ArrayList<SysPosition>();
		}
		return list;
	}
	
	// 返回用户岗位
	@ResponseBody
	@RequestMapping("/listDepartment")
	public List<SysOrganization> listUserDepartment(String userId) {
		List<SysOrganization> list = null;
		if(StringUtils.isNotBlank(userId)) {
			list = sysOrganizationService.getUserOrganizations(userId);
		} else {
			list = new ArrayList<SysOrganization>();
		}
		return list;
	}
	
}
