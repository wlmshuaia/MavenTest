package com.ikang.bean;

import java.io.Serializable;

/**
 * 套餐
 * @author Administrator
 *
 */
public class Package implements Serializable {
	private static final long serialVersionUID = -1046088604733569489L;
	private int id ;
	private String name ;
	private String description ;
	private int hid;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getHid() {
		return hid;
	}
	public void setHid(int hid) {
		this.hid = hid;
	}
}
