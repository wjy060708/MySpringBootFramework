package com.jiangxinsoft.scorpio.epm.mapper;

import com.jiangxinsoft.scorpio.epm.model.EpmTaskInfo;
import com.jiangxinsoft.scorpio.mapper.IMapper;

public interface EpmTaskInfoMapper extends IMapper<EpmTaskInfo> {
	
	/**
	 * 查询子节点数量
	 * @param parentId
	 * @return
	 */
	public Integer countByParent(String parentId);

}