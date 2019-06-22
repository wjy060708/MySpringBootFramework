package com.jiangxinsoft.scorpio.sys.mapper;

import java.util.List;

import com.jiangxinsoft.scorpio.mapper.IMapper;
import com.jiangxinsoft.scorpio.sys.model.SysModule;

public interface SysModuleMapper extends IMapper<SysModule> {
	
	/**
	 * 根据用户查询授权模块列表
	 * @return
	 */
	public List<SysModule> selectByLoginUserId(String userId);

}