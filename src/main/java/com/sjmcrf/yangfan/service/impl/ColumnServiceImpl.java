package com.sjmcrf.yangfan.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjmcrf.yangfan.dao.ColumnDao;
import com.sjmcrf.yangfan.dto.PageQueryResult;
import com.sjmcrf.yangfan.entity.Column;
import com.sjmcrf.yangfan.service.ColumnService;
@Service
public class ColumnServiceImpl implements ColumnService {
	
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private ColumnDao columnDao;
	
	
	@Override
	public PageQueryResult queryByPage(int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		PageQueryResult result = new PageQueryResult(false);
		//这里有一个会忽略的地方  ligerGrid是从1开始，但是mysql不是
		List<Map<String, Object>> data = columnDao.queryByPage((pageIndex-1)*pageSize, pageSize);
		int count = columnDao.getCount();
		
		result.setDataList(data);
		result.setTotalCount(count);
		result.setSuccess(true);
		
		return result;
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		columnDao.delete(id);
	}

	@Override
	@Transactional
	public void insert(Column column) {
		// TODO Auto-generated method stub
		columnDao.deleteAll(column.getCode());
		columnDao.insert(column);
	}

	@Override
	public void update(Column column) {
		// TODO Auto-generated method stub
		columnDao.update(column);
	}

	@Override
	public Column get(String id) {
		// TODO Auto-generated method stub
		return columnDao.get(id);
	}
	
	

	@Override
	public Column getByCode(String code) {
		// TODO Auto-generated method stub
		return columnDao.getByCode(code);
	}

	@Override
	public List<Column> queryAll() {
		// TODO Auto-generated method stub
		return columnDao.queryAll();
	}

}
