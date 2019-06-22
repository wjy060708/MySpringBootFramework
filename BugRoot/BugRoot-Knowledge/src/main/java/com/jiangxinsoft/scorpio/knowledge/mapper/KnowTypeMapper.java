package com.jiangxinsoft.scorpio.knowledge.mapper;

import java.util.List;

import com.jiangxinsoft.scorpio.knowledge.model.KnowType;
import com.jiangxinsoft.scorpio.mapper.IMapper;

public interface KnowTypeMapper extends IMapper<KnowType>{
	
	/**
	 * 查询子节点数量
	 * @param parentId
	 * @return
	 */
	public Integer countByParent(String typeId);
	
	/**
	 * 根据name查询id
	 * @param typeName
	 * @return
	 */
	public String selectByName(String typeName);
	
	public List<KnowType> selectByPrarentKey(String parentId);
	
	public List<KnowType> selectFirstType(KnowType knowType);
	
}
