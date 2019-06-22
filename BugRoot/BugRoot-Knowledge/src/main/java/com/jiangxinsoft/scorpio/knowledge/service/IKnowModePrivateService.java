package com.jiangxinsoft.scorpio.knowledge.service;

import java.util.List;

import com.jiangxinsoft.scorpio.knowledge.model.KnowModePrivate;
import com.jiangxinsoft.scorpio.service.IService;

public interface IKnowModePrivateService extends IService<KnowModePrivate>{
	public List<KnowModePrivate> findByUser(String modeId);
}
