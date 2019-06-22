package com.jiangxinsoft.scorpio.knowledge.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.knowledge.mapper.KnowModeReasonMapper;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModeReason;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeReasonService;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.util.KeyGenerator;


@Service
public class KnowModeReasonService implements IKnowModeReasonService{
	
	@Autowired
	private KnowModeReasonMapper knowModeReasonMapper;

	@Override
	public void save(KnowModeReason pojo) throws RuntimeException {
		pojo.setReasonId(KeyGenerator.getUUIDKey());
		
		knowModeReasonMapper.insert(pojo);
		
	}

	@Override
	public void update(KnowModeReason pojo) throws RuntimeException {
	
		knowModeReasonMapper.updateByPrimaryKey(pojo);
	}

	@Override
	public KnowModeReason findByPrimaryKey(String modeReasonId) {
		if(StringUtils.isNotBlank(modeReasonId)) {
			return knowModeReasonMapper.selectByPrimaryKey(modeReasonId);
		}
		return null;
	}

	@Override
	public List<KnowModeReason> find(KnowModeReason pojo) {
		List<KnowModeReason> list = knowModeReasonMapper.select(pojo);
		return list;
	}

	@Override
	public PageInfo<KnowModeReason> findByPage(KnowModeReason pojoVo,
			int currentPage, int pageSize, String sortName, String sortOrder) {
		
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "reasonContent Asc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<KnowModeReason> list = knowModeReasonMapper.select(pojoVo);
		PageInfo<KnowModeReason> page = new PageInfo<KnowModeReason>(list);
		
		return page;
	}

	@Override
	public void deleteByPrimaryKey(String id) throws RuntimeException {
		
	}

	@Override
	public void deleteByPrimaryKeys(String[] reasonIds) throws RuntimeException {
		if(reasonIds != null) {
			knowModeReasonMapper.deleteByPrimaryKeys(reasonIds);
		} else {
			throw new OperationException("删除缺陷原因失败,未指定删除的缺陷原因!");
		}
	}
}
