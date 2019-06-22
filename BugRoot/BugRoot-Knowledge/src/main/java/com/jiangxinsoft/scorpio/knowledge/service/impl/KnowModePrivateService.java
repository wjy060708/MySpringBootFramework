package com.jiangxinsoft.scorpio.knowledge.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.knowledge.mapper.KnowModePrivateMapper;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModePrivate;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModePrivateService;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.util.KeyGenerator;

@Service
public class KnowModePrivateService implements IKnowModePrivateService {
	
	@Autowired
	private KnowModePrivateMapper knowModePrivateMapper;

	@Override
	public void save(KnowModePrivate pojo) throws RuntimeException {
		pojo.setPrivateId(KeyGenerator.getUUIDKey());
		pojo.setCreateTime(new Date());
		knowModePrivateMapper.insert(pojo);
	}

	@Override
	public void update(KnowModePrivate pojo) throws RuntimeException {
		knowModePrivateMapper.updateByPrimaryKey(pojo);
	}

	@Override
	public KnowModePrivate findByPrimaryKey(String privateId) {
		if(StringUtils.isNotBlank(privateId)) {
			return knowModePrivateMapper.selectByPrimaryKey(privateId);
		}
		return null;
	}

	@Override
	public List<KnowModePrivate> find(KnowModePrivate pojo) {
		List<KnowModePrivate> list = knowModePrivateMapper.select(pojo);
		return list;
	}

	@Override
	public PageInfo<KnowModePrivate> findByPage(KnowModePrivate pojoVo,
			int currentPage, int pageSize, String sortName, String sortOrder) {
		
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "CreateTime Asc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<KnowModePrivate> list = knowModePrivateMapper.selectByUserId(pojoVo.getUserId());
		PageInfo<KnowModePrivate> page = new PageInfo<KnowModePrivate>(list);
		
		return page;
	}

	@Override
	public void deleteByPrimaryKey(String privateId) throws RuntimeException {

		if(privateId != null) {
			knowModePrivateMapper.deleteByPrimaryKey(privateId);
		} else {
			throw new OperationException("删除收藏知识失败,未指定删除的收藏知识!");
		}
	}

	@Override
	public void deleteByPrimaryKeys(String[] privateIds) throws RuntimeException {
		if(privateIds != null) {
			knowModePrivateMapper.deleteByPrimaryKeys(privateIds);
		} else {
			throw new OperationException("删除缺陷后果失败,未指定删除的缺陷后果!");
		}
	}

	@Override
	public List<KnowModePrivate> findByUser(String userId) {
		if(StringUtils.isNotBlank(userId)) {
			return knowModePrivateMapper.selectByUserId(userId);
		}
		return null;
	}

	
}
