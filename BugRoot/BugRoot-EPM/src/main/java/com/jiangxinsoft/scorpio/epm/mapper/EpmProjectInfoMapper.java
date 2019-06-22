package com.jiangxinsoft.scorpio.epm.mapper;

import java.util.List;

import com.jiangxinsoft.scorpio.epm.vo.ProjectInfoVo;
import com.jiangxinsoft.scorpio.mapper.IMapper;

public interface EpmProjectInfoMapper extends IMapper<ProjectInfoVo> {
	
	public List<ProjectInfoVo> selectByStatus(ProjectInfoVo pojoVo);

}