package com.jiangxinsoft.scorpio.knowledge.mapper;

import java.util.List;

import com.jiangxinsoft.scorpio.knowledge.model.KnowMode;
import com.jiangxinsoft.scorpio.mapper.IMapper;

public interface KnowModeMapper extends IMapper<KnowMode>{
   public List<KnowMode> selectByAuthor(String author);
   
   public List<KnowMode> selectByCurDate(KnowMode knowMode);

   public List<KnowMode> selectByPreDate(KnowMode knowMode);
   
   public List<KnowMode> selectByUser();

   public List<KnowMode> selectNeed(String parentId);
}
