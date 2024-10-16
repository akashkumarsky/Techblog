<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.Userdao"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error_page.jsp"%>

<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login.jsp");
}
%>
<%
int postId = Integer.parseInt(request.getParameter("post_id"));
PostDao d = new PostDao(ConnectionProvider.getConnection());
Post p = d.getPostByPostId(postId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=p.getpTitle()%></title>
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
body {
	background: url(img/4.jpg);
	background-size: cover;
	background-attachment: fixed;
}

.banner-background {
	clip-path: polygon(0 0, 100% 0, 73% 38%, 100% 100%, 50% 100%, 0 100%, 26% 38%);
}

.post-title {
	font-weight: 100;
	font-size: 30px;
}

.post-content {
	font-weight: 100;
	font-size: 25px;
}

.user-info {
	font-weight: 100;
	font-size: 20px;
	font-style: italic;
	font-weight: bold;
}

.post-date {
	font-style: italic;
	font-weight: bold;
}

.card-color {
	background: red;
	color: white;
}
</style>
</head>
<body>
	<!-- profile nav bar -->
	<nav class="navbar navbar-expand-lg navbar-dark primary-backgrond">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp"><span
				class="fa fa-coffee" style="font-size: 24px"></span> SkyLight</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">

					<li class="nav-item">
					<li class="nav-item"><a class="nav-link" href="#">About</a></li>
					<li class="nav-item"><a class="nav-link" href="#!"
						data-bs-toggle="modal" data-bs-target="#Add-post">Add post</a></li>




				</ul>
				<ul class="navbar-nav mr-right">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#!" data-bs-toggle="modal"
						data-bs-target="#Profile-Modal"><span
							class="fa fa-user-circle "><%=user.getUname()%></span></a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="logoutServlet"><span
							class="fa fa-close "> </span> Logout</a></li>
				</ul>



			</div>
		</div>
	</nav>

	<!-- profile nav bar end -->

	<!-- 	main body -->
	<div class="container">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-header bg-primary text-white mt-2 ">
						<h4 class="post-title"><%=p.getpTitle()%></h4>
					</div>
					<div class="card-body">
						<img class="card-img-top my-1" src="blog_pics/<%=p.getpPic()%>"
							class="img-fluid">
						<div class="row">
							<div class="user-info col-md-8">
								<%
								Userdao ud = new Userdao(ConnectionProvider.getConnection());
								%>

								<p class="post-user-info">
									<a href="#!"> <%=ud.getUserByUserId(p.getUserId()).getUname()%></a>
									has posted :
								</p>

							</div>
							<div class="post-date col-md-4">
								<p><%=DateFormat.getDateTimeInstance().format(p.getpDate())%></p>
							</div>
						</div>

						<p class="post-content"><%=p.getpContent()%></p>
						<div class="post-code">
							<pre><%=p.getpCode()%></pre>
						</div>

					</div>
					<div class="card-footer card-color text-center">


						<%
						LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
						%>

						<a href="#!" onclick="doLike(<%=p.getpId()%>,<%=user.getId()%>)"
							class="btn btn-outline-light btn-sm"> <i
							class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%=ld.countLikeOnPost(p.getpId())%></span>
						</a> <a href="#!" class="btn btn-outline btn-sm "> <i
							class="fa fa-commenting-o"></i> <span>20</span>
						</a>



					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- 	main body end -->

	<!--profile Modal -->
	<div class="modal fade" id="Profile-Modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-primary text-white">
					<h1 class="modal-title fs-5 " id="exampleModalLabel">Skylight-vlog</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="pics/<%=user.getProfile()%>" class="img-fluid"
							style="border-radius: 50%; max-width: 150px;">
						<h1 class="modal-title fs-5 " id="exampleModalLabel"><%=user.getUname()%>
						</h1>
						<div id="profile-details">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row">Id :</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><%=user.getUemail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getUgender().toUpperCase()%></td>

									</tr>
									<tr>
										<th scope="row">Status :</th>
										<td><%=user.getUabout()%></td>

									</tr>
									<tr>
										<th scope="row">Date :</th>
										<td><%=user.getRdate()%></td>

									</tr>

								</tbody>
							</table>
						</div>
						<div id="profile-edit" style="Display: none;">
							<h3 class="mt-2">Please Edit Carefully!</h3>
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">

									<tr>
										<td>Id</td>
										<td><%=user.getId()%></td>
									</tr>

									<tr>
										<td>Name</td>
										<td><input name="user_name" type="text"
											class="form-control" value="<%=user.getUname()%>"></td>
									</tr>

									<tr>
										<td>Email</td>
										<td><input name="user_email" type="text"
											class="form-control" value="<%=user.getUemail()%>"></td>
									</tr>

									<tr>
										<td>Password</td>
										<td><input name="user_password" type="text"
											class="form-control" value="<%=user.getUpassword()%>"></td>
									</tr>



									<tr>
										<td>Gender :</td>
										<td><%=user.getUgender().toUpperCase()%></td>

									</tr>
									<tr>
										<td>About :</td>
										<td><textarea name="text_area" class="form-control"
												rows="2"><%=user.getUabout()%></textarea></td>

									</tr>
									<tr>
										<td>change profile:</td>
										<td><input name="profile_pic" type="file"
											class="form-control" value="<%=user.getProfile()%>"></td>
									</tr>





								</table>
								<div class="container text-center">
									<button class="btn btn-outline-primary">Save</button>
								</div>


							</form>



						</div>




					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end of profile modal -->



	<!-- add post modal-->


	<!-- Modal -->
	<div class="modal fade" id="Add-post" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Add Post</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="add-post-form" action="AddPostServlet" method="post">

						<div class="form-group">
							<label>Select Category</label> <select class="form-control"
								name="cid">

								<option selected="selected" disabled="disabled">---Select
									category---</option>
								<%
								PostDao postd = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = postd.getallCategories();
								for (Category c : list) {
								%>
								<option value=<%=c.getcId()%>><%=c.getcName()%></option>
								<%
								}
								%>
							</select>
						</div>



						<div class="form-group mt-2">
							<label>Post Title</label> <input name="pTitle" type="text"
								class="form-control" placeholder="Enter title here">
						</div>

						<div class="form-group mt-2">
							<label>Write Content</label>
							<textarea name="pContent" rows="3" class="form-control"></textarea>
						</div>

						<div class="form-group mt-2">
							<label>Write Code(if any)</label>
							<textarea name="pCode" rows="3" class="form-control"></textarea>
						</div>

						<div class="form-group mt-2">
							<label>Select Image For Title</label> <input name="pic"
								type="file" class="form-control">
						</div>
						<div class="container text-center mt-2">
							<button type="submit" class="btn btn-outline-primary">Post
							</button>
						</div>

					</form>


				</div>

			</div>
		</div>
	</div>

	<!-- End of post modal -->


	<!-- javascript -->




	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="myjs/myjs.js" type="text/javascript"></script>


	<script>
		$(document).ready(function() {
			let editStatus = false;

			$('#edit-profile-btn').click(function() {
				//alert("button clicked");
				if (editStatus == false) {
					$('#profile-details').hide()
					$('#profile-edit').show()
					editStatus = true;
					$(this).text('Back')
				} else {
					$('#profile-details').show()
					$('#profile-edit').hide()
					editStatus = false;
					$(this).text('Edit')
				}
			});

		});
	</script>

	<!--now add post js-->
	<script>
		$(document)
				.ready(
						function(e) {
							//
							$("#add-post-form")
									.on(
											"submit",
											function(event) {
												//this code gets called when form is submitted....
												event.preventDefault();
												console
														.log("you have clicked on submit..");
												let form = new FormData(this);

												//now requesting to server
												$
														.ajax({
															url : "AddPostServlet",
															type : "POST",
															data : form,
															success : function(
																	data,
																	textStatus,
																	jqXHR) {
																//success ..
																console
																		.log(data);
																if (data.trim() == "done") {
																	swal(
																			"Good job!",
																			"saved successfully",
																			"success");
																} else {
																	swal(
																			"Error!!",
																			"Something went wrong try again...",
																			"error");
																}
															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {
																//error..
																swal(
																		"Error!!",
																		"Something went wrong try again...",
																		"error");
															},
															processData : false,
															contentType : false,
														});
											});
						});
	</script>
</body>
</html>