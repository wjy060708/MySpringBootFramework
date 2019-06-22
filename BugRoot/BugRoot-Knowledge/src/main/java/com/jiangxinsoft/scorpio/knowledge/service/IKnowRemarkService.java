package com.jiangxinsoft.scorpio.knowledge.service;



import java.util.List;

import com.jiangxinsoft.scorpio.knowledge.model.KnowRemark;
import com.jiangxinsoft.scorpio.service.IService;

public interface IKnowRemarkService extends IService<KnowRemark>{
	
	public List<KnowRemark> findAllByIds(KnowRemark pojoVo);
}
