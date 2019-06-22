package com.jiangxinsoft.scorpio.knowledge.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.knowledge.model.KnowMode;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModeBad;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModeGreat;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeBadService;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeGreatService;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeService;

@RequestMapping("/knowledge/mode")
@Controller
public class KnowModeGreatController {
	
	@Autowired
	private IKnowModeGreatService knowModeGreatService;
	
	@Autowired
	private IKnowModeBadService knowModeBadService;
	
	@Autowired
	private IKnowModeService knowModeService;
	
	
	@RequestMapping("/great")
	public RestResponse pageGreat(KnowModeGreat knowModeGreat) {

		//查询是否有该用户对该文章的点赞记录
        List<KnowModeGreat> list = knowModeGreatService.find(knowModeGreat);
        if (list!=null && list.size()>0){
        	//如果找到了这条记录，则删除该记录，同时文章的点咱点赞数减去1
        	KnowModeGreat knowModeGreat2 = list.get(0);
        	knowModeGreatService.deleteByPrimaryKey(knowModeGreat2.getGreatId());
        	//知识的点赞数减去1
        	KnowMode knowMode1  = knowModeService.findByPrimaryKey(knowModeGreat.getModeId());
        	System.out.println(knowMode1.getGreatNum());
        	
        	knowMode1.setGreatNum(knowMode1.getGreatNum()-1);
        	
        	knowModeService.update(knowMode1);
        	
        	RestResponse.success("取消点赞!");
        	
        } else {
        	//如果没有找到这条记录，则增加这条记录 同时文章的点赞数加1
        	knowModeGreatService.save(knowModeGreat);
        	//知识的点咱数加1
        	KnowMode knowMode2 = knowModeService.findByPrimaryKey(knowModeGreat.getModeId());
        	
        	knowMode2.setGreatNum(knowMode2.getGreatNum() + 1);
       
        
        	knowModeService.update(knowMode2);
        	return RestResponse.success("点赞成功!");
        }
		return null;
	}
	
	
	@RequestMapping("/bad")
	public RestResponse pageBad(KnowModeBad knowModeBad) {
		//查询是否有该用户对该文章的点赞记录
        List<KnowModeBad> list = knowModeBadService.find(knowModeBad);
        if (list!=null && list.size()>0){
        	return RestResponse.success("已给予差评!");
        	
        } else {
        	//如果没有找到这条记录，则增加这条记录 同时文章的点赞数加1
        	knowModeBadService.save(knowModeBad);
        	//知识的点咱数加1
        	KnowMode knowMode2 = knowModeService.findByPrimaryKey(knowModeBad.getModeId());
        	knowMode2.setGreatNum(knowMode2.getBadNum() + 1);
        	knowModeService.update(knowMode2);
        	return RestResponse.success("给予差评!");
        }
	}
}
