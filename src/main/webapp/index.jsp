
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>home</title>

<!-- css link -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />

<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.banner-background {
	clip-path: polygon(0 0, 100% 0, 100% 68%, 85% 100%, 69% 88%, 28% 100%, 0 100%);
}
</style>
</head>
<body>
	<!-- Navbar menu -->
	<%@ include file="Normal_navbar.jsp"%>

	<!-- Banner -->
	<div class="container-fluid p-0 m-0 mb-2">
		<div class="jumbotron bg-primary  text-white banner-background">
			<div class="container">
				<h3 class="display-3">Welcome to SkyLight page!</h3>
				<p>Spring Boot Tutorial provides basic and advanced concepts of
					Spring Framework. Our Spring Boot Tutorial is designed for
					beginners and professionals both. Spring Boot is a Spring module
					that provides the RAD (Rapid Application Development) feature to
					the Spring framework. Our Spring Boot Tutorial includes all topics
					of Spring Boot such, as features, project, maven project, starter
					project wizard, Spring Initializr, CLI, applications, annotations,
					dependency management, properties, starters, Actuator, JPA, JDBC,
					etc.</p>

				<a href="registation.jsp" type="button"
					class="btn btn-outline-light"> <span class="fa fa-user-plus"></span>
					Start! for free
				</a> <a href="login.jsp" type="button" class="btn btn-outline-light">
					<span class="fa fa-user-circle fa-spin"></span> Login
				</a> <br> <br>

			</div>
		</div>
	</div>

	<!-- cards -->

	






	<!-- javascript -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
	<script src="myjs/myjs.js" type="text/javascript"></script>


</body>
</html>