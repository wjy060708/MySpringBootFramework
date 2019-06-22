package com.jiangxinsoft.scorpio.sys.mapper;

import com.jiangxinsoft.scorpio.mapper.IMapper;
import com.jiangxinsoft.scorpio.sys.model.SysDictEntry;

public interface SysDictEntryMapper extends IMapper<SysDictEntry> {

	/**
	 * 更新数据字典条目状态
	 * @param dictEntry
	 */
	public void updateStateByPrimaryKey(SysDictEntry dictEntry);
	
	/**
	 * 根据编码查找数据字典条目
	 * @param entryCode
	 * @return
	 */
	public SysDictEntry selectByCode(String entryCode);
	
}
