package com.jiangxinsoft.scorpio.pagehelper;

import java.io.Serializable;
import java.util.List;

import com.github.pagehelper.Page;

public class PageSerializable<T> implements Serializable {
    private static final long serialVersionUID = 1L;
    //总记录数
    protected long    total;
    //结果集
    protected List<T> rows;

    public PageSerializable() {
    }

    @SuppressWarnings("rawtypes")
	public PageSerializable(List<T> list) {
        this.rows = list;
        if(list instanceof Page){
            this.total = ((Page)list).getTotal();
        } else {
            this.total = list.size();
        }
    }

    public static <T> PageSerializable<T> of(List<T> list){
        return new PageSerializable<T>(list);
    }
    
	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}
	
	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

	@Override
    public String toString() {
        return "PageSerializable{" +
                "total=" + total +
                ", rows=" + rows +
                '}';
    }
}
