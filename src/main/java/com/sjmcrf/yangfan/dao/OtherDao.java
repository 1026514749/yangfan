package com.sjmcrf.yangfan.dao;

import com.sjmcrf.yangfan.entity.Info;
import com.sjmcrf.yangfan.entity.Other;

public interface OtherDao {
	/**
	 * 获取最新的其它信息
	 * @return
	 */
	Other get();
	
	/**
	 * 将原信息删除
	 * @return
	 */
	int deleteAll();
	
	/**
	 * 插入新信息
	 * @return
	 */
	int insert(Other Other);
}
