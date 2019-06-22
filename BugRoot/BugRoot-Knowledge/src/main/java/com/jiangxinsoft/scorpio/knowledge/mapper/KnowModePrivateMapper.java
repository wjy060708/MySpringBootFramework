package com.jiangxinsoft.scorpio.knowledge.mapper;

import java.util.List;

import com.jiangxinsoft.scorpio.knowledge.model.KnowModePrivate;
import com.jiangxinsoft.scorpio.mapper.IMapper;

public interface KnowModePrivateMapper extends IMapper<KnowModePrivate>{
   
	public List<KnowModePrivate> selectByUserId(String userId);
}
