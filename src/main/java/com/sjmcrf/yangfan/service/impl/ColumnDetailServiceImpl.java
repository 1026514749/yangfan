package com.sjmcrf.yangfan.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjmcrf.yangfan.dao.ColumnDetailDao;
import com.sjmcrf.yangfan.dao.ColumnDetailDao;
import com.sjmcrf.yangfan.dto.PageQueryResult;
import com.sjmcrf.yangfan.entity.ColumnDetail;
import com.sjmcrf.yangfan.service.ColumnDetailService;
@Service
public class ColumnDetailServiceImpl implements ColumnDetailService {
	
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private ColumnDetailDao detailDao;
	
	
	@Override
	public PageQueryResult queryByPage(int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		PageQueryResult result = new PageQueryResult(false);
		//这里有一个会忽略的地方  ligerGrid是从1开始，但是mysql不是
		List<Map<String, Object>> data = detailDao.queryByPage((pageIndex-1)*pageSize, pageSize);
		int count = detailDao.getCount();
		
		result.setDataList(data);
		result.setTotalCount(count);
		result.setSuccess(true);
		
		return result;
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		detailDao.delete(id);
	}

	@Override
	@Transactional
	public void insert(ColumnDetail detail) {
		// TODO Auto-generated method stub
		detailDao.deleteAll(detail.getCode());
		detailDao.insert(detail);
	}

	@Override
	public void update(ColumnDetail detail) {
		// TODO Auto-generated method stub
		detailDao.update(detail);
	}

	@Override
	public ColumnDetail get(String id) {
		// TODO Auto-generated method stub
		return detailDao.get(id);
	}

	@Override
	public List<ColumnDetail> queryAll() {
		// TODO Auto-generated method stub
		return detailDao.queryAll();
	}

	@Override
	public ColumnDetail getByCode(String code) {
		// TODO Auto-generated method stub
		return detailDao.getByCode(code);
	}
	
	

}
