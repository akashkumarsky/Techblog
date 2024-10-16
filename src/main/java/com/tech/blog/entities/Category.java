package com.tech.blog.entities;

public class Category {
	private int cId;
	private String cName;
	private String description;
	public Category(int cId, String cName, String description) {
		super();
		this.cId = cId;
		this.cName = cName;
		this.description = description;
	}
	public Category() {
		super();
	}
	public Category(String cName, String description) {
		super();
		this.cName = cName;
		this.description = description;
	}
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
	
}
