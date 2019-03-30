package com.boreum.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.boreum.mapper.UserMapper;
import com.boreum.service.ProductService;
import com.boreum.service.domain.User;

public class ProductServiceImpl implements ProductService {
	@Autowired
	private UserMapper userMapper;

	///Constructor
	public ProductServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addUser(User user) throws Exception {
		userMapper.addUser(user);
		
	}
}
