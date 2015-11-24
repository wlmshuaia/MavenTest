package com.ikang.service;

import java.util.List;

import com.ikang.bean.User;

public interface UserService {
	
	public User selectUser(int id);
	public List<User> selectUserLimit(int pageStart, int pageSize);
	public int getCount();
	public List<User> selectAllUser();
	public void insertUser(User user);
	public void deleteUser(int uid);
	public void updateUser(User user);
}
