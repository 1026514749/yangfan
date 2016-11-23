package com.sjmcrf.yangfan.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjmcrf.yangfan.dao.EmployeeDao;
import com.sjmcrf.yangfan.dto.PageQueryResult;
import com.sjmcrf.yangfan.entity.Employee;
import com.sjmcrf.yangfan.service.EmployeeService;
@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private EmployeeDao employeeDao;
	
	
	@Override
	public PageQueryResult queryByPage(int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		PageQueryResult result = new PageQueryResult(false);
		//这里有一个会忽略的地方  ligerGrid是从1开始，但是mysql不是
		List<Map<String, Object>> data = employeeDao.queryByPage((pageIndex-1)*pageSize, pageSize);
		int count = employeeDao.getCount();
		
		result.setDataList(data);
		result.setTotalCount(count);
		result.setSuccess(true);
		
		return result;
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		employeeDao.delete(id);
	}

	@Override
	@Transactional
	public void insert(Employee employee) {
		// TODO Auto-generated method stub
		employeeDao.insert(employee);
	}

	@Override
	public void update(Employee employee) {
		// TODO Auto-generated method stub
		employeeDao.update(employee);
	}

	@Override
	public Employee get(String id) {
		// TODO Auto-generated method stub
		return employeeDao.get(id);
	}

	@Override
	public List<Employee> queryAll() {
		// TODO Auto-generated method stub
		return employeeDao.queryAll();
	}

}
