package com.jiangxinsoft.scorpio.knowledge.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.stereotype.Component;

import com.jiangxinsoft.scorpio.knowledge.service.IMessageConsumerService;

@Component
public class MessageConsumerService implements IMessageConsumerService {
	@Autowired
	private SolrService solrService;
	
	@Override
	@JmsListener(destination="mode.add")
	public void receiveMessage(String text) {
		solrService.add(text);
	}

	@Override
	@JmsListener(destination="mode.update")
	public void receiveUpdateMessage(String text) {
		solrService.add(text);
	}

	@Override
	@JmsListener(destination="mode.delete")
	public void receiveDeleteMessage(String text) {
		
	}

	@Override
	@JmsListener(destination="mode.deleteAll")
	public void receiveDeleteAllMessage(String[] text) {
		for(int i = 0;i < text.length;i ++) {
			solrService.delete(text[i]);
		}
	}
}
