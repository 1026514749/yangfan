package com.sjmcrf.yangfan.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjmcrf.yangfan.dao.EvaluateDao;
import com.sjmcrf.yangfan.dto.PageQueryResult;
import com.sjmcrf.yangfan.entity.Evaluate;
import com.sjmcrf.yangfan.service.EvaluateService;
@Service
public class EvaluateServiceImpl implements EvaluateService {
	
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private EvaluateDao evaluateDao;
	
	
	@Override
	public PageQueryResult queryByPage(int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		PageQueryResult result = new PageQueryResult(false);
		//这里有一个会忽略的地方  ligerGrid是从1开始，但是mysql不是
		List<Map<String, Object>> data = evaluateDao.queryByPage((pageIndex-1)*pageSize, pageSize);
		int count = evaluateDao.getCount();
		
		result.setDataList(data);
		result.setTotalCount(count);
		result.setSuccess(true);
		
		return result;
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		evaluateDao.delete(id);
	}

	@Override
	@Transactional
	public void insert(Evaluate evaluate) {
		// TODO Auto-generated method stub
		evaluateDao.insert(evaluate);
	}

	@Override
	public void update(Evaluate evaluate) {
		// TODO Auto-generated method stub
		evaluateDao.update(evaluate);
	}

	@Override
	public Evaluate get(String id) {
		// TODO Auto-generated method stub
		return evaluateDao.get(id);
	}

	@Override
	public List<Evaluate> queryAll() {
		// TODO Auto-generated method stub
		return evaluateDao.queryAll();
	}

}
