package com.tech.blog.helper;

import java.sql.Connection;

import java.sql.DriverManager;

public class ConnectionProvider {

	private static Connection con;

	public static Connection getConnection() {

		try {
			if (con == null || con.isClosed()) { // Check if connection is null or closed
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				String url = "jdbc:mysql://localhost:3306/techblog";
				
				String username = "root";
				
				String password = "root";
				
				con = DriverManager.getConnection(url, username, password);// As;sign to class-level variable
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;
	}
}
