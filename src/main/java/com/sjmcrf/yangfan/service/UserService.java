package com.sjmcrf.yangfan.service;

import java.util.List;

import com.sjmcrf.yangfan.entity.User;

public interface UserService {

	List<User> getUserList(int offset, int limit);
	 
}
