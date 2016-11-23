package com.sjmcrf.yangfan.service;

import java.util.List;

import com.sjmcrf.yangfan.dto.PageQueryResult;
import com.sjmcrf.yangfan.entity.ColumnSimple;

public interface ColumnSimpleService {
	
	PageQueryResult queryByPage(int pageIndex,int pageSize);
	
	void delete(String id);
	
	void insert(ColumnSimple simple);
	
	void update(ColumnSimple simple);
	
	ColumnSimple get(String id);
	
	List<ColumnSimple> queryAll();
}
