package com.jiangxinsoft.scorpio.sys.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.jiangxinsoft.scorpio.sys.model.SysFileResource;

public class FileResourceVo extends SysFileResource {

	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date startDate;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date finishDate;
	
	public FileResourceVo() {
		super();
	}
	
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
