package com.sjmcrf.yangfan.service;

import java.util.List;

import com.sjmcrf.yangfan.dto.PageQueryResult;
import com.sjmcrf.yangfan.entity.ColumnDetail;

public interface ColumnDetailService {
	
	PageQueryResult queryByPage(int pageIndex,int pageSize);
	
	void delete(String id);
	
	void insert(ColumnDetail detail);
	
	void update(ColumnDetail detail);
	
	ColumnDetail get(String id);
	
	List<ColumnDetail> queryAll();

	ColumnDetail getByCode(String code);
}
