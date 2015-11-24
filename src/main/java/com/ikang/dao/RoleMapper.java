package com.ikang.dao;

import java.util.List;

import com.ikang.bean.Role;

public interface RoleMapper {
	public List<Role> selectAll() ;
	public Role getRoleById(int id);
	public void insertRole(Role role);
	public void deleteRole(int id);
	public void updateRole(Role role);
}
