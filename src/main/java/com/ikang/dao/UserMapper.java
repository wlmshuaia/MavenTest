package com.ikang.dao;

import java.util.List;

import com.ikang.bean.User;

public interface UserMapper {
	public User selectUser(int id) ;
	public User selectUserByName(String username);
	public int insertOneUser(User user);
	public int updateUser(User user);
	public int deleteUser(int id);
	public List<User> selectAllUser() ;
//	public List selectUserLimit(@Param("pageStart") int pageStart, @Param("pageSize") int pageSize) ;
	public List<User> selectUserLimit(int pageStart, int pageSize) ;
	public int getCount();
}
