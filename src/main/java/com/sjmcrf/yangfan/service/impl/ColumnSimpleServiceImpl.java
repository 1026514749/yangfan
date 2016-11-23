package com.sjmcrf.yangfan.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjmcrf.yangfan.dao.ColumnSimpleDao;
import com.sjmcrf.yangfan.dto.PageQueryResult;
import com.sjmcrf.yangfan.entity.ColumnSimple;
import com.sjmcrf.yangfan.service.ColumnSimpleService;
@Service
public class ColumnSimpleServiceImpl implements ColumnSimpleService {
	
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private ColumnSimpleDao simpleDao;
	
	
	@Override
	public PageQueryResult queryByPage(int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		PageQueryResult result = new PageQueryResult(false);
		//这里有一个会忽略的地方  ligerGrid是从1开始，但是mysql不是
		List<Map<String, Object>> data = simpleDao.queryByPage((pageIndex-1)*pageSize, pageSize);
		int count = simpleDao.getCount();
		
		result.setDataList(data);
		result.setTotalCount(count);
		result.setSuccess(true);
		
		return result;
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		simpleDao.delete(id);
	}

	@Override
	@Transactional
	public void insert(ColumnSimple simple) {
		// TODO Auto-generated method stub
		simpleDao.deleteAll(simple.getCode());
		simpleDao.insert(simple);
	}

	@Override
	public void update(ColumnSimple simple) {
		// TODO Auto-generated method stub
		simpleDao.update(simple);
	}

	@Override
	public ColumnSimple get(String id) {
		// TODO Auto-generated method stub
		return simpleDao.get(id);
	}

	@Override
	public List<ColumnSimple> queryAll() {
		// TODO Auto-generated method stub
		return simpleDao.queryAll();
	}

}
