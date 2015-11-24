package com.ikang.bean;

import java.io.Serializable;

/**
 * 后台用户
 * @author Administrator
 */
public class Admin implements Serializable {
	private static final long serialVersionUID = -8647196670901486336L;
	private int id ;
	private String adminname ;
	private String password ;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAdminname() {
		return adminname;
	}
	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
