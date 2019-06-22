package com.jiangxinsoft.scorpio.knowledge.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.jms.Destination;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.activemq.command.ActiveMQQueue;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.collect.Maps;
import com.jiangxinsoft.scorpio.common.Constants;
import com.jiangxinsoft.scorpio.config.IAppConfig;
import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.knowledge.model.KnowExcel;
import com.jiangxinsoft.scorpio.knowledge.model.KnowMode;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModeConsequence;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModePrevention;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModeReason;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModeRule;
import com.jiangxinsoft.scorpio.knowledge.model.KnowType;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeConsequenceService;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModePreventionService;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeReasonService;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeRuleService;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeService;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowTypeService;
import com.jiangxinsoft.scorpio.knowledge.service.ISolrService;
import com.jiangxinsoft.scorpio.knowledge.service.impl.MessageProducerService;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.base.SysCurrentUser;
import com.jiangxinsoft.scorpio.sys.constants.SysConstants;
import com.jiangxinsoft.scorpio.sys.model.SysFileResource;
import com.jiangxinsoft.scorpio.sys.service.ISysFileResourceService;
import com.jiangxinsoft.scorpio.util.FileUtil;
import com.jiangxinsoft.scorpio.util.KeyGenerator;
import com.jiangxinsoft.scorpio.util.OfficeUtil;

@Controller
@RequestMapping("/knowledge/mode")
public class KnowModeController {
	
	@Autowired
	private IAppConfig appConfig;
	
	@Autowired
	private IKnowModeService iKnowModeService;
	
	@Autowired
	private IKnowModeReasonService knowModeReasonService;
	
	@Autowired
	private IKnowModeConsequenceService knowModeConsequenceService;
	
	@Autowired
	private IKnowModePreventionService knowModePreventionService;
	
	@Autowired
	private IKnowModeRuleService knowModeRuleService;
	
	@Autowired
	private IKnowModeReasonService   iKnowModeReasonService;
	
	@Autowired
	private IKnowModeConsequenceService   iKnowModeConsequenceService;
	
	@Autowired
	private IKnowModePreventionService  iKnowModePreventionService;
	
	@Autowired
	private IKnowTypeService iKnowTypeService;
	
	@Autowired
	private ISysFileResourceService pdmFileResourceService;
	
	@Autowired
	private MessageProducerService producerService;
	
