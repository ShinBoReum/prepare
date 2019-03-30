package com.boreum.service;

import java.util.List;
import java.util.Map;

import com.boreum.service.domain.Miform;
import com.boreum.service.domain.User;

public interface UserService {
	
	public void addUser(User user) throws Exception;
	
	public User getUser(String userno) throws Exception;
	
	public void updateProfile(User user) throws Exception;
	
	public Map<String , Object> list() throws Exception;
	
	public List<User> lists() throws Exception;
	
	public void insert(User user) throws Exception;
	
	public List<Miform> listMi() throws Exception;
	
	public void insertMi(Miform miform) throws Exception;
	
	public void deleteMi(String dpval) throws Exception;
	
	public void updateMi(Miform miform) throws Exception;
	
	public List<Miform> listMis(Miform miform) throws Exception;

}
