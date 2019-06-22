package com.jiangxinsoft.scorpio.knowledge.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiangxinsoft.scorpio.exception.OperationException;
import com.jiangxinsoft.scorpio.knowledge.mapper.KnowModeMapper;
import com.jiangxinsoft.scorpio.knowledge.model.KnowMode;
import com.jiangxinsoft.scorpio.knowledge.service.ISolrService;

/**
 * solrService实现类
 * 
 * @author Administrator
 */
@Service
public class SolrService implements ISolrService {

	@Autowired
	private SolrClient solrClient;

	@Autowired
	private KnowModeMapper knowModeMapper;

	/**
	 * 单个创建索引
	 * @throws IOException
	 * @throws SolrServerException
	 */
	@Override
	public void add(String modeId) {

		KnowMode knowMode = knowModeMapper.selectByPrimaryKey(modeId);
		SolrInputDocument document = new SolrInputDocument();

		document.addField("id", knowMode.getModeId());
		document.addField("modeName", knowMode.getModeName());
		document.addField("typeId", knowMode.getTypeId());
		document.addField("typeName", knowMode.getTypeName());
		document.addField("modeRemark", knowMode.getModeRemark());
		document.addField("createTime", knowMode.getCreateTime());
		document.addField("updateTime", knowMode.getUpdateTime());
		document.addField("modeAuthor", knowMode.getAuthor());
		document.addField("currentUser", knowMode.getCurrentUser());
		document.addField("imgeUrl", knowMode.getImgeUrl());
		document.addField("keyWords", knowMode.getKeyWords());
		
		document.addField("greateNum", knowMode.getGreatNum());
		document.addField("badNum", knowMode.getBadNum());
		document.addField("remarkNum", knowMode.getRemarkNum());
		document.addField("visitNum", knowMode.getVisitNum());
		document.addField("privateNum", knowMode.getPrivateNum());
		
		try {
			solrClient.add("collection1", document);
			solrClient.commit("collection1");
		} catch (SolrServerException | IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 批量导入
	 */
	@Override
	public void importKnowledgeIndex() throws SolrServerException, IOException {
		
	    KnowMode mode = new KnowMode(); 
		List<KnowMode> knowledgeList = knowModeMapper.select(mode);
		
		for (KnowMode knowMode : knowledgeList) {		
			SolrInputDocument document = new SolrInputDocument();
			
			document.addField("id", knowMode.getModeId());
			document.addField("modeName", knowMode.getModeName());
			document.addField("typeId", knowMode.getTypeId());
			document.addField("typeName", knowMode.getTypeName());
			document.addField("modeRemark", knowMode.getModeRemark());
			document.addField("createTime", knowMode.getCreateTime());
			document.addField("updateTime", knowMode.getUpdateTime());
			document.addField("modeAuthor", knowMode.getAuthor());
			document.addField("currentUser", knowMode.getCurrentUser());
			document.addField("imgeUrl", knowMode.getImgeUrl());
			document.addField("keyWords", knowMode.getKeyWords());
			
			document.addField("greateNum", knowMode.getGreatNum());
			document.addField("badNum", knowMode.getBadNum());
			document.addField("remarkNum", knowMode.getRemarkNum());
			document.addField("visitNum", knowMode.getVisitNum());
			document.addField("privateNum", knowMode.getPrivateNum());
			
			solrClient.add("collection1", document);
	
		}		
			solrClient.commit("collection1");		
		
	}

	@Override
	public void delete(String id) {
    
		if (id != null) {
			try {
				solrClient.deleteById("collection1", id);
				System.out.println("123456789");
				solrClient.commit("collection1");
			} catch (SolrServerException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			throw new OperationException("无此索引!");
		}
	}
    
	@Override
	public void deleteAll() {
		try {
			solrClient.deleteByQuery("collection1", "*:*");
			solrClient.commit("collection1");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Map<String, String> getById(String id) {
		SolrDocument document = null;
		try {
			document = solrClient.getById("collection1", id);
		} catch (SolrServerException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println(document);
		return null;
	}

	@Override
	public List<KnowMode> knowledgeSearch(SolrQuery solrQuery) throws Exception {
		QueryResponse query = solrClient.query(solrQuery);
		System.out.println("query="+query);
		SolrDocumentList results = query.getResults();
		
		List<KnowMode> knowledgeList = new ArrayList<>();
		for (SolrDocument document : results) {
			KnowMode knowMode = new KnowMode();
			String id = (String) document.get("id");
			Map<String, Map<String, List<String>>> highlighting = query.getHighlighting();
			String knowledgeName = "";
			if (highlighting != null && highlighting.size() > 0) {
				List<String> list = highlighting.get(document.get("id")).get("modeName");
				if (list != null) {
					knowledgeName = list.get(0);								
				} else {
					knowledgeName = (String) document.get("modeName");
				}	
			}
			
			knowMode.setModeId(id);
			knowMode.setModeName(knowledgeName);
			knowMode.setModeRemark((String) document.get("modeRemark"));
			knowMode.setAuthor((String) document.get("modeAuthor"));
			knowMode.setCreateTime((Date)document.get("createTime"));
			knowMode.setTypeName((String) document.get("typeName"));
			
			knowledgeList.add(knowMode);
			
		}
		return knowledgeList;
	}
}
