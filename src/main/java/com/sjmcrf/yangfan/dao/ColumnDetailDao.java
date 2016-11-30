package com.sjmcrf.yangfan.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.sjmcrf.yangfan.entity.ColumnDetail;

public interface ColumnDetailDao {
	
	public ColumnDetail get(@Param(value="id")String id);
	
	public ColumnDetail getByCode(@Param(value="code")String code);
	
	public void deleteAll(@Param(value="code")String code);
	
	public void delete(@Param(value="id")String id);
	
	public void insert(ColumnDetail simple);
	
	public void update(ColumnDetail simple);
	
	public int getCount();
	
	public List<Map<String,Object>> queryByPage(@Param(value="pageIndex")int pageIndex,@Param(value="pageSize")int pageSize);
	
	public List<ColumnDetail> queryAll();
	
}
