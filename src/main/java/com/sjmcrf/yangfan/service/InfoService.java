package com.sjmcrf.yangfan.service;

import com.sjmcrf.yangfan.entity.Info;

public interface InfoService {
	/**
	 * 获取公司基本信息
	 * @return
	 */
	Info get();
	
	boolean modify(Info info);
}
