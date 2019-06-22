package com.jiangxinsoft.scorpio.epm.service.impl;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.jiangxinsoft.scorpio.epm.mapper.EpmProjectAchieMapper;
import com.jiangxinsoft.scorpio.epm.model.EpmProjectAchie;
import com.jiangxinsoft.scorpio.epm.service.IEpmProjectAchieService;
import com.jiangxinsoft.scorpio.exception.OperationException;

import com.jiangxinsoft.scorpio.pagehelper.PageInfo;

import com.jiangxinsoft.scorpio.sys.base.SysCurrentUser;
import com.jiangxinsoft.scorpio.sys.mapper.SysFileResourceMapper;
import com.jiangxinsoft.scorpio.sys.model.SysFileResource;
import com.jiangxinsoft.scorpio.util.FileUtil;
import com.jiangxinsoft.scorpio.util.KeyGenerator;
import com.jiangxinsoft.scorpio.util.OfficeUtil;

@Service
public class EpmProjectAchieService implements IEpmProjectAchieService {
	
	@Autowired
	private EpmProjectAchieMapper epmProjectAchieMapper;
	
	@Autowired
	private SysFileResourceMapper sysFileResourceMapper;

	@Override
	public void save(EpmProjectAchie pojo) throws RuntimeException {
		pojo.setAchieId(KeyGenerator.getUUIDKey());
		pojo.setUserId(SysCurrentUser.getUserId());
		pojo.setCreateTime(new Date());

		epmProjectAchieMapper.insert(pojo);

	}

	@Override
	public void update(EpmProjectAchie pojo) throws RuntimeException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public EpmProjectAchie findByPrimaryKey(String achieId) {
		if(StringUtils.isNotBlank(achieId)) {
			return epmProjectAchieMapper.selectByPrimaryKey(achieId);
		}
		
		return null;		
	}

	@Override
	public List<EpmProjectAchie> find(EpmProjectAchie pojo) {
		String orderBy = "CreateTime Asc";
		PageHelper.orderBy(orderBy);
		
		List<EpmProjectAchie> list = epmProjectAchieMapper.select(pojo);
		return list;
	}

	@Override
	public PageInfo<EpmProjectAchie> findByPage(EpmProjectAchie pojoVo,
			int currentPage, int pageSize, String sortName, String sortOrder) {
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "CreateTime Asc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<EpmProjectAchie> list = epmProjectAchieMapper.select(pojoVo);
		PageInfo<EpmProjectAchie> page = new PageInfo<EpmProjectAchie>(list);
		
		return page;
	}

	@Override
	public void deleteByPrimaryKey(String id) throws RuntimeException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteByPrimaryKeys(String[] ids) throws RuntimeException {
		if(ids != null) {
			epmProjectAchieMapper.deleteByPrimaryKeys(ids);		
		} else {
			throw new OperationException("删除项目成果失败,没有指定要删除的项目成果!");
		}
		
	}

	@Override
	public void downloadDocument(String achieId, HttpServletRequest request,
			HttpServletResponse response) throws OperationException {
		if(StringUtils.isNotBlank(achieId)) {
			EpmProjectAchie epmProjectAchie = epmProjectAchieMapper.selectByPrimaryKey(achieId);
			if(epmProjectAchie != null) {
				String resourceId = epmProjectAchie.getResourceId();
				
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
							throw new OperationException("下载原始文档异常!");
						}
					}
				}
			}
		}
		
	}

	@Override
	public boolean isDocumentReady(String achieId) throws OperationException {
		if(StringUtils.isNotBlank(achieId)) {
			EpmProjectAchie epmProjectAchie = epmProjectAchieMapper.selectByPrimaryKey(achieId);
		
			if(epmProjectAchie != null) {
				String resourceId = epmProjectAchie.getResourceId();
				if(StringUtils.isNotBlank(resourceId)) {
					SysFileResource fileResource = sysFileResourceMapper.selectByPrimaryKey(resourceId);
				
					if(fileResource != null) {
						
						String fileDirectory = fileResource.getFileDirectory();
						System.out.println(fileDirectory+"000000000000000000000000");
						
						String filePath = fileResource.getFilePath();
						System.out.println(filePath+"000000000000000000000000000");
						
						String fileName = fileResource.getFileName();
						
						String fileExtension = fileResource.getFileExtension();
						System.out.println(fileExtension+"000000000000000000000000000");
						
						File pdfFile = null;
						if(OfficeUtil.isOffice(fileExtension)) {
							pdfFile = FileUtil.getFile(fileDirectory, filePath, fileName);
							System.out.println(pdfFile.getAbsolutePath()+"000000000000000000000000000");
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
				throw new OperationException("项目成果不存在!");
			  }
		} else {
			throw new OperationException("没有指定文档!");
		}
		
		return true;
	}

	@Override
	public void getPdfDocument(String achieId, HttpServletRequest request,
			HttpServletResponse response) throws OperationException {
		if(StringUtils.isNotBlank(achieId)) {
			EpmProjectAchie epmProjectAchie = epmProjectAchieMapper.selectByPrimaryKey(achieId);
			
			if(epmProjectAchie != null) {
				String resourceId = epmProjectAchie.getResourceId();
				if(StringUtils.isNotBlank(resourceId)) {
					SysFileResource fileResource = sysFileResourceMapper.selectByPrimaryKey(resourceId);
					if(fileResource != null) {
						String fileTitle = fileResource.getFileTitle();
						String fileDirectory = fileResource.getFileDirectory();
						String filePath = fileResource.getFilePath();
						String fileName = fileResource.getFileName();


						String fileExtension = fileResource.getFileExtension();
						System.out.println(fileExtension+"000000000000000000000000000");

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

	@Override
	public void downloadPdfDocument(String achieId, HttpServletRequest request,
			HttpServletResponse response) throws OperationException {
		if(StringUtils.isNotBlank(achieId)) {
			EpmProjectAchie epmProjectAchie = epmProjectAchieMapper.selectByPrimaryKey(achieId);
			if(epmProjectAchie != null) {
				String resourceId = epmProjectAchie.getResourceId();
				
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

}
