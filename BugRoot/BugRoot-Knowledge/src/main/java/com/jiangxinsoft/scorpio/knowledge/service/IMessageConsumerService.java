package com.jiangxinsoft.scorpio.knowledge.service;

/**
 * activeMQ消费者接口
 * @author Administrator
 *
 */
public interface IMessageConsumerService {
	
	/**
	 *接收增加的信息
	 * @param text
	 */
	public void receiveMessage(String text);
	
	/**
	 * 接收更新的信息
	 * @param text
	 */
	public void receiveUpdateMessage(String text);
	
	/**
	 * 接收删除的信息
	 * @param text
	 */
	public void receiveDeleteMessage(String text);
	
	/**
	 * 接收删除所有的信息
	 * @param text
	 */
	public void receiveDeleteAllMessage(String[] text);


}
