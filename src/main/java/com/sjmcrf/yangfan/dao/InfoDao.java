package com.sjmcrf.yangfan.dao;

import org.apache.ibatis.annotations.Param;

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
	int delelteAll();
	
	/**
	 * 插入新信息
	 * @return
	 */
	int insert(Info info);
}
