package com.sjmcrf.yangfan.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.sjmcrf.yangfan.entity.ColumnSimple;

public interface ColumnSimpleDao {
	
	public ColumnSimple get(@Param(value="id")String id);
	
	public void deleteAll(@Param(value="code")String code);
	
	public void delete(@Param(value="id")String id);
	
	public void insert(ColumnSimple simple);
	
	public void update(ColumnSimple simple);
	
	public int getCount();
	
	public List<Map<String,Object>> queryByPage(@Param(value="pageIndex")int pageIndex,@Param(value="pageSize")int pageSize);
	
	public List<ColumnSimple> queryAll();
	
}
