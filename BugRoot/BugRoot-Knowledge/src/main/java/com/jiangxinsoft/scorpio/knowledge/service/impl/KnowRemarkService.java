package com.jiangxinsoft.scorpio.knowledge.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.knowledge.mapper.KnowRemarkMapper;
import com.jiangxinsoft.scorpio.knowledge.model.KnowRemark;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowRemarkService;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.util.KeyGenerator;

@Service
public class KnowRemarkService implements IKnowRemarkService{
	
	@Autowired
	private KnowRemarkMapper knowRemarkMapper;

	@Override
	public void save(KnowRemark pojo) throws RuntimeException {
		 pojo.setRemarkId(KeyGenerator.getUUIDKey());
		 pojo.setRemarkTime(new Date());
		 
		 knowRemarkMapper.insert(pojo);
	}

	@Override
	public void update(KnowRemark pojo) throws RuntimeException {
		knowRemarkMapper.updateByPrimaryKey(pojo);
	}

	@Override
	public KnowRemark findByPrimaryKey(String remarkId) {
		if(StringUtils.isNotBlank(remarkId)) {
			return knowRemarkMapper.selectByPrimaryKey(remarkId);
		}
		return null;
	}
	
	@Override
	public PageInfo<KnowRemark> findByPage(KnowRemark pojoVo, int currentPage,
			int pageSize, String sortName, String sortOrder) {
		
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "CreateTime Asc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		List<KnowRemark> list = knowRemarkMapper.select(pojoVo);
		PageInfo<KnowRemark> page = new PageInfo<KnowRemark>(list);
		
		return page;
	}

	@Override
	public void deleteByPrimaryKey(String id) throws RuntimeException {
		
	}

	@Override
	public void deleteByPrimaryKeys(String[] remarkIds) throws RuntimeException {
		if(remarkIds != null) {
			knowRemarkMapper.deleteByPrimaryKeys(remarkIds);
		} else {
			throw new OperationException("删除模式知识失败,未指定删除的模式知识内容!");
		}
	}
	
	@Override
	public List<KnowRemark> findAllByIds(KnowRemark pojoVo) {
		String orderBy = "RemarkTime Desc";
		PageHelper.orderBy(orderBy);
		return knowRemarkMapper.select(pojoVo);
	}

	@Override
	public List<KnowRemark> find(KnowRemark pojo) {
		String orderBy = "RemarkTime Desc";
		PageHelper.orderBy(orderBy);
		List<KnowRemark> list = knowRemarkMapper.select(pojo);
		return list;
	}
}
