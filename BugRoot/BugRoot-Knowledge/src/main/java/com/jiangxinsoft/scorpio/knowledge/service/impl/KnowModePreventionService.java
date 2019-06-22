package com.jiangxinsoft.scorpio.knowledge.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.knowledge.mapper.KnowModePreventionMapper;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModePrevention;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModePreventionService;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.util.KeyGenerator;


@Service
public class KnowModePreventionService implements IKnowModePreventionService{
	
	@Autowired
	private KnowModePreventionMapper knowModePreventionMapper;

	@Override
	public void save(KnowModePrevention pojo) throws RuntimeException {
		pojo.setPreventionId(KeyGenerator.getUUIDKey());
	
		knowModePreventionMapper.insert(pojo);
		
	}

	@Override
	public void update(KnowModePrevention pojo) throws RuntimeException {
		knowModePreventionMapper.updateByPrimaryKey(pojo);
	}

	@Override
	public KnowModePrevention findByPrimaryKey(String preventionId) {
		if(StringUtils.isNotBlank(preventionId)) {
			return knowModePreventionMapper.selectByPrimaryKey(preventionId);
		}
		return null;
	}

	@Override
	public List<KnowModePrevention> find(KnowModePrevention pojo) {
		String orderBy = "CreateTime Asc";
		PageHelper.orderBy(orderBy);
		
		List<KnowModePrevention> list = knowModePreventionMapper.select(pojo);
		return list;
	}

	@Override
	public PageInfo<KnowModePrevention> findByPage(KnowModePrevention pojoVo,
			int currentPage, int pageSize, String sortName, String sortOrder) {
		
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "CreateTime Asc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<KnowModePrevention> list = knowModePreventionMapper.select(pojoVo);
		PageInfo<KnowModePrevention> page = new PageInfo<KnowModePrevention>(list);
		
		return page;
	}

	@Override
	public void deleteByPrimaryKey(String id) throws RuntimeException {
		
	}

	@Override
	public void deleteByPrimaryKeys(String[] preventionIds) throws RuntimeException {
		if(preventionIds != null) {
			knowModePreventionMapper.deleteByPrimaryKeys(preventionIds);
		} else {
			throw new OperationException("删除缺陷预防失败,未指定删除的缺陷预防!");
		}
	}
}
