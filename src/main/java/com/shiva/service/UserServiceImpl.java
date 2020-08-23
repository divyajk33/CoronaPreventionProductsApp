package com.shiva.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shiva.bindings.User;

import com.shiva.entity.UserEntity;
import com.shiva.exception.ProductException;
import com.shiva.repository.ProductRepository;
import com.shiva.repository.UserRepository;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserRepository repo;
	@Autowired
	ProductRepository repo1;
	@Override
	public boolean addUsers(User u) {
		 boolean isSaved=false;
			
		 try {
				UserEntity entity=new UserEntity();
				BeanUtils.copyProperties(u, entity);
				UserEntity addedEntity=repo.save(entity);
				if( addedEntity.getPid()!=null) {
					isSaved=true;
				}
				
			}
			catch(Exception e){
				throw new ProductException("The user is not added successfully please try again!!!");
			}
			
		
		
		
		return isSaved;
		
	}

	@Override
	public boolean login(String uname, String pass) {
		
		
		List<UserEntity>u=repo.findByName(uname);
		boolean isLogged=false;
		for(UserEntity us:u)
		if(uname.equals(us.getUsername())&& pass.equals(us.getPassword())) {
			isLogged=true;
		}
		return isLogged;
	}

	

}
