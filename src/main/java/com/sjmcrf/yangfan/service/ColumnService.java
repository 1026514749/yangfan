package com.sjmcrf.yangfan.service;

import java.util.List;

import com.sjmcrf.yangfan.dto.PageQueryResult;
import com.sjmcrf.yangfan.entity.Column;

public interface ColumnService {
	
	PageQueryResult queryByPage(int pageIndex,int pageSize);
	
	void delete(String id);
	
	void insert(Column column);
	
	void update(Column column);
	
	Column get(String id);
	
	Column getByCode(String code);
	
	List<Column> queryAll();
}
