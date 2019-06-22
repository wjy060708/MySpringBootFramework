package com.jiangxinsoft.scorpio.knowledge.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.knowledge.mapper.KnowModeContentMapper;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModeContent;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeContentService;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.util.KeyGenerator;


@Service
public class KnowModeContentService implements IKnowModeContentService{
	
	@Autowired
	private KnowModeContentMapper knowModeContentMapper;

	@Override
	public void save(KnowModeContent pojo) throws RuntimeException {
		pojo.setModeContentId(KeyGenerator.getUUIDKey());

		pojo.setCreateTime(new Date());
		pojo.setUpdateTime(new Date());
		
		knowModeContentMapper.insert(pojo);
		
	}

	@Override
	public void update(KnowModeContent pojo) throws RuntimeException {
		pojo.setUpdateTime(new Date());
		knowModeContentMapper.updateByPrimaryKey(pojo);
	}

	@Override
	public KnowModeContent findByPrimaryKey(String modeContentId) {
		if(StringUtils.isNotBlank(modeContentId)) {
			return knowModeContentMapper.selectByPrimaryKey(modeContentId);
		}
		return null;
	}

	@Override
	public List<KnowModeContent> find(KnowModeContent pojo) {
		String orderBy = "CreateTime Asc";
		PageHelper.orderBy(orderBy);
		
		List<KnowModeContent> list = knowModeContentMapper.select(pojo);
		return list;
	}

	@Override
	public PageInfo<KnowModeContent> findByPage(KnowModeContent pojoVo,
			int currentPage, int pageSize, String sortName, String sortOrder) {
		
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "CreateTime Asc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<KnowModeContent> list = knowModeContentMapper.select(pojoVo);
		PageInfo<KnowModeContent> page = new PageInfo<KnowModeContent>(list);
		
		return page;
	}

	@Override
	public void deleteByPrimaryKey(String id) throws RuntimeException {
		
	}

	@Override
	public void deleteByPrimaryKeys(String[] modeContentIds) throws RuntimeException {
		if(modeContentIds != null) {
			knowModeContentMapper.deleteByPrimaryKeys(modeContentIds);
		} else {
			throw new OperationException("删除模式知识失败,未指定删除的模式知识内容!");
		}
	}
}
