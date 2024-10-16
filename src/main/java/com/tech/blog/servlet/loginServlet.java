package com.tech.blog.servlet;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.Userdao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

public class loginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String userEmail = request.getParameter("uemail");
		
		String userPassword = request.getParameter("upassword");
		
		Userdao dao= new Userdao(ConnectionProvider.getConnection());
		
		User u = dao.getUserByEmailAndPassword(userEmail, userPassword);
		
		if(u==null) {
			
			
			Message msg = new Message("Invalid details try angain!","error","alert-danger");
			HttpSession s =request.getSession();
			s.setAttribute("msg", msg);
			
			response.sendRedirect("login.jsp");
		}else {
			HttpSession s = request.getSession();
			s.setAttribute("currentUser", u);
			response.sendRedirect("profile.jsp");
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

}
