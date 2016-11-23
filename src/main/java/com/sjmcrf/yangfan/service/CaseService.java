package com.sjmcrf.yangfan.service;

import java.util.List;

import com.sjmcrf.yangfan.dto.PageQueryResult;
import com.sjmcrf.yangfan.entity.Case;

public interface CaseService {
	
	PageQueryResult queryByPage(int pageIndex,int pageSize);
	
	void delete(String id);
	
	void insert(Case ncase);
	
	void update(Case ncase);
	
	Case get(String id);
	
	List<Case> queryAll();
}
