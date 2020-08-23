package com.shiva.service;

import com.shiva.bindings.User;

public interface UserService {
	boolean addUsers(User u);
	boolean login(String uname,String pass);
	
	
}
