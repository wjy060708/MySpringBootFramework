package com.jiangxinsoft.scorpio.sys.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jiangxinsoft.scorpio.sys.model.SysPositionMember;
import com.jiangxinsoft.scorpio.sys.vo.PositionMemberVo;

public interface SysPositionMemberMapper {
	
	/**
	 * 插入岗位成员
	 * @param positionMember
	 */
	public void insert(SysPositionMember positionMember);
	
	/**
	 * 删除岗位成员
	 * @param userId
	 */
	public void deleteByUserId(String userId);
	
	/**
	 * 删除岗位成员
	 * @param positionId
	 * @param userId
	 */
	public void deleteByPositionAndUserId(@Param("positionId") String positionId, @Param("userId") String userId);
	
	/**
	 * 查询岗位成员列表
	 * @param positionMemberVo
	 * @return
	 */
	public List<SysPositionMember> select(PositionMemberVo positionMemberVo);

}