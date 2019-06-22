package com.jiangxinsoft.scorpio.knowledge.service.impl;

import javax.jms.Destination;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsMessagingTemplate;
import org.springframework.stereotype.Service;

import com.jiangxinsoft.scorpio.knowledge.service.IMessageProducerService;

/**
 * @author Administrator
 *
 */
@Service("producer")
public class MessageProducerService implements IMessageProducerService{
    
	@Autowired
	private JmsMessagingTemplate jmsMessagingTemplate;
   
	@Override
	public void sendMessage(Destination destination,String msg) {
        this.jmsMessagingTemplate.convertAndSend(destination ,msg);
	}

	@Override
	public void sendUpdateMessage(Destination destination, String msg) {
		this.jmsMessagingTemplate.convertAndSend(destination ,msg);
	}

	@Override
	public void sendDeleteMessage(Destination destination, String msg) {
		this.jmsMessagingTemplate.convertAndSend(destination ,msg);
	}

	@Override
	public void sendDeleteAllMessage(Destination destination, String[] msg) {
		this.jmsMessagingTemplate.convertAndSend(destination ,msg);
	}
}
