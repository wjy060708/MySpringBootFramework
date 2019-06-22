package com.jiangxinsoft.scorpio.knowledge.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.knowledge.model.KnowMode;
import com.jiangxinsoft.scorpio.knowledge.model.KnowModePrivate;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModePrivateService;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeService;

@RequestMapping("/knowledge/mode")
@Controller
public class KnowledgePrivateController {
	
	@Autowired
	private IKnowModeService knowModeService;

	@Autowired
	private IKnowModePrivateService knowModePrivateService;

	@RequestMapping("/private")
	public RestResponse privatePage(KnowModePrivate pojo) {
	   List<KnowModePrivate> list = knowModePrivateService.find(pojo);
        
	   if (list!=null && list.size()>0){
		   
        	RestResponse.success("已收藏!");
        	
        } else {
        	knowModePrivateService.save(pojo);
        	//知识的点咱数加1
        	KnowMode knowMode2 = knowModeService.findByPrimaryKey(pojo.getModeId());
        	knowMode2.setPrivateNum(knowMode2.getPrivateNum() + 1);
        	knowModeService.update(knowMode2);
        	return RestResponse.success("收藏成功!");
        }
	   return null;
	}
   
	@ResponseBody
	@RequestMapping("/private/delete")
	public RestResponse privateDelete(String privateId) {
		
		knowModePrivateService.deleteByPrimaryKey(privateId);
		return RestResponse.success("已删除该收藏!");
	}
	
	
	
}
