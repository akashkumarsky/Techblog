<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@ page errorPage="error_page.jsp"%>


<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>profile</title>
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
body {
	background: url(img/4.jpg);
	background-size: cover;
	background-attachment: fixed;
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


	<%
	Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%>" role="alert">
		<%=m.getContent()%>
	</div>
	<%
	session.removeAttribute("msg");
	}
	%>
	<!-- Start of body -->
	<main>
		<div class="container-fluid">
			<div class="row mt-4">
				<div class="col-md-2">
					<div class="list-group">
						<a href="#" onclick="getPosts(0,this)"class=" c-link list-group-item list-group-item-action active"
							aria-current="true"> All Post </a>

						<!--  categeries form db -->
						<%
						PostDao d = new PostDao(ConnectionProvider.getConnection());
						ArrayList<Category> list1 = d.getallCategories();

						for (Category cc : list1) {
						%>
						<a href="#" onclick="getPosts(<%= cc.getcId() %>,this)" class=" c-link list-group-item list-group-item-action"><%=cc.getcName()%></a>
						<%
						}
						%>


					</div>
				</div>
				<div class="col-md-10">
					<div class="contanier text-center" id="loader">
						<i class="fa fa-refresh fa-4x fa-spin"></i>
						<h3 class="mt-2">Loading.......</h3>
					</div>
					 <div class="container-fluid" id="post-container">
					 
					 </div>

				</div>
			</div>
		</div>
	</main>





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
  $(document).ready(function (e) {
    //
    $("#add-post-form").on("submit", function (event) {
      //this code gets called when form is submitted....
      event.preventDefault();
      console.log("you have clicked on submit..");
      let form = new FormData(this);

      //now requesting to server
      $.ajax({
        url: "AddPostServlet",
        type: "POST",
        data: form,
        success: function (data, textStatus, jqXHR) {
          //success ..
          console.log(data);
          if (data.trim() == "done") {
            swal("Good job!", "saved successfully", "success");
          } else {
            swal("Error!!", "Something went wrong try again...", "error");
          }
        },
        error: function (jqXHR, textStatus, errorThrown) {
          //error..
          swal("Error!!", "Something went wrong try again...", "error");
        },
        processData: false,
        contentType: false,
      });
    });
  });
</script>
 <!--loading post using ajax-->
        <script>
	function getPosts(catId,temp){
		$("#loader").show();
		$("#post-container").hide();
		$(".c-link").removeClass('active');
		
		 $.ajax({
         	url:"load_posts.jsp",
         	data:{cid:catId},
         	 success: function (data, textStatus, jqXHR) {
                  //success ..
                  console.log(data);
                  $("#loader").hide();
                  $("#post-container").show();
                  $("#post-container").html(data);
                  $(temp).addClass("active");
         	 }
         });
		
	}
           

            $(document).ready(function (e) {
            	let allPostRef =$(".c-link")[0];
            	
			getPosts(0,allPostRef);
               

            });
        </script>



</body>
</html>