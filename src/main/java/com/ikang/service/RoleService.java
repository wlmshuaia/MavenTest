package com.ikang.service;

import java.util.List;

import com.ikang.bean.Role;

public interface RoleService {
	public List<Role> selectAll() ;
	public Role getRoleById(int id);
	public void insertRole(Role role);
	public void deleteRole(int id) ;
	public void updateRole(Role role);
}
