package com.sjmcrf.yangfan.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;



import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjmcrf.yangfan.dao.InfoDao;
import com.sjmcrf.yangfan.entity.Info;
import com.sjmcrf.yangfan.service.InfoService;
@Service
public class InfoServiceImpl implements InfoService {
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private InfoDao infoDao;
	@Override
	public Info get() {
		// TODO Auto-generated method stub
		Info info = infoDao.get();
		return info;
	}

	@Override
	@Transactional
	public boolean modify(Info info) {
		// TODO Auto-generated method stub
		infoDao.deleteAll();
		infoDao.insert(info);
		return true;
	}

}
