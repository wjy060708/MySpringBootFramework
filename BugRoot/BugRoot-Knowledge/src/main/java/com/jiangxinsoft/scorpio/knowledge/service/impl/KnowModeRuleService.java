package com.jiangxinsoft.scorpio.knowledge.service.impl;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.knowledge.mapper.KnowModeRuleMapper;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModeRule;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeRuleService;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.mapper.SysFileResourceMapper;
import com.jiangxinsoft.scorpio.sys.model.SysFileResource;
import com.jiangxinsoft.scorpio.util.FileUtil;
import com.jiangxinsoft.scorpio.util.KeyGenerator;
import com.jiangxinsoft.scorpio.util.OfficeUtil;


@Service
public class KnowModeRuleService implements IKnowModeRuleService{
	
	@Autowired
	private KnowModeRuleMapper knowModeRuleMapper;
	
	@Autowired
	private SysFileResourceMapper sysFileResourceMapper;

	@Override
	public void save(KnowModeRule pojo) throws RuntimeException {
		pojo.setRuleId(KeyGenerator.getUUIDKey());
		
		knowModeRuleMapper.insert(pojo);
		
	}

	@Override
	public void update(KnowModeRule pojo) throws RuntimeException {
	
		knowModeRuleMapper.updateByPrimaryKey(pojo);
	}

	@Override
	public KnowModeRule findByPrimaryKey(String ruleId) {
		if(StringUtils.isNotBlank(ruleId)) {
			return knowModeRuleMapper.selectByPrimaryKey(ruleId);
		}
		return null;
	}

	@Override
	public List<KnowModeRule> find(KnowModeRule pojo) {
		List<KnowModeRule> list = knowModeRuleMapper.select(pojo);
		return list;
	}

	@Override
	public PageInfo<KnowModeRule> findByPage(KnowModeRule pojoVo,
			int currentPage, int pageSize, String sortName, String sortOrder) {
		
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "CreateTime Asc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<KnowModeRule> list = knowModeRuleMapper.select(pojoVo);
		PageInfo<KnowModeRule> page = new PageInfo<KnowModeRule>(list);
		
		return page;
	}

	@Override
	public void deleteByPrimaryKey(String id) throws RuntimeException {
		
	}

	@Override
	public void deleteByPrimaryKeys(String[] ids) throws RuntimeException {
		if(ids != null) {
			knowModeRuleMapper.deleteByPrimaryKeys(ids);
		} else {
			throw new OperationException("删除缺陷规则失败,未指定删除的缺陷规则内容!");
		}
	}

