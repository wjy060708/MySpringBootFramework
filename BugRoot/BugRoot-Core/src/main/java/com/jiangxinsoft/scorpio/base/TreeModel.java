package com.jiangxinsoft.scorpio.base;

/**
 * 用于同一所有树节点的操作接口
 * @author taojinlong
 *
 */
public interface TreeModel {
	
	/**
	 * 树节点ID
	 * @return
	 */
	public String getId();

	/**
	 * 树节点的父节点
	 * @return
	 */
	public String getParentId();
	
	/**
	 * 树节点的文本
	 * @return
	 */
	public String getText();
	
	/**
	 * 树节点图标
	 * @return
	 */
	public String getIconCls();
}
