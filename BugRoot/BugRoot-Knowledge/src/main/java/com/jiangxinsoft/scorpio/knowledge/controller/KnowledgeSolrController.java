package com.jiangxinsoft.scorpio.knowledge.controller;

import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;

import org.apache.solr.common.SolrDocument;

import org.apache.solr.common.SolrInputDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.jiangxinsoft.scorpio.knowledge.model.KnowMode;
import com.jiangxinsoft.scorpio.knowledge.model.KnowType;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeService;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowTypeService;
import com.jiangxinsoft.scorpio.knowledge.service.ISolrService;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/knowledge/solr")
public class KnowledgeSolrController {

    @Autowired
    private SolrClient client;
    
    @Autowired
    private ISolrService solrService;
    
    @Autowired
    private IKnowModeService knowModeService;
    
    @Autowired
    private IKnowTypeService knowTypeService;

    /**
     * 新增/修改 索引
     * 当 id 存在的时候, 此方法是修改(当然, 我这里用的 uuid, 不会存在的), 如果 id 不存在, 则是新增
     * @return
     */
    @RequestMapping("/add")
    public String add() {
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        try {
            SolrInputDocument doc = new SolrInputDocument();
            doc.setField("id", uuid);
            doc.setField("content_ik", "我是中国人, 我爱中国");

            /* 如果spring.data.solr.host 里面配置到 core了, 那么这里就不需要传 collection1 这个参数
             * 下面都是一样的
             */
            client.add("collection1", doc);
            //client.commit();
            client.commit("collection1");
            return uuid;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "error";
    }
    
    /**
     * 新增/修改 索引
     * @return
     * @throws IOException 
     * @throws SolrServerException 
     */
    @RequestMapping("/import")
    public String addKnowledge() throws SolrServerException, IOException {
    	solrService.importKnowledgeIndex();
    	
		return "知识导入成功";
    }
    
    
    /**
     * 根据id删除索引
     * @param id
     * @return
     */
    @RequestMapping("delete")
    public String delete(String id)  {
        try {
            client.deleteById("collection1",id);
            client.commit("collection1");

            return id;
        } catch (Exception e) {
            e.printStackTrace();
        }


        return "error";
    }

    /**
     * 删除所有的索引
     * @return
     */
    @RequestMapping("deleteAll")
    public String deleteAll(){
        try {

            client.deleteByQuery("collection1","*:*");
            client.commit("collection1");

            return "success";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "error";
    }

    /**
     * 根据id查询索引
     * @return
     * @throws Exception
     */
    @RequestMapping("getById")
    public String getById() throws Exception {
        SolrDocument document = client.getById("collection1", "536563");
        System.out.println(document);
        return document.toString();
    }

    /**
     * 综合查询: 在综合查询中, 有按条件查询, 条件过滤, 排序, 分页, 高亮显示, 获取部分域信息
     * @return
     */
    @RequestMapping("/search")
    public ModelAndView knowSearch(String keyWord,Model model,KnowMode knowMode,
    	KnowType knowType) throws Exception {
    	ModelAndView modelAndView = new ModelAndView();
    	SolrQuery query = new SolrQuery();
    	
    	List<KnowMode> listPrivateRankModes = knowModeService.findPrivateRank(knowMode);
    	List<KnowType> listFirstTypes = knowTypeService.findFirstType(knowType);

		query.set("df", "modeName_modeRemark");
		
		if (keyWord != null && !"".equals(keyWord)) {			
			query.setQuery(keyWord);	
		} else {
			query.setQuery("*:*");
		}
		
		query.setHighlight(true);
		query.addHighlightField("modeName");
		query.addHighlightField("modeRemark");
		
		query.setHighlightSimplePre("<em style=\"color:red\">");
		query.setHighlightSimplePost("</em>");
		
		List<KnowMode> knowledgeList = solrService.knowledgeSearch(query);
		
		int count = knowledgeList.size();
		
		modelAndView.addObject("count", count);
		modelAndView.addObject("results", knowledgeList);	
		modelAndView.addObject("listFirstTypes", listFirstTypes);
		modelAndView.addObject("listPrivateRankModes", listPrivateRankModes);
		modelAndView.addObject("queryString", keyWord);
		
		modelAndView.setViewName("knowledge/box/searchDetails");
		
		return modelAndView;
    	
    }
    
    @RequestMapping("/advancedSearch")
    public ModelAndView advancedSearch(String keyWord,String author,String modeName,
    		String modeRemark,String typeName,String fullText,String keyWords,
    		Model model) throws Exception {
 
    	ModelAndView modelAndView = new ModelAndView();
    	SolrQuery query = new SolrQuery();
    	
		if (keyWord != null && !"".equals(keyWord)) {			
			
			query.setQuery("*:*");
			if(author != null && !"".equals(author)) {
				query.setFilterQueries("modeAuthor" + ":" + author);
			}
			
			if(modeName != null && !"".equals(modeName)) {
				query.setFilterQueries("modeName" + ":" + keyWord);
			}
			
			if(modeRemark != null && !"".equals(modeRemark)) {
				query.setFilterQueries("modeRemark" + ":" + keyWord);
			}
			
			if(typeName != null && !"".equals(typeName)) {
				query.setFilterQueries("typeName" + ":" + keyWord);
			}
			
			if(keyWords != null && !"".equals(keyWords)) {
				query.setFilterQueries("keyWords" + ":" + keyWord);
			}
			
			if(fullText != null && !"".equals(fullText)) {
				query.setQuery(keyWord);
			}
			
		} else {
			query.setQuery("*:*");
			if(author != null && !"".equals(author)) {
				query.setFilterQueries("modeAuthor" + ":" + author);
			}
			query.addHighlightField("modeAuthor");
		}
		
		query.setHighlight(true);
		query.addHighlightField("modeName");
		query.addHighlightField("modeRemark");
		
		query.setHighlightSimplePre("<em style=\"color:red\">");
		query.setHighlightSimplePost("</em>");
		
		List<KnowMode> knowledgeList = solrService.knowledgeSearch(query);
		
		int count = knowledgeList.size();
		
		modelAndView.addObject("count", count);
		modelAndView.addObject("results", knowledgeList);	
		modelAndView.addObject("queryString", keyWord);
		modelAndView.addObject("queryAuthor", author);
		
		modelAndView.setViewName("knowledge/box/advancedSearch");
		
		return modelAndView;
    	
    }

}