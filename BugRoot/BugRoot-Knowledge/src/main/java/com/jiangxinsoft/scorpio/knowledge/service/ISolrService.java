package com.jiangxinsoft.scorpio.knowledge.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;

import com.jiangxinsoft.scorpio.knowledge.model.KnowMode;

/**
 * solrService接口层
 * @author Administrator
 *
 */
public interface ISolrService {
	
	 public void add(String ModeId);
	 
     public void delete(String id);
      
     public void deleteAll();
     
     public Map<String, String> getById(String id);
     
     public List<KnowMode> knowledgeSearch(SolrQuery solrQuery) throws Exception;
     
     public void importKnowledgeIndex() throws SolrServerException, IOException;

}
