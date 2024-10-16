<%@page import="com.tech.blog.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>

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
	clip-path: polygon(0 0, 100% 0, 100% 30%, 100% 70%, 84% 100%, 35% 91%, 12% 79%, 2% 100%);
}
</style>
</head>
<body>
	<%@ include file="Normal_navbar.jsp"%>
	<main class="d-flex align-items-center bg-primary banner-background"
		style="height: 70vh">
		<div class="container ">
			<div class="row ">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header bg-primary text-white text-center">
							<span class="fa fa-user-circle fa-3x"></span>
							<p>Login Here</p>
						</div>
						<%
							Message m = (Message) session.getAttribute("msg");
							if(m != null){
								%>
								<div class="alert <%= m.getCssClass() %>" role ="alert">
								<%= m.getContent() %>
								</div>
								<%
								session.removeAttribute("msg");
							}
						
						%>
						<div class="card-body">
							<form action="loginServlet" method="post">



								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Email
										address</label> <input name="uemail" required type="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp">
									<div id="emailHelp" class="form-text">We'll never share
										your email with anyone else.</div>
								</div>

								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Password</label>
									<input name="upassword" required type="password" class="form-control"
										id="exampleInputPassword1">
								</div>

								

								<div class= "container text-center">
								<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</main>















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