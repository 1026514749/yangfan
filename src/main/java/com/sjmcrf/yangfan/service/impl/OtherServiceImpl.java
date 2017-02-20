package com.sjmcrf.yangfan.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjmcrf.yangfan.dao.OtherDao;
import com.sjmcrf.yangfan.entity.Other;
import com.sjmcrf.yangfan.service.OtherService;

@Service
public class OtherServiceImpl implements OtherService {
	
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private OtherDao dao;
	
	@Override
	public Other get() {
		// TODO Auto-generated method stub
		Other other = dao.get();
		return other;
	}

	
	@Override
	@Transactional
	public boolean modify(Other other) {
		// TODO Auto-generated method stub
		dao.deleteAll();
		dao.insert(other);
		return false;
	}

}
