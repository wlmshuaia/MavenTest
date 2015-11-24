package com.ikang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikang.bean.Admin;
import com.ikang.dao.AdminMapper;
import com.ikang.service.AdminService;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper adminMapper ;
	
	public List<Admin> selectAllAdmin() {
		return this.adminMapper.selectAllAdmin();
	}
	
	public Admin getAdminByNP(String adminname, String password) {
		return this.adminMapper.getAdminByNP(adminname, password);
	}
}
