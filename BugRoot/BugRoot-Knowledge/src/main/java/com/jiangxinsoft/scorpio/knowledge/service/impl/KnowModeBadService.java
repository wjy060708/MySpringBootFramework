package com.jiangxinsoft.scorpio.knowledge.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.knowledge.mapper.KnowModeBadMapper;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModeBad;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeBadService;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.util.KeyGenerator;

@Service
public class KnowModeBadService implements IKnowModeBadService {

	@Autowired
	private KnowModeBadMapper knowModeBadMapper;
	
	@Override
	public void save(KnowModeBad pojo) throws RuntimeException {
		pojo.setBadId(KeyGenerator.getUUIDKey());
		knowModeBadMapper.insert(pojo);
	}

	@Override
	public void update(KnowModeBad pojo) throws RuntimeException {
		
	}

	@Override
	public KnowModeBad findByPrimaryKey(String modeId) {
		if(StringUtils.isNotBlank(modeId)) {
			return knowModeBadMapper.selectByPrimaryKey(modeId);
		}
		return null;
	}

	@Override
	public List<KnowModeBad> find(KnowModeBad pojo) {
		List<KnowModeBad> list = knowModeBadMapper.select(pojo);
		return list;
	}

	@Override
	public PageInfo<KnowModeBad> findByPage(KnowModeBad pojoVo,
			int currentPage, int pageSize, String sortName, String sortOrder) {
		return null;
	}

	@Override
	public void deleteByPrimaryKey(String badId) throws RuntimeException {

		if(badId != null) {
			knowModeBadMapper.deleteByPrimaryKey(badId);
		} else {
			throw new OperationException("删除点赞失败,未指定删除的点赞!");
		}
	}

	@Override
	public void deleteByPrimaryKeys(String[] badIds) throws RuntimeException {
		if(badIds != null) {
			knowModeBadMapper.deleteByPrimaryKeys(badIds);
		} else {
			throw new OperationException("删除点赞失败,未指定删除的点赞!");
		}
	}
	
	
}
