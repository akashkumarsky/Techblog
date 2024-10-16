package com.tech.blog.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.Userdao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@MultipartConfig
public class RegisterServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try(PrintWriter out = response.getWriter()) {
			String check = request.getParameter("check");
			if (check == null) {
				out.println("Checkbox is not checked.");
			} else {
				String uname = request.getParameter("uname");
				String uemail = request.getParameter("uemail");
				String upassword = request.getParameter("upassword");
				String ugender = request.getParameter("ugender");
				String uabout = request.getParameter("uabout");

				// Creating user object
				User user = new User(uname, uemail, upassword, ugender, uabout);

				// Creating DAO object and saving user
				Userdao dao = new Userdao(ConnectionProvider.getConnection());

				if (dao.saveUser(user)) {
					out.println("done");
				} else {
					out.println("Failed to register user. or Email already exist:");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

}
