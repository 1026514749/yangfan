package com.sjmcrf.yangfan.dao;

import com.sjmcrf.yangfan.entity.Info;

public interface InfoDao {

	/**
	 * 获取最新的公司信息
	 * @return
	 */
	Info get();
	
	/**
	 * 将原信息删除
	 * @return
	 */
	int deleteAll();
	
	/**
	 * 插入新信息
	 * @return
	 */
	int insert(Info info);
}
