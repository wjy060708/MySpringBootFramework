package com.jiangxinsoft.scorpio.knowledge.test;

import javax.jms.Destination;

import org.apache.activemq.command.ActiveMQQueue;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.jiangxinsoft.scorpio.knowledge.service.impl.MessageProducerService;

@RunWith(SpringRunner.class)
@SpringBootTest()
public class ActiveMQTest{
	
	@Autowired
	private MessageProducerService producerService;
	
	@Test
	public void contextLoads() {
		Destination destination = new ActiveMQQueue("mytest.queue");
		
		for (int i = 0; i < 10; i++) {
			producerService.sendMessage(destination, "activeMQ发送的消息");
		}
	}
}
