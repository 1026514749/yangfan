package com.sjmcrf.yangfan.service;

import java.util.List;

import com.sjmcrf.yangfan.dto.PageQueryResult;
import com.sjmcrf.yangfan.entity.Employee;

public interface EmployeeService {
	
	PageQueryResult queryByPage(int pageIndex,int pageSize);
	
	void delete(String id);
	
	void insert(Employee employee);
	
	void update(Employee employee);
	
	Employee get(String id);
	
	List<Employee> queryAll();
}
