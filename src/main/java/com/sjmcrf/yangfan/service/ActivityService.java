package com.sjmcrf.yangfan.service;

import java.util.List;

import com.sjmcrf.yangfan.dto.PageQueryResult;
import com.sjmcrf.yangfan.entity.Activity;

public interface ActivityService {
	
	PageQueryResult queryByPage(int pageIndex,int pageSize);
	
	void delete(String id);
	
	void insert(Activity activity);
	
	void update(Activity activity);
	
	Activity get(String id);
	
	List<Activity> queryAll();
}
