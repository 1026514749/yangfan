package com.sjmcrf.yangfan.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.sjmcrf.yangfan.entity.Column;

public interface ColumnDao {
	
	public Column get(@Param(value="id")String id);
	
	public void deleteAll(@Param(value="code")String code);
	
	public void delete(@Param(value="id")String id);
	
	public void insert(Column column);
	
	public void update(Column column);
	
	public int getCount();
	
	public List<Map<String,Object>> queryByPage(@Param(value="pageIndex")int pageIndex,@Param(value="pageSize")int pageSize);
	
	public List<Column> queryAll();
}