	@RequestMapping("/default")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("knowledge/mode/default");
		return modelAndView;
	}
	
	@RequestMapping("/expe")
	public ModelAndView page(String modeId,KnowModeReason knowModeReason,KnowModeConsequence knowModeConsequence
					,KnowModePrevention knowModePrevention,KnowModeRule knowModeRule) {
		ModelAndView modelAndView = new ModelAndView();
		
		KnowMode knowMode = iKnowModeService.findByPrimaryKey(modeId);
		List<KnowModeReason> listModeReason = knowModeReasonService.find(knowModeReason);
		List<KnowModeConsequence> listModeConsequence = knowModeConsequenceService.find(knowModeConsequence);
		List<KnowModePrevention> listModePrevention = knowModePreventionService.find(knowModePrevention);
		List<KnowModeRule> listModeRule = knowModeRuleService.find(knowModeRule);
		
		modelAndView.addObject("knowMode", knowMode);
		modelAndView.addObject("listModeReason", listModeReason);
		modelAndView.addObject("listModeConsequence", listModeConsequence);
		modelAndView.addObject("listModePrevention", listModePrevention);
		modelAndView.addObject("listModeRule", listModeRule);
		modelAndView.setViewName("knowledge/mode/expe");
		
		return modelAndView;
	
	}
	
	@RequestMapping("/new")
	public ModelAndView pageNew() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("knowledge/mode/new");
		return modelAndView;
	}

	@RequestMapping("/edit")
	public ModelAndView pageEdit(String modeId) {
		ModelAndView modelAndView = new ModelAndView();
	
		if(StringUtils.isNotBlank(modeId)) {
			KnowMode knowMode = iKnowModeService.findByPrimaryKey(modeId);
			if(knowMode != null) {
				
				modelAndView.addObject("knowMode", knowMode);
				modelAndView.setViewName("knowledge/mode/edit");
				
				return modelAndView;
			}
		}
		
		modelAndView.addObject("message", "没有指定需要编辑的知识模式信息,或知识模式信息已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}
	
	@RequestMapping("/upload")
	public ModelAndView pageUpload(String modeId) {
		ModelAndView modelAndView = new ModelAndView();
		if(StringUtils.isNotBlank(modeId)) {
			KnowMode knowMode = iKnowModeService.findByPrimaryKey(modeId);
			if(knowMode != null) {
				modelAndView.addObject("knowMode", knowMode);
				modelAndView.setViewName("knowledge/mode/upload");
				
				return modelAndView;
			}
		}
		
		modelAndView.addObject("message", "没有指定需要上传文档的目录,或文档目录已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_FRM_PAGE);
		
		return modelAndView;
	}
	
	@RequestMapping("/upload1")
	public ModelAndView pageUpload1(String typeId) {
		ModelAndView modelAndView = new ModelAndView();
		if(StringUtils.isNotBlank(typeId)) {
			KnowType knowType = iKnowTypeService.findByPrimaryKey(typeId);
			if(knowType != null) {
				modelAndView.addObject("knowType", knowType);
				modelAndView.setViewName("knowledge/mode/upload1");
				
				return modelAndView;
			}
		}
		
		modelAndView.addObject("message", "没有指定需要上传文档的目录,或文档目录已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_FRM_PAGE);
		
		return modelAndView;
	}
	
	/**
	 * 文件上传
	 * @return
	 */		
	@ResponseBody
	@RequestMapping("/save")
	public RestResponse save(HttpServletRequest request,KnowMode pojo,String[] keyWord) {
		
		pojo.setModeId(KeyGenerator.getUUIDKey());
		Map<String,Object> map = Maps.newHashMap();
		String typeName = pojo.getTypeName();	
		String typeId = iKnowTypeService.getTypeId(typeName);
	
		pojo.setTypeId(typeId);
		pojo.setKeyWords(StringUtils.join(keyWord,";"));
		
		HttpSession session = request.getSession();
	    Object name1 =  session.getAttribute("org.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEY");
	    pojo.setCurrentUser(name1+"");
	    map.put("modeId", pojo.getModeId());
	    map.put("modeName", pojo.getModeName());
	    map.put("typeId", typeId);
		iKnowModeService.save(pojo);

		return RestResponse.success("保存知识模式信息成功!").setData(map);
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public RestResponse update(KnowMode pojo) {
		iKnowModeService.update(pojo);
		
		//更新索引库
		Destination destination = new ActiveMQQueue("mode.update");
		producerService.sendUpdateMessage(destination, pojo.getModeId());
		return RestResponse.success("更新知识模式信息成功!");
	}
	
	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<KnowMode> listPage(KnowMode pojoVo, int page, int rows, String sort, String order) {
		PageInfo<KnowMode> retPage = null;
		String typeId = pojoVo.getTypeId();
		if(StringUtils.isNotBlank(typeId)) {
			retPage = iKnowModeService.findByPage(pojoVo, page, rows, sort, order);
		}
		return retPage;	
	}
	
	@ResponseBody
	@RequestMapping("/listPage1")
	public PageInfo<KnowMode> listPage1(KnowMode pojoVo, int page, int rows, String sort, String order) {
		PageInfo<KnowMode> retPage = iKnowModeService.findByPage(pojoVo, page, rows, sort, order);
		return retPage;
	}
	
	@ResponseBody
	@RequestMapping("/listAll")
	public ModelAndView listAll(KnowMode knowMode) {
			ModelAndView modelAndView = new ModelAndView();
			List<KnowMode> listModes = iKnowModeService.find(knowMode);
			modelAndView.addObject("listModes", listModes);	
			modelAndView.setViewName("knowledge/list");

			return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/listAll1")
	public List<KnowMode> listAll1(KnowMode knowMode) {
			
			List<KnowMode> listModes = iKnowModeService.find(knowMode);
			
			return listModes;
	}
	
	@RequestMapping("/manage")
	public ModelAndView pageManage(String modeId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotEmpty(modeId)) {
			KnowMode knowMode = iKnowModeService.findByPrimaryKey(modeId);
			
			modelAndView.addObject("knowMode", knowMode);
		}
		modelAndView.setViewName("knowledge/mode/manage");
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public RestResponse delete(String[] modeIds) {
		iKnowModeService.deleteByPrimaryKeys(modeIds);
		Destination destination = new ActiveMQQueue("mode.deleteAll");
		producerService.sendDeleteAllMessage(destination, modeIds);
		return RestResponse.success("删除知识信息成功!");
	}

	 /**
	  * 读取Xlsx
	  * path：文件所在路径
	  * @param path
	  * @return
	  * @throws Exception
	  */
	
	private  String getStringVal(HSSFCell cell) {
		
		switch (cell.getCellType()) {
		case Cell.CELL_TYPE_BOOLEAN:
			return cell.getBooleanCellValue() ? "TRUE" : "FALSE";
		
		case Cell.CELL_TYPE_FORMULA:
			return cell.getCellFormula();
		
		case Cell.CELL_TYPE_NUMERIC:
			 cell.setCellType(Cell.CELL_TYPE_STRING);
			 return cell.getStringCellValue();
			 
		case Cell.CELL_TYPE_STRING:
			return cell.getStringCellValue();
			
		default:
			return "";
		}
	}
	
	@ResponseBody
	@RequestMapping("/fileUpload")
	public RestResponse documentUpload(String modeId, @RequestParam("Filedata")MultipartFile fileData
			,KnowMode knowMode,KnowModeReason knowModeReason
			,KnowModeConsequence knowModeConsequence,KnowModePrevention knowModePrevention) {
		RestResponse retMessage = null;
		
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
					fileData.transferTo(file);
					
					// 存储文件记录
					
					String path = fileResource.getFileDirectory()+"/"+fileResource.getFilePath()+"/"+fileResource.getFileName();
					
					InputStream is = new FileInputStream(path);
					
					XSSFWorkbook xssfWorkbook = new XSSFWorkbook(is);

					for(Sheet xssfSheet : xssfWorkbook) {
						if(xssfSheet == null) {
							continue;
							}
	
						for (int rowNum = 1; rowNum <= xssfSheet.getLastRowNum(); rowNum ++) {
							XSSFRow xssfRow = (XSSFRow) xssfSheet.getRow(rowNum);
							
							int minCollx = xssfRow.getFirstCellNum();
							int maxCollx = xssfRow.getLastCellNum(); 
							KnowExcel knowExcel = new KnowExcel();
							
							for(int collx = minCollx; collx < maxCollx; collx ++) {
								XSSFCell  cell = xssfRow.getCell(collx);
								if(cell == null) {
									continue;
								}
								    if(collx ==0){
								    	knowExcel.setModeReason(cell.toString());
								    	knowModeReason.setReasonContent(knowExcel.getModeReason());
								    	iKnowModeReasonService.save(knowModeReason);
								    }
								    else if(collx ==1){
										knowExcel.setModeConsequence(cell.toString());
										knowModeConsequence.setConsequenceContent(knowExcel.getModeConsequence());
								    	iKnowModeConsequenceService.save(knowModeConsequence);
								    }
								    else if(collx ==2){
										knowExcel.setPrevention(cell.toString());
										knowModePrevention.setPreventionContent(knowExcel.getPrevention());
								    	iKnowModePreventionService.save(knowModePrevention);
								    }
							}
						}
					}
					// 存储文件记录
					iKnowModeService.saveModeTemplate(modeId, fileResource);
					
					retMessage = RestResponse.success("文件上传成功!");
				} catch (Exception e) {
					retMessage = RestResponse.failure("文件上传失败!");
				}
			}
		}
		return retMessage;
	}
	

	@RequestMapping("/downFile")
	public String downloadDocument(String resourceId, HttpServletRequest request, HttpServletResponse response) throws OperationException {
		
		if(StringUtils.isNotBlank(resourceId)) {
			SysFileResource fileResource = pdmFileResourceService.getFileResourceById(resourceId);

			if(fileResource != null) {
				System.out.println("123");
				String fileDirectory = fileResource.getFileDirectory();
				String filePath = fileResource.getFilePath();
				String fileName = fileResource.getFileName();
				String fileTitle = fileResource.getFileTitle() + "." + fileResource.getFileExtension();
				
				File file = FileUtil.getFile(fileDirectory, filePath, fileName);
				
				try {
					fileTitle = new String(fileTitle.getBytes("utf-8"), "ISO8859-1");
		        	response.setHeader("Content-disposition", "attachment; filename=" + fileTitle);
		        	
		        	long fileLength = file.length();
		        	response.setHeader("Content-Length", String.valueOf(fileLength));
		        	
		        	InputStream bis = null;   
			        OutputStream bos = null;
			        
		        	try {
						bis = new BufferedInputStream(new FileInputStream(file));
						bos = new BufferedOutputStream(response.getOutputStream());
			            
			            byte[] bytes = new byte[2048];
			            int bytesRead;
			            
			            while (-1 != (bytesRead = bis.read(bytes, 0, bytes.length))) {
			            	bos.write(bytes, 0, bytesRead);
			            }
					} catch (FileNotFoundException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					} finally {
			        	if (bis != null) {
			        		bis.close();   
			        	}
			        	
			        	if (bos != null) {
			        		bos.close();   
			        	}
			        }
				} catch (Exception e) {
					throw new OperationException("下载原始文档异常!");
				}
			}
		}
		return null;
	}
	
/**
 * 
 * @param request
 * @param pojo
 * @param knowModeReason
 * @param knowModeConsequence
 * @param knowModePrevention
 * @param knowModeRule
 * @return
 */
	@ResponseBody
	@RequestMapping("/saveKnowMode")
	public RestResponse saveKnowMode(HttpServletRequest request,String modeName1,
			String modeId1,String typeId,KnowModeReason knowModeReason,
			KnowModeConsequence knowModeConsequence,
			KnowModePrevention knowModePrevention,
			KnowModeRule knowModeRule) {

		//保存缺陷后果
		knowModeConsequence.setModeId(modeId1);
		knowModeConsequence.setTypeId(typeId);
		knowModeConsequenceService.save(knowModeConsequence);
		
		//保存缺陷预防措施
		knowModePrevention.setModeId(modeId1);
		knowModePrevention.setTypeId(typeId);
		knowModePreventionService.save(knowModePrevention);
		
		//保存缺陷原因
		knowModeReason.setModeId(modeId1);
		knowModeReason.setTypeId(typeId);
		knowModeReasonService.save(knowModeReason);
		
		Destination destination = new ActiveMQQueue("mode.add");
		producerService.sendMessage(destination, modeId1);
		
		return RestResponse.success("保存知识模式信息成功!");
	}
	
}
