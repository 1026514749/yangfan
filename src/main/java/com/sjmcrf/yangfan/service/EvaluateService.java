package com.sjmcrf.yangfan.service;

import java.util.List;

import com.sjmcrf.yangfan.dto.PageQueryResult;
import com.sjmcrf.yangfan.entity.Evaluate;

public interface EvaluateService {
	
	PageQueryResult queryByPage(int pageIndex,int pageSize);
	
	void delete(String id);
	
	void insert(Evaluate evaluate);
	
	void update(Evaluate evaluate);
	
	Evaluate get(String id);
	
	List<Evaluate> queryAll();
}
