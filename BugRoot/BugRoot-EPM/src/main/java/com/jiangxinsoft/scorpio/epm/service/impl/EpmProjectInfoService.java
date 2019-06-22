package com.jiangxinsoft.scorpio.epm.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import com.jiangxinsoft.scorpio.epm.mapper.EpmProjectInfoMapper;
import com.jiangxinsoft.scorpio.epm.service.IEpmProjectInfoService;
import com.jiangxinsoft.scorpio.epm.vo.ProjectInfoVo;
import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.constants.SysConstants;
import com.jiangxinsoft.scorpio.util.KeyGenerator;

@Service
public class EpmProjectInfoService implements IEpmProjectInfoService {
	
	@Autowired
	private EpmProjectInfoMapper epmProjectInfoMapper;

	@Override
	public void save(ProjectInfoVo pojo) throws RuntimeException {
		pojo.setProjectId(KeyGenerator.getUUIDKey());
		pojo.setProjectStatus(SysConstants.ASSESS_PROJECT_DRAFT);
			
		epmProjectInfoMapper.insert(pojo);	
		
	}

	@Override
	public void update(ProjectInfoVo pojo) throws RuntimeException {
		String projectId = pojo.getProjectId();
		
		ProjectInfoVo projectInfoVo = epmProjectInfoMapper.selectByPrimaryKey(projectId);
		String projectStatus = projectInfoVo.getProjectStatus();
		
		if(projectStatus.equals(SysConstants.ASSESS_PROJECT_DRAFT)) {
			pojo.setProjectStatus(projectStatus);
			
			epmProjectInfoMapper.updateByPrimaryKey(pojo);
		} else if(projectStatus.equals(SysConstants.ASSESS_PROJECT_PUBLISHED)) {
			throw new OperationException("项目发布状态下无法编辑!");
		} else if(projectStatus.equals(SysConstants.ASSESS_PROJECT_STOP)) {
			throw new OperationException("项目挂起状态下无法编辑!");
		} else if(projectStatus.equals(SysConstants.ASSESS_PROJECT_FINISH)) {
			throw new OperationException("项目已完成状态下无法编辑!");
		}else {
			throw new OperationException("项目状态异常，无法进行编辑!");
		}
		
	}

	@Override
	public ProjectInfoVo findByPrimaryKey(String projectId) {
		if(StringUtils.isNotBlank(projectId)) {
			return epmProjectInfoMapper.selectByPrimaryKey(projectId);
		}
		
		return null;
	}

	@Override
	public List<ProjectInfoVo> find(ProjectInfoVo pojo) {
		String orderBy = "ProjectOrder Asc";
		PageHelper.orderBy(orderBy);
		
		List<ProjectInfoVo> list = epmProjectInfoMapper.select(pojo);
		return list;
	}

	@Override
	public PageInfo<ProjectInfoVo> findByPage(ProjectInfoVo pojoVo,
			int currentPage, int pageSize, String sortName, String sortOrder) {
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "ProjectOrder Asc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<ProjectInfoVo> list = epmProjectInfoMapper.select(pojoVo);
		PageInfo<ProjectInfoVo> page = new PageInfo<ProjectInfoVo>(list);
		
		return page;
	}

	@Override
	public void deleteByPrimaryKey(String id) throws RuntimeException {
		
	}

	@Override
	public void deleteByPrimaryKeys(String[] projectIds) throws RuntimeException {
		if(projectIds != null) {
			epmProjectInfoMapper.deleteByPrimaryKeys(projectIds);
		} else {
			throw new OperationException("删除项目失败,未指定删除的项目!");
		}
		
	}

	@Override
	public void updateProjectPublishStatus(String projectId)
			throws OperationException {
		if(StringUtils.isNotEmpty(projectId)) {
			ProjectInfoVo projectInfoVo = epmProjectInfoMapper.selectByPrimaryKey(projectId);
			
			String projectStatus = projectInfoVo.getProjectStatus();
			if(projectStatus.equals(SysConstants.ASSESS_PROJECT_DRAFT)) {
				projectInfoVo.setProjectStatus(SysConstants.ASSESS_PROJECT_PUBLISHED);
				
				epmProjectInfoMapper.updateByPrimaryKey(projectInfoVo);
			} else if(projectStatus.equals(SysConstants.ASSESS_PROJECT_PUBLISHED)){
				throw new OperationException("项目已经发布!");
			} else if(projectStatus.equals(SysConstants.ASSESS_PROJECT_STOP)) {
				projectInfoVo.setProjectStatus(SysConstants.ASSESS_PROJECT_PUBLISHED);
				
				epmProjectInfoMapper.updateByPrimaryKey(projectInfoVo);
			} else if(projectStatus.equals(SysConstants.ASSESS_PROJECT_FINISH)){
				throw new OperationException("项目已经完成!无法再次发布");
			} else {
				throw new OperationException("项目状态异常!无法进行发布");
			}
		} else {
			throw new OperationException("项目发布失败!");
		}
		
	}

	@Override
	public void updateProjectStopStatus(String projectId)
			throws OperationException {
		if(StringUtils.isNotEmpty(projectId)) {
			ProjectInfoVo projectInfoVo = epmProjectInfoMapper.selectByPrimaryKey(projectId);
			
			String projectStatus = projectInfoVo.getProjectStatus();
			if(projectStatus.equals(SysConstants.ASSESS_PROJECT_DRAFT)) {
				throw new OperationException("项目无法挂起，因为项目还未发布!");		
			} else if(projectStatus.equals(SysConstants.ASSESS_PROJECT_PUBLISHED)){
				projectInfoVo.setProjectStatus(SysConstants.ASSESS_PROJECT_STOP);
				
				epmProjectInfoMapper.updateByPrimaryKey(projectInfoVo);
			} else if(projectStatus.equals(SysConstants.ASSESS_PROJECT_STOP)) {
				throw new OperationException("项目已经挂起!");				
			} else if(projectStatus.equals(SysConstants.ASSESS_PROJECT_FINISH)) {
			    throw new OperationException("项目已经完成，无法挂起!");				
			} else {
				throw new OperationException("项目状态异常，无法挂起!");	
			}
		} else {
			throw new OperationException("项目挂起失败!");
		}
		
	}
	
	@Override
	public void updateProjectFinishStatus(String projectId)
			throws OperationException {
		if(StringUtils.isNotEmpty(projectId)) {
			
			ProjectInfoVo projectInfoVo = epmProjectInfoMapper.selectByPrimaryKey(projectId);
			projectInfoVo.setProjectStatus(SysConstants.ASSESS_PROJECT_FINISH);
				
			epmProjectInfoMapper.updateByPrimaryKey(projectInfoVo);
		}
	}

	@Override
	public PageInfo<ProjectInfoVo> findPublishProject(ProjectInfoVo pojoVo,
			int currentPage, int pageSize, String sortName, String sortOrder)
			throws OperationException {
		if(StringUtils.isNotBlank(sortName) && StringUtils.isNotBlank(sortOrder)) {
			String orderBy = sortName +  " " + sortOrder;
			PageHelper.startPage(currentPage, pageSize, orderBy);
		} else {
			String orderBy = "ProjectOrder Asc";
			PageHelper.startPage(currentPage, pageSize, orderBy);
		}
		
		List<ProjectInfoVo> list = epmProjectInfoMapper.selectByStatus(pojoVo);
		PageInfo<ProjectInfoVo> page = new PageInfo<ProjectInfoVo>(list);
		
		return page;
	}

}
