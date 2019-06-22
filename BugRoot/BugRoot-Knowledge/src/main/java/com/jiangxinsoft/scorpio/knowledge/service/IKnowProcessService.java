package com.jiangxinsoft.scorpio.knowledge.service;

import java.util.List;

import com.jiangxinsoft.scorpio.knowledge.model.KnowProcess;
import com.jiangxinsoft.scorpio.service.IService;

/**
 * 
 * @author J01052304
 *
 */
public interface IKnowProcessService extends IService<KnowProcess>{
	
	/**
	 * 查询所有项目群中项目列表
	 * @return
	 */
	public List<KnowProcess> getProcess(KnowProcess pojoVo);
	
}
