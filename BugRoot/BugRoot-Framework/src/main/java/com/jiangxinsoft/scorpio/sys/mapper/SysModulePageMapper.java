package com.jiangxinsoft.scorpio.sys.mapper;

import com.jiangxinsoft.scorpio.mapper.IMapper;
import com.jiangxinsoft.scorpio.sys.model.SysModulePage;

public interface SysModulePageMapper extends IMapper<SysModulePage> {
	
	/**
	 * 查询子节点数量
	 * @param parentId
	 * @return
	 */
	public Integer countByParent(String parentId);

}