	@Override
	public void downloadDocument(String ruleId, HttpServletRequest request,
			HttpServletResponse response) throws OperationException {
		if(StringUtils.isNotBlank(ruleId)) {
			KnowModeRule knowModeRule = knowModeRuleMapper.selectByPrimaryKey(ruleId);
			if(knowModeRule != null) {
				String resourceId = knowModeRule.getResourceId();
				
				if(StringUtils.isNotBlank(resourceId)) {
					SysFileResource fileResource = sysFileResourceMapper.selectByPrimaryKey(resourceId);
					if(fileResource != null) {
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
							throw new OperationException("下载规则文档异常!");
						}
					}
				}
			}
		}
		
	}

	@Override
	public boolean isDocumentReady(String ruleId) throws OperationException {
		if(StringUtils.isNotBlank(ruleId)) {
			KnowModeRule knowModeRule = knowModeRuleMapper.selectByPrimaryKey(ruleId);
		
			if(knowModeRule != null) {
				String resourceId = knowModeRule.getResourceId();
				if(StringUtils.isNotBlank(resourceId)) {
					SysFileResource fileResource = sysFileResourceMapper.selectByPrimaryKey(resourceId);
				
					if(fileResource != null) {
						
						String fileDirectory = fileResource.getFileDirectory();				
						String filePath = fileResource.getFilePath();										
						String fileName = fileResource.getFileName();						
						String fileExtension = fileResource.getFileExtension();
						
						File pdfFile = null;
						if(OfficeUtil.isOffice(fileExtension)) {
							pdfFile = FileUtil.getFile(fileDirectory, filePath, fileName);
						} else if(OfficeUtil.isPdfDocument(fileExtension)) {
							pdfFile = FileUtil.getFile(fileDirectory, filePath, fileName);
						}
						
						if((pdfFile != null) && (pdfFile.exists())) {
							return true;
						}
					} else {
						throw new OperationException("文档资源不存在!");
					}
				} else {
					throw new OperationException("文档资源不存在!");
				}
			} else {
				throw new OperationException("规则文档不存在!");
			  }
		} else {
			throw new OperationException("没有指定规则文档!");
		}
		
		return true;
	}

	@Override
	public void downloadPdfDocument(String ruleId, HttpServletRequest request,
			HttpServletResponse response) throws OperationException {
		if(StringUtils.isNotBlank(ruleId)) {
			KnowModeRule knowModeRule = knowModeRuleMapper.selectByPrimaryKey(ruleId);
			if(knowModeRule != null) {
				String resourceId = knowModeRule.getResourceId();
				
				if(StringUtils.isNotBlank(resourceId)) {
					SysFileResource fileResource = sysFileResourceMapper.selectByPrimaryKey(resourceId);
					if(fileResource != null) {
						String fileTitle = fileResource.getFileTitle();
						String fileDirectory = fileResource.getFileDirectory();
						String filePath = fileResource.getFilePath();
						String fileName = fileResource.getFileName();
						String fileName2 = fileResource.getFileName2();
						
						String fileExtension = fileResource.getFileExtension();
						
						File pdfFile = null;
						if(OfficeUtil.isOffice(fileExtension)) {
							pdfFile = FileUtil.getFile(fileDirectory, filePath, fileName);
						} else if(OfficeUtil.isPdfDocument(fileExtension)) {
							pdfFile = FileUtil.getFile(fileDirectory, filePath, fileName2);
						}
						
						if((pdfFile != null) && (pdfFile.exists())) {
							try {
								fileTitle = fileTitle + ".pdf";	// PDF 文件
								fileTitle = new String(fileTitle.getBytes("utf-8"), "ISO8859-1");
					        	response.setHeader("Content-disposition", "attachment; filename=" + fileTitle);
								
					        	long fileLength = pdfFile.length();
					        	response.setHeader("Content-Length", String.valueOf(fileLength));
					        	
					        	InputStream bis = null;   
						        OutputStream bos = null;
						        
					        	try {
									bis = new BufferedInputStream(new FileInputStream(pdfFile));
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
								throw new OperationException("下载Pdf文档异常!");
							}
						}	
					}
				}
			}
		}
		
	}

	@Override
	public void getPdfDocument(String ruleId, HttpServletRequest request,
			HttpServletResponse response) throws OperationException {
		if(StringUtils.isNotBlank(ruleId)) {
			KnowModeRule knowModeRule = knowModeRuleMapper.selectByPrimaryKey(ruleId);
			
			if(knowModeRule != null) {
				String resourceId = knowModeRule.getResourceId();
				if(StringUtils.isNotBlank(resourceId)) {
					SysFileResource fileResource = sysFileResourceMapper.selectByPrimaryKey(resourceId);
					if(fileResource != null) {
						String fileTitle = fileResource.getFileTitle();
						String fileDirectory = fileResource.getFileDirectory();
						String filePath = fileResource.getFilePath();
						String fileName = fileResource.getFileName();
						String fileExtension = fileResource.getFileExtension();

						File pdfFile = null;
						if(OfficeUtil.isOffice(fileExtension)) {
							pdfFile = FileUtil.getFile(fileDirectory, filePath, fileName);
						} else if(OfficeUtil.isPdfDocument(fileExtension)) {
							pdfFile = FileUtil.getFile(fileDirectory, filePath, fileName);		
						}
						
						if((pdfFile != null) && (pdfFile.exists())) {
							try {
								fileTitle = new String(fileTitle.getBytes("utf-8"), "ISO8859-1");
								
								response.setContentType("application/pdf;");
								
								InputStream bis = null;   
						        OutputStream bos = null;
						        
						        try {
									bis = new BufferedInputStream(new FileInputStream(pdfFile));
									bos = new BufferedOutputStream(response.getOutputStream());
									
									byte[] bytes = new byte[2048];
						            int bytesRead;
						            
						            while (-1 != (bytesRead = bis.read(bytes, 0, bytes.length))) {
						            	bos.write(bytes, 0, bytesRead);
						            }
								} finally {
									if (bis != null) {
						        		bis.close();   
						        	}
						        	
						        	if (bos != null) {
						        		bos.close();   
						        	}
								}
							} catch(Exception e) {
								throw new OperationException("获取Pdf文档异常!");
							}
						}
					}
				}
			}
		}
		
	}
}
