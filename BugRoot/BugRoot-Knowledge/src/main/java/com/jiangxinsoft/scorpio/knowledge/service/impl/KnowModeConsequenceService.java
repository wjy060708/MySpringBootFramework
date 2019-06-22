package com.jiangxinsoft.scorpio.knowledge.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.knowledge.mapper.KnowModeConsequenceMapper;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModeConsequence;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeConsequenceService;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.util.KeyGenerator;


@Service
public class KnowModeConsequenceService implements IKnowModeConsequenceService{
	
	@Autowired
	private KnowModeConsequenceMapper knowModeConsequenceMapper;

	@Override
	public void save(KnowModeConsequence pojo) throws RuntimeException {
		pojo.setConsequenceId(KeyGenerator.getUUIDKey());
		
		knowModeConsequenceMapper.insert(pojo);
		
	}

	@Override
	public void update(KnowModeConsequence pojo) throws RuntimeException {
		knowModeConsequenceMapper.updateByPrimaryKey(pojo);
	}

	@Override
	public KnowModeConsequence findByPrimaryKey(String modeConsequenceId) {
		if(StringUtils.isNotBlank(modeConsequenceId)) {
			return knowModeConsequenceMapper.selectByPrimaryKey(modeConsequenceId);
		}
		return null;
	}

	@Override
	public List<KnowModeConsequence> find(KnowModeConsequence pojo) {
		List<KnowModeConsequence> list = knowModeConsequenceMapper.select(pojo);
		return list;
	}

	@Override
	public PageInfo<KnowModeConsequence> findByPage(KnowModeConsequence pojoVo,
			int currentPage, int pageSize, String sortName, String sortOrder) {
		
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "CreateTime Asc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<KnowModeConsequence> list = knowModeConsequenceMapper.select(pojoVo);
		PageInfo<KnowModeConsequence> page = new PageInfo<KnowModeConsequence>(list);
		
		return page;
	}

	@Override
	public void deleteByPrimaryKey(String id) throws RuntimeException {
		
	}

	@Override
	public void deleteByPrimaryKeys(String[] consequenceIds) throws RuntimeException {
		if(consequenceIds != null) {
			knowModeConsequenceMapper.deleteByPrimaryKeys(consequenceIds);
		} else {
			throw new OperationException("删除缺陷后果失败,未指定删除的缺陷后果!");
		}
	}
}
