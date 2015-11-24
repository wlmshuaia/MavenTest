package com.ikang.service;

import java.util.List;

import com.ikang.bean.Admin;

public interface AdminService {
	public List<Admin> selectAllAdmin();
	public Admin getAdminByNP(String adminname, String password) ;
}
