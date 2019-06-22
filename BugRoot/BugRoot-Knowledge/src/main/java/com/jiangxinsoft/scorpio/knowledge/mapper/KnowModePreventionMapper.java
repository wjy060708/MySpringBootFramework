package com.jiangxinsoft.scorpio.knowledge.mapper;

import java.util.List;

import com.jiangxinsoft.scorpio.knowledge.model.KnowModePrevention;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModePrivate;
import com.jiangxinsoft.scorpio.mapper.IMapper;

public interface KnowModePreventionMapper extends IMapper<KnowModePrevention>{
	 public List<KnowModePrivate> selectByUser(String userId);
}
