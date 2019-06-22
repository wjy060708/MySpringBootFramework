package com.jiangxinsoft.scorpio.knowledge.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.knowledge.mapper.KnowModeGreatMapper;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModeGreat;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeGreatService;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.util.KeyGenerator;

@Service
public class KnowModeGreatService implements IKnowModeGreatService {
	
	@Autowired
	private KnowModeGreatMapper knowModeGreatMapper;

	@Override
	public void save(KnowModeGreat pojo) throws RuntimeException {
		pojo.setGreatId(KeyGenerator.getUUIDKey());
		knowModeGreatMapper.insert(pojo);
	}

	@Override
	public void update(KnowModeGreat pojo) throws RuntimeException {
		
	}

	@Override
	public KnowModeGreat findByPrimaryKey(String modeId) {
		if(StringUtils.isNotBlank(modeId)) {
			return knowModeGreatMapper.selectByPrimaryKey(modeId);
		}
		return null;
	}

	@Override
	public List<KnowModeGreat> find(KnowModeGreat pojo) {
		List<KnowModeGreat> list = knowModeGreatMapper.select(pojo);
		return list;
	}

	@Override
	public PageInfo<KnowModeGreat> findByPage(KnowModeGreat pojoVo,
			int currentPage, int pageSize, String sortName, String sortOrder) {
		return null;
	}

	@Override
	public void deleteByPrimaryKey(String greatId) throws RuntimeException {
		
		if(greatId != null) {
			knowModeGreatMapper.deleteByPrimaryKey(greatId);
		} else {
			throw new OperationException("删除点赞失败,未指定删除的点赞!");
		}
	}

	@Override
	public void deleteByPrimaryKeys(String[] greatIds) throws RuntimeException {
		if(greatIds != null) {
			knowModeGreatMapper.deleteByPrimaryKeys(greatIds);
		} else {
			throw new OperationException("删除点赞失败,未指定删除的点赞!");
		}
	}
}
