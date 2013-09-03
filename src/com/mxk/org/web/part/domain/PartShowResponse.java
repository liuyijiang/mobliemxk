package com.mxk.org.web.part.domain;

import java.util.List;

import com.mxk.org.entity.PartEntity;

public class PartShowResponse {

	private List<PartEntity> list1;
	private long allPage;//总记录
	
	public List<PartEntity> getList1() {
		return list1;
	}
	public void setList1(List<PartEntity> list1) {
		this.list1 = list1;
	}
	public long getAllPage() {
		return allPage;
	}
	public void setAllPage(long allPage) {
		this.allPage = allPage;
	}
    	
	
}
