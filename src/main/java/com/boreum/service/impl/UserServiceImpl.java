package com.boreum.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.boreum.mapper.UserMapper;
import com.boreum.service.UserDao;
import com.boreum.service.UserService;
import com.boreum.service.domain.Miform;
import com.boreum.service.domain.User;

@Service
public class UserServiceImpl implements UserService {
	
	///Field
	@Autowired
	private UserMapper userMapper;

	///Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addUser(User user) throws Exception {
		userMapper.addUser(user);
		
	}

	@Override
	public void updateProfile(User user) throws Exception {
		userMapper.updateProfile(user);
	}

	@Override
	public Map<String, Object> list() throws Exception {
		List<User> list= userMapper.list();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		
		return map;
	}

	@Override
	public User getUser(String userno) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getUser(userno);
	}

	@Override
	public void insert(User user) throws Exception {
		userMapper.insert(user);
		
	}

	@Override
	public List<User> lists() throws Exception {
		// TODO Auto-generated method stub
		return userMapper.list();
	}

	@Override
	public List<Miform> listMi() throws Exception {
		return userMapper.listMi();
	}

	@Override
	public void insertMi(Miform miform) throws Exception {
		userMapper.insertMi(miform);
	}

	@Override
	public void deleteMi(String dpval) throws Exception {
		//System.out.println(dpval);
		userMapper.deleteMi(dpval);
	}

	@Override
	public void updateMi(Miform miform) throws Exception {
		userMapper.updateMi(miform);
		
	}

	@Override
	public List<Miform> listMis(Miform miform) throws Exception {
		
		return userMapper.listMis(miform);
	}
	


}
