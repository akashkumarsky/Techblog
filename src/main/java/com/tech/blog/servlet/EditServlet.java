package com.tech.blog.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.Userdao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class EditServlet
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {

			String userPassword = request.getParameter("user_password");
			String userAbout = request.getParameter("text_area");
			Part part = request.getPart("profile_pic");
			String imageName = part.getSubmittedFileName();
			String userName = request.getParameter("user_name");
			String userEmail = request.getParameter("user_email");

			// get the session form user

			HttpSession s = request.getSession();
			User user = (User) s.getAttribute("currentUser");
			user.setUname(userName);
			user.setUemail(userEmail);
			user.setUpassword(userPassword);
			user.setUabout(userAbout);
			String oldFile = user.getProfile();
			user.setProfile(imageName);

			// update database
			Userdao UserDao = new Userdao(ConnectionProvider.getConnection());
			boolean ans = UserDao.updateUser(user);
			if (ans) {

				String path = request.getServletContext().getRealPath("/") + "pics" + File.separator
						+ user.getProfile();
				
				String patholdfile = request.getServletContext().getRealPath("/") + "pics" + File.separator
						+ oldFile;
				if(!oldFile.equals("default.png")) {
				Helper.deleteFile(patholdfile);
				}
				if (Helper.saveFile(part.getInputStream(), path)) {
					out.println("profile update successfully!");
					Message msg = new Message("profile update successfully!", "success", "alert-success");
					s.setAttribute("msg", msg);

				} else {

					Message msg = new Message("Somethig went wrong", "error", "alert-danger");
					s.setAttribute("msg", msg);
				}

			} else {
				out.println("Not update");

				Message msg = new Message("Somethig went wrong", "error", "alert-danger");
				s.setAttribute("msg", msg);
			}
			response.sendRedirect("profile.jsp");

		}

	}

}
