package com.ikang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikang.bean.User;
import com.ikang.dao.UserMapper;
import com.ikang.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper ;
	
	public User selectUser(int id) {
		return this.userMapper.selectUser(id);
	}
	
	public List<User> selectUserLimit(int pageStart, int pageSize){
		return this.userMapper.selectUserLimit(pageStart, pageSize);
	}
	
	public int getCount() {
		return this.userMapper.getCount();
	}
	
	public List<User> selectAllUser() {
		return this.userMapper.selectAllUser() ;
	}
	
	public void insertUser(User user) {
		this.userMapper.insertOneUser(user);
	}
	
	public void deleteUser(int uid) {
		this.userMapper.deleteUser(uid);
	}
	
	public void updateUser(User user) {
		this.userMapper.updateUser(user);
	}
	
}
