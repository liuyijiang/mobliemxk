package com.mxk.org.web.visitor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mxk.org.entity.PartEntity;
import com.mxk.org.web.part.dao.MxkPartDao;
import com.mxk.org.web.part.domain.PartShowResponse;
import com.mxk.org.web.part.domain.SearchPartRequest;

@Service
public class MxkVisitorSerivce {

	@Autowired
	private MxkPartDao partDao;
	
	public PartShowResponse findParts(SearchPartRequest request){
		List<PartEntity> list = partDao.findPartEntityByPage(request);
		PartShowResponse partShowResponse = null;
		if(list != null && !list.isEmpty()){
			partShowResponse = new PartShowResponse();
			partShowResponse.setList1(list);
		}
		return partShowResponse;
	}
	
	
	
}
