package com.jiangxinsoft.scorpio.knowledge.service;

import javax.jms.Destination;

/**
 * 消息发送接口
 * @author Administrator
 *
 */
public interface IMessageProducerService {

  /**
   * 增加知识消息
   * @param destination
   * @param msg
   */
  public void sendMessage(Destination destination, String msg);
  
  /**
   * 更新知识消息
   * @param destination
   * @param msg
   */
  public void sendUpdateMessage(Destination destination, String msg);
  
  /**删除知识消息
   * @param destination
   * @param msg
   */
  public void sendDeleteMessage(Destination destination, String msg);
  
  /**
   * 删除全部知识消息
   * @param destination
   * @param msg
   */
  public void sendDeleteAllMessage(Destination destination, String[] msg);

  
}
