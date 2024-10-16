package com.tech.blog.entities;

import java.sql.Timestamp;

public class User {
	private int id;
	private String uname;
	private String uemail;
	private String upassword;
	private String ugender;
	private String uabout;
	private Timestamp rdate;
	private String profile;
	
	public User(int id, String uname, String uemail, String upassword, String ugender, String uabout, Timestamp rdate, String profile) {
		super();
		this.id = id;
		this.uname = uname;
		this.uemail = uemail;
		this.upassword = upassword;
		this.ugender = ugender;
		this.uabout = uabout;
		this.rdate = rdate;
		this.profile=profile;
	}
	public User() {
		super();
	}
	public User(String uname, String uemail, String upassword, String ugender, String uabout) {
		super();
		this.uname = uname;
		this.uemail = uemail;
		this.upassword = upassword;
		this.ugender = ugender;
		this.uabout = uabout;
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUpassword() {
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
	public String getUgender() {
		return ugender;
	}
	public void setUgender(String ugender) {
		this.ugender = ugender;
	}
	public String getUabout() {
		return uabout;
	}
	public void setUabout(String uabout) {
		this.uabout = uabout;
	}
	public Timestamp getRdate() {
		return rdate;
	}
	public void setRdate(Timestamp rdate) {
		this.rdate = rdate;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public void setDateTime(Timestamp timestamp) {
		// TODO Auto-generated method stub
		
	}
	
	
	
	
}
