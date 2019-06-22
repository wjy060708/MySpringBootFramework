package com.jiangxinsoft.scorpio.knowledge.service;

import java.util.List;

import com.jiangxinsoft.scorpio.knowledge.model.KnowMode;
import com.jiangxinsoft.scorpio.service.IService;
import com.jiangxinsoft.scorpio.sys.model.SysFileResource;


public interface IKnowModeService extends IService<KnowMode>{

	public void saveModeTemplate(String modeId, SysFileResource fileResource);

	public List<KnowMode> findNeed(String parentId);
	
	public List<KnowMode> findByAuthor(String author);
	
	public List<KnowMode> findCurDate(KnowMode knowMode);

	public List<KnowMode> findPreDate(KnowMode knowMode);

	public void save1(KnowMode pojo);

	List<KnowMode> findNew5(KnowMode knowMode);

	List<KnowMode> findGreat5(KnowMode knowMode);
	
	List<KnowMode> findPrivateRank(KnowMode knowMode);

}