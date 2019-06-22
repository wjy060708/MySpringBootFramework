package com.jiangxinsoft.scorpio.sys.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.jiangxinsoft.scorpio.sys.model.SysLog;

public class LogVo extends SysLog {

	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date startDate;
	
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date finishDate;

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}
	
}
