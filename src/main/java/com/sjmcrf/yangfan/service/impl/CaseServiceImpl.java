package com.sjmcrf.yangfan.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjmcrf.yangfan.dao.CaseDao;
import com.sjmcrf.yangfan.dto.PageQueryResult;
import com.sjmcrf.yangfan.entity.Case;
import com.sjmcrf.yangfan.service.CaseService;
@Service
public class CaseServiceImpl implements CaseService {
	
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private CaseDao caseDao;
	
	
	@Override
	public PageQueryResult queryByPage(int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		PageQueryResult result = new PageQueryResult(false);
		//这里有一个会忽略的地方  ligerGrid是从1开始，但是mysql不是
		List<Map<String, Object>> data = caseDao.queryByPage((pageIndex-1)*pageSize, pageSize);
		int count = caseDao.getCount();
		
		result.setDataList(data);
		result.setTotalCount(count);
		result.setSuccess(true);
		
		return result;
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		caseDao.delete(id);
	}

	@Override
	@Transactional
	public void insert(Case ncase) {
		// TODO Auto-generated method stub
		caseDao.insert(ncase);
	}

	@Override
	public void update(Case ncase) {
		// TODO Auto-generated method stub
		caseDao.update(ncase);
	}

	@Override
	public Case get(String id) {
		// TODO Auto-generated method stub
		return caseDao.get(id);
	}

	@Override
	public List<Case> queryAll() {
		// TODO Auto-generated method stub
		return caseDao.queryAll();
	}

	@Override
	public List<Case> queryAllByCode(String code) {
		// TODO Auto-generated method stub
		return caseDao.queryAllByCode(code);
	}
	
	

}
