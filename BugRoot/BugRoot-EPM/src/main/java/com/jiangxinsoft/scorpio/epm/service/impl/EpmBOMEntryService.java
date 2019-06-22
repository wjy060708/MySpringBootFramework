package com.jiangxinsoft.scorpio.epm.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import com.jiangxinsoft.scorpio.epm.mapper.EpmBOMEntryMapper;
import com.jiangxinsoft.scorpio.epm.model.EpmBOMEntry;
import com.jiangxinsoft.scorpio.epm.service.IEpmBOMEntryService;
import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.util.KeyGenerator;

@Service
public class EpmBOMEntryService implements IEpmBOMEntryService {
	
	@Autowired
	private EpmBOMEntryMapper epmBOMEntryMapper;

	@Override
	public void save(EpmBOMEntry pojo) throws RuntimeException {
		pojo.setEntryId(KeyGenerator.getUUIDKey());
		
		pojo.setCreateTime(new Date());
		pojo.setUpdateTime(new Date());
		
		epmBOMEntryMapper.insert(pojo);	
		
	}

	@Override
	public void update(EpmBOMEntry pojo) throws RuntimeException {
		pojo.setUpdateTime(new Date());
		
		epmBOMEntryMapper.updateByPrimaryKey(pojo);
		
	}

	@Override
	public EpmBOMEntry findByPrimaryKey(String entryId) {
		if(StringUtils.isNotBlank(entryId)) {
			return epmBOMEntryMapper.selectByPrimaryKey(entryId);
		}
		return null;
	}

	@Override
	public List<EpmBOMEntry> find(EpmBOMEntry pojo) {
		String orderBy = "CreateTime Asc";
		PageHelper.orderBy(orderBy);
		
		List<EpmBOMEntry> list = epmBOMEntryMapper.select(pojo);
		return list;
	}

	@Override
	public PageInfo<EpmBOMEntry> findByPage(EpmBOMEntry pojoVo,
			int currentPage, int pageSize, String sortName, String sortOrder) {
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "CreateTime Asc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}	
		
		List<EpmBOMEntry> list = epmBOMEntryMapper.select(pojoVo);		
		PageInfo<EpmBOMEntry> page = new PageInfo<EpmBOMEntry>(list);	
		
		return page;
	}

	@Override
	public void deleteByPrimaryKey(String entryId) throws RuntimeException {
		if(StringUtils.isBlank(entryId)) {
			throw new OperationException("产品清单删除失败,未指定删除的产品清单!");
		}
		
		Integer c = epmBOMEntryMapper.countByParent(entryId);
		if(c > 0) {
			throw new OperationException("产品清单删除失败,产品清单还有下级子清单!");
		}
		
		epmBOMEntryMapper.deleteByPrimaryKey(entryId);
		
	}

	@Override
	public void deleteByPrimaryKeys(String[] entryIds) throws RuntimeException {
		
	}

}
