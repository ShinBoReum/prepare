package com.boreum.mapper;

import java.util.List;

import com.boreum.service.domain.Miform;
import com.boreum.service.domain.User;

public interface UserMapper {

	public void addUser(User user);
	
	public void updateProfile(User user);

	public List<User> list();
	
	public User getUser(String userno);
	
	public void insert(User user);
	
	public List<Miform> listMi();
	
	public void insertMi(Miform miform);
	
	public void deleteMi(String dpval);
	
	public void updateMi(Miform miform);
	
	public List<Miform> listMis(Miform miform) throws Exception;
}
