package com.spearbothy.service;

import com.spearbothy.exception.BaseException;
import com.spearbothy.model.User;
import com.spearbothy.receive.RUser;


public interface UserService {
	
	User register(RUser rUser) throws BaseException;

	User login(RUser mRuser) throws BaseException;
	
	User register(User user) throws BaseException;
}
