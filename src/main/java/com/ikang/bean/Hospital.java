package com.ikang.bean;

import java.io.Serializable;

/**
 * 体检机构
 * @author Administrator
 *
 */
public class Hospital implements Serializable {
	private static final long serialVersionUID = 695004495500077089L;
	private int id ;
	private String name;
	private String address;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}
