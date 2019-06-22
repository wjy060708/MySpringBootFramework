package com.jiangxinsoft.scorpio.epm.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import com.jiangxinsoft.scorpio.epm.mapper.EpmBOMTemplateMapper;
import com.jiangxinsoft.scorpio.epm.model.EpmBOMTemplate;
import com.jiangxinsoft.scorpio.epm.service.IEpmBOMTemplateService;
import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.util.KeyGenerator;

@Service
public class EpmBOMTemplateService implements IEpmBOMTemplateService {
	
	@Autowired
	private EpmBOMTemplateMapper epmBOMTemplateMapper;

	@Override
	public void save(EpmBOMTemplate pojo) throws RuntimeException {
		pojo.setTemplateId(KeyGenerator.getUUIDKey());
		
		pojo.setCreateTime(new Date());
		pojo.setUpdateTime(new Date());
		
		epmBOMTemplateMapper.insert(pojo);	
		
	}

	@Override
	public void update(EpmBOMTemplate pojo) throws RuntimeException {
		pojo.setUpdateTime(new Date());
		
		epmBOMTemplateMapper.updateByPrimaryKey(pojo);
	
	}

	@Override
	public EpmBOMTemplate findByPrimaryKey(String templateId) {
		if(StringUtils.isNotBlank(templateId)) {
			return epmBOMTemplateMapper.selectByPrimaryKey(templateId);
		}
		
		return null;		
	}

	@Override
	public List<EpmBOMTemplate> find(EpmBOMTemplate pojo) {
		String orderBy = "CreateTime Asc";
		PageHelper.orderBy(orderBy);
		
		List<EpmBOMTemplate> list = epmBOMTemplateMapper.select(pojo);
		return list;
	}

	@Override
	public PageInfo<EpmBOMTemplate> findByPage(EpmBOMTemplate pojoVo,
			int currentPage, int pageSize, String sortName, String sortOrder) {
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "CreateTime Asc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<EpmBOMTemplate> list = epmBOMTemplateMapper.select(pojoVo);
		PageInfo<EpmBOMTemplate> page = new PageInfo<EpmBOMTemplate>(list);
		
		return page;
	}

	@Override
	public void deleteByPrimaryKey(String id) throws RuntimeException {
		
	}

	@Override
	public void deleteByPrimaryKeys(String[] templateIds) throws RuntimeException {
		if(templateIds != null) {
			epmBOMTemplateMapper.deleteByPrimaryKeys(templateIds);
		} else {
			throw new OperationException("删除项目模板失败,未指定删除的项目模板!");
		}
	}
}
