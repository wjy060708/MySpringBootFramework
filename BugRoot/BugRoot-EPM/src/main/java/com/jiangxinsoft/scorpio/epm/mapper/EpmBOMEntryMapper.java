package com.jiangxinsoft.scorpio.epm.mapper;

import com.jiangxinsoft.scorpio.epm.model.EpmBOMEntry;
import com.jiangxinsoft.scorpio.mapper.IMapper;

public interface EpmBOMEntryMapper extends IMapper<EpmBOMEntry> {
	
	/**
	 * 查询子节点数量
	 * @param parentId
	 * @return
	 */
	public Integer countByParent(String parentId);
	
}
