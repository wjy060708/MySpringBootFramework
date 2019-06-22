package com.jiangxinsoft.scorpio.knowledge.service;

import java.util.List;

import com.jiangxinsoft.scorpio.knowledge.model.KnowType;
import com.jiangxinsoft.scorpio.service.IService;

/**
 * 
 * @author J01052304
 *
 */
public interface IKnowTypeService extends IService<KnowType>{
	
	/**
	 * @param pojoVo
	 * @return
	 */
	public List<KnowType> getType(KnowType pojoVo);
	
	/**
	 * 根据name查询typeId
	 * @param typeName
	 * @return
	 */
	public String getTypeId(String typeName);
	
	public List<KnowType> findByPrarentKey(String parentId);
	
	public List<KnowType> findFirstType(KnowType knowType);

}
