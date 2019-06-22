package com.jiangxinsoft.scorpio.service;

import java.util.List;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;


/**
 * 通用Mybatis接口
 * @author strawman
 *
 * @param <T>
 */
public interface IService<T> {

	/**
	 * 插入pojo
	 * @param pojo
	 */
	public void save(T pojo) throws RuntimeException;
	
	/**
	 * 根据id更新pojo
	 * @param pojo
	 */
	public void update(T pojo) throws RuntimeException;
	
	/**
	 * 根据Id查询pojo
	 * @param id
	 * @return
	 */
	public T findByPrimaryKey(String id);
	
	/**
	 * 按条件查询pojo：列表
	 * @param pojo
	 * @return
	 */
	public List<T> find(T pojo);
	
	/**
	 * 按照条件查询：分页
	 * @param pojoVo
	 * @param currentPage
	 * @param pageSize
	 * @param sortName
	 * @param sortOrder
	 * @return
	 */
	public PageInfo<T> findByPage(T pojoVo, int currentPage, int pageSize, String sortName, String sortOrder);
	
	/**
	 * 按照Id删除pojo
	 * @param id
	 */
	public void deleteByPrimaryKey(String id) throws RuntimeException;
	
	/**
	 * 按照id批量删除pojo
	 * @param ids
	 */
	public void deleteByPrimaryKeys(String[] ids) throws RuntimeException;
}
