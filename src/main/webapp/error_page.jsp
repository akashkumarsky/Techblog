<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>error</title>

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
	clip-path: polygon(0 0, 100% 0, 73% 38%, 100% 100%, 50% 100%, 0 100%, 26% 38%);
}
</style>
</head>
<body>
	
	<div class="container text-center">
	<img  src="img/error.png" class="img-fluid">
	<h3 class="display-4">Sorry! Something went wrong.</h3>
	<%= exception %>
	<a href="index.jsp" class="btn bg-primary  text-white mt-2" >Home</a>
	
	</div>
	
	
	
	
	
	

</body>
</html>