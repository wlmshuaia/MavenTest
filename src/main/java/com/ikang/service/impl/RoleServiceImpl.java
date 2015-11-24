package com.ikang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikang.bean.Role;
import com.ikang.dao.RoleMapper;
import com.ikang.service.RoleService;

@Service("roleService")
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleMapper roleMapper;
	
	public List<Role> selectAll() {
		return this.roleMapper.selectAll();
	}

	public void insertRole(Role role) {
		this.roleMapper.insertRole(role);
	}

	public void deleteRole(int id) {
		this.roleMapper.deleteRole(id);
	}

	public void updateRole(Role role) {
		this.roleMapper.updateRole(role);
	}

	public Role getRoleById(int id) {
		return this.roleMapper.getRoleById(id);
	}
}
