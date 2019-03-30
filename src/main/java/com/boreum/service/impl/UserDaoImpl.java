package com.boreum.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.boreum.service.UserDao;
import com.boreum.service.domain.User;



@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao{
		
		///Constructor
		public UserDaoImpl() {
			System.out.println(this.getClass());
		}

		@Override
		public void addUser(User user) throws Exception {
			// TODO Auto-generated method stub
			
		}


}
