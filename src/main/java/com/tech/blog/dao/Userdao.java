package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tech.blog.entities.User;

public class Userdao {
	private Connection con;

	public Userdao(Connection con) {
		super();
		this.con = con;
	}

	public boolean saveUser(User user) {
		boolean f = false;
		try {

			String query = "INSERT INTO user (uname,uemail,upassword,ugender,uabout) values(?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);

			pstmt.setString(1, user.getUname());
			pstmt.setString(2, user.getUemail());
			pstmt.setString(3, user.getUpassword());
			pstmt.setString(4, user.getUgender());
			pstmt.setString(5, user.getUabout());

			pstmt.executeUpdate();
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	// get user by email and password
	public User getUserByEmailAndPassword(String uemail, String upassword) {
		User user = null;

		try {
			String query = "Select * from user where uemail=? and upassword=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, uemail);
			pstmt.setString(2, upassword);

			ResultSet set = pstmt.executeQuery();

			if (set.next()) {
				user = new User();

				// data from db
				user.setUname(set.getString("uname"));
				user.setId(set.getInt("id"));
				user.setUemail(set.getString("uemail"));
				user.setUpassword(set.getString("upassword"));
				user.setUgender(set.getString("ugender"));
				user.setUabout(set.getString("uabout"));
				user.setProfile(set.getString("profile"));
				user.setRdate(set.getTimestamp("udate"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	/* update */
	public boolean updateUser(User user) {

		boolean f = false;
		try {

			String query = "update user set uname=? , uemail=? , upassword=? , ugender=? ,uabout=? , profile=? where  id =?";
			PreparedStatement p = con.prepareStatement(query);
			p.setString(1, user.getUname());
			p.setString(2, user.getUemail());
			p.setString(3, user.getUpassword());
			p.setString(4, user.getUgender());
			p.setString(5, user.getUabout());
			p.setString(6, user.getProfile());
			p.setInt(7, user.getId());

			p.executeUpdate();
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public User getUserByUserId(int userId) {
		User user = null;
		try {
			String q = "select * from user where id=?";
			PreparedStatement ps = this.con.prepareStatement(q);
			ps.setInt(1, userId);
			ResultSet set = ps.executeQuery();
			if (set.next()) {
				user = new User();

//	             data from db
				String name = set.getString("uname");
//	             set to user object
				user.setUname(name);

				user.setId(set.getInt("id"));
				user.setUemail(set.getString("uemail"));
				user.setUpassword(set.getString("upassword"));
				user.setUgender(set.getString("ugender"));
				user.setUabout(set.getString("uabout"));
				user.setRdate(set.getTimestamp("udate"));
				user.setProfile(set.getString("profile"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

}
