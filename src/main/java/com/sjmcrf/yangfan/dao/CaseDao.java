package com.sjmcrf.yangfan.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.sjmcrf.yangfan.entity.Case;

public interface CaseDao {
	
	public Case get(@Param(value="id")String id);
	
	public void delete(@Param(value="id")String id);
	
	public void insert(Case ncase);
	
	public void update(Case ncase);
	
	public int getCount();
	
	public List<Map<String,Object>> queryByPage(@Param(value="pageIndex")int pageIndex,@Param(value="pageSize")int pageSize);
	
	public List<Case> queryAll();
}
