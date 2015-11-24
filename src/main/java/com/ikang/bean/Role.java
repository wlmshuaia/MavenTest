package com.ikang.bean;

import java.io.Serializable;

public class Role implements Serializable {
	private static final long serialVersionUID = 8361326638543855682L;
	private int id;
	private String name;
	private String remark;
	private String isOpen;

	public int getId() {
		return id;
	}

	public String getIsOpen() {
		return isOpen;
	}

	public String getName() {
		return name;
	}

	public String getRemark() {
		return remark;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setIsOpen(String isOpen) {
		this.isOpen = isOpen;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "Role [id=" + id + ", name=" + name + ", remark=" + remark
				+ ", isOpen=" + isOpen + "]";
	}
}
