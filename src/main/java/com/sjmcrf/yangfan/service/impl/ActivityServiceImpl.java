package com.sjmcrf.yangfan.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjmcrf.yangfan.dao.ActivityDao;
import com.sjmcrf.yangfan.dto.PageQueryResult;
import com.sjmcrf.yangfan.entity.Activity;
import com.sjmcrf.yangfan.service.ActivityService;
@Service
public class ActivityServiceImpl implements ActivityService {
	
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private ActivityDao activityDao;
	
	
	@Override
	public PageQueryResult queryByPage(int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		PageQueryResult result = new PageQueryResult(false);
		//这里有一个会忽略的地方  ligerGrid是从1开始，但是mysql不是
		List<Map<String, Object>> data = activityDao.queryByPage((pageIndex-1)*pageSize, pageSize);
		int count = activityDao.getCount();
		
		result.setDataList(data);
		result.setTotalCount(count);
		result.setSuccess(true);
		
		return result;
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		activityDao.delete(id);
	}

	@Override
	@Transactional
	public void insert(Activity activity) {
		// TODO Auto-generated method stub
		activityDao.insert(activity);
	}

	@Override
	public void update(Activity activity) {
		// TODO Auto-generated method stub
		activityDao.update(activity);
	}

	@Override
	public Activity get(String id) {
		// TODO Auto-generated method stub
		return activityDao.get(id);
	}

	@Override
	public List<Activity> queryAll() {
		// TODO Auto-generated method stub
		return activityDao.queryAll();
	}

}
