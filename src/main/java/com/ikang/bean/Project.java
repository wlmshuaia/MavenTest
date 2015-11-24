package com.ikang.bean;

import java.io.Serializable;

/**
 * 体检项目
 * @author Administrator
 *
 */
public class Project implements Serializable {
	private static final long serialVersionUID = 1484058711158311822L;
	private int id ;
	private String name ;
	private int sex ;
	private float price ;
	private String description;
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
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
