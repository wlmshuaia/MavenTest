package com.ikang.dao;

import java.util.List;

import com.ikang.bean.Admin;

public interface AdminMapper {
	public List<Admin> selectAllAdmin() ;
	public Admin getAdminByNP(String adminname, String password);
}
