package com.jiangxinsoft.scorpio.epm.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import com.jiangxinsoft.scorpio.epm.mapper.EpmProjectDocumentMapper;
import com.jiangxinsoft.scorpio.epm.model.EpmProjectDocument;
import com.jiangxinsoft.scorpio.epm.service.IEpmProjectDocumentService;
import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.util.KeyGenerator;

@Service
public class EpmProjectDocumentService implements IEpmProjectDocumentService {
	
	@Autowired
	private EpmProjectDocumentMapper epmProjectDocumentMapper;

	@Override
	public void save(EpmProjectDocument pojo) throws RuntimeException {
		pojo.setDocumentId(KeyGenerator.getUUIDKey());
		
		pojo.setCreateTime(new Date());
		pojo.setUpdateTime(new Date());
		
		epmProjectDocumentMapper.insert(pojo);			
	}

	@Override
	public void update(EpmProjectDocument pojo) throws RuntimeException {
		pojo.setUpdateTime(new Date());
		
		epmProjectDocumentMapper.updateByPrimaryKey(pojo);		
	}

	@Override
	public EpmProjectDocument findByPrimaryKey(String documentId) {
		if(StringUtils.isNotBlank(documentId)) {
			return epmProjectDocumentMapper.selectByPrimaryKey(documentId);
		}
		return null;
	}

	@Override
	public List<EpmProjectDocument> find(EpmProjectDocument pojo) {
		String orderBy = "CreateTime Asc";
		PageHelper.orderBy(orderBy);
		
		List<EpmProjectDocument> list = epmProjectDocumentMapper.select(pojo);
		return list;
	}

	@Override
	public PageInfo<EpmProjectDocument> findByPage(EpmProjectDocument pojoVo,
			int currentPage, int pageSize, String sortName, String sortOrder) {
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "CreateTime Asc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<EpmProjectDocument> list = epmProjectDocumentMapper.select(pojoVo);
		PageInfo<EpmProjectDocument> page = new PageInfo<EpmProjectDocument>(list);
		
		return page;
	}

	@Override
	public void deleteByPrimaryKey(String id) throws RuntimeException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteByPrimaryKeys(String[] documentIds) throws RuntimeException {
		if(documentIds != null) {
			epmProjectDocumentMapper.deleteByPrimaryKeys(documentIds);
		} else {
			throw new OperationException("删除项目文档失败,未指定删除的项目文档!");
		}
		
	}
	
}
