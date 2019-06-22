package com.jiangxinsoft.scorpio.knowledge.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.knowledge.mapper.KnowModeMapper;
import com.jiangxinsoft.scorpio.knowledge.model.KnowMode;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeService;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.constants.SysConstants;
import com.jiangxinsoft.scorpio.sys.mapper.SysFileResourceMapper;
import com.jiangxinsoft.scorpio.sys.model.SysFileResource;
import com.jiangxinsoft.scorpio.util.KeyGenerator;

@Service
public class KnowModeService implements IKnowModeService{
	
	@Autowired
	private KnowModeMapper knowModeMapper;
	
	@Autowired
	private SysFileResourceMapper sysFileResourceMapper;

	@Override
	public void save(KnowMode pojo) throws RuntimeException {	

		if(pojo.getAuthor()==null) {
			pojo.setAuthor(pojo.getCurrentUser());
		}
		pojo.setIsEdit("0");
		pojo.setIsRead("1");
		
		pojo.setCreateTime(new Date());
		pojo.setUpdateTime(new Date());
	
		knowModeMapper.insert(pojo);
	}
	
	@Override
	public void save1(KnowMode pojo) throws RuntimeException {
		
		pojo.setModeId(KeyGenerator.getUUIDKey());

		if(pojo.getAuthor()==null) {
			pojo.setAuthor(pojo.getCurrentUser());
		}
		
		pojo.setCreateTime(new Date());
		pojo.setUpdateTime(new Date());
	
		knowModeMapper.insert(pojo);
	}
	
	@Transactional
	@Override
	public void saveModeTemplate(String modeId, SysFileResource fileResource) {
		String resourceId = KeyGenerator.getUUIDKey();
		fileResource.setFileId(resourceId);
		fileResource.setFileStatus(SysConstants.FILE_STATUS_NOT_ENABLED);
		fileResource.setCreateTime(new Date());
		
		// 1.保存文件资源
		sysFileResourceMapper.insert(fileResource);
		
		KnowMode knowMode= new KnowMode();
		knowMode.setModeId(modeId);

		// 2.保存文档对象
		knowMode.setResourceId(fileResource.getFileId());
		
		knowModeMapper.updateByPrimaryKey(knowMode);
	}

	@Override
	public void update(KnowMode pojo) throws RuntimeException {
		pojo.setUpdateTime(new Date());
		knowModeMapper.updateByPrimaryKey(pojo);
	}

	@Override
	public KnowMode findByPrimaryKey(String modeId) {
		
		if(StringUtils.isNotBlank(modeId)) {
			return knowModeMapper.selectByPrimaryKey(modeId);
		}
		return null;
	}

	@Override
	public List<KnowMode> find(KnowMode pojo) {	
		List<KnowMode> list = knowModeMapper.select(pojo);
		
		return list;
	}

	@Override
	public PageInfo<KnowMode> findByPage(KnowMode pojoVo, int currentPage,
			int pageSize, String sortName, String sortOrder) {
		
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "CreateTime Asc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<KnowMode> list = knowModeMapper.select(pojoVo);
			
		PageInfo<KnowMode> page = new PageInfo<KnowMode>(list);
		
		return page;
	}

	@Override
	public void deleteByPrimaryKey(String id) throws RuntimeException {
		
	}

	@Override
	public void deleteByPrimaryKeys(String[] modeIds) throws RuntimeException {
		
		if(modeIds != null) {
			knowModeMapper.deleteByPrimaryKeys(modeIds);
		} else {
			throw new OperationException("删除知识模式失败,未指定删除的知识模式!");
		}
	}

	@Override
	public List<KnowMode> findNeed(String parentId) {
		String orderBy = "CreateTime Desc";
		PageHelper.orderBy(orderBy);
		
		List<KnowMode> list = knowModeMapper.selectNeed(parentId);
		return list;
	}

	@Override
	public List<KnowMode> findByAuthor(String author) {
		String orderBy = "CreateTime Desc";
		PageHelper.orderBy(orderBy);
		
		List<KnowMode> list = knowModeMapper.selectByAuthor(author);
		return list;
	}

	@Override
	public List<KnowMode> findCurDate(KnowMode knowMode) {
		List<KnowMode> list = knowModeMapper.selectByCurDate(knowMode);
		
		return list;
	}

	@Override
	public List<KnowMode> findPreDate(KnowMode knowMode) {
		List<KnowMode> list = knowModeMapper.selectByPreDate(knowMode);
		
		return list;
	}

	@Override
	public List<KnowMode> findGreat5(KnowMode knowMode) {
		String orderBy = "GreatNum Desc";
		PageHelper.orderBy(orderBy);
		PageHelper.offsetPage(0, 5);
		
		List<KnowMode> list = knowModeMapper.select(knowMode);
		return list;
	}
	
	@Override
	public List<KnowMode> findNew5(KnowMode knowMode) {
		String orderBy = "CreateTime Desc";
		PageHelper.orderBy(orderBy);
		PageHelper.offsetPage(0, 5);
		
		List<KnowMode> list = knowModeMapper.select(knowMode);
		return list;
	}

	@Override
	public List<KnowMode> findPrivateRank(KnowMode knowMode) {
		String orderBy = "PrivateNum Desc";
		PageHelper.orderBy(orderBy);
		PageHelper.offsetPage(0, 10);
		
		List<KnowMode> list = knowModeMapper.select(knowMode);
		return list;
	}
}