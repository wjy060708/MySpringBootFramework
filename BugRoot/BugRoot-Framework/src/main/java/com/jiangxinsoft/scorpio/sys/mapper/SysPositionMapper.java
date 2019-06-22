package com.jiangxinsoft.scorpio.sys.mapper;

import java.util.List;

import com.jiangxinsoft.scorpio.mapper.IMapper;
import com.jiangxinsoft.scorpio.sys.model.SysPosition;

public interface SysPositionMapper extends IMapper<SysPosition> {

	/**
	 * 查询用户系统岗位
	 * @param userId
	 * @return
	 */
	public List<SysPosition> selectByUserId(String userId);
}