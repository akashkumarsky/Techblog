<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
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
	clip-path: polygon(49% 8%, 100% 1%, 88% 53%, 99% 100%, 48% 92%, 0 100%, 14% 51%, 3%
		0);
}

.banner-back {
	clip-path: polygon(28% 0, 71% 0, 100% 41%, 75% 100%, 25% 100%, 0% 50%);
}
</style>
</head>
<body>
	<%@ include file="Normal_navbar.jsp"%>
	<main class="d-flex align-items-center bg-primary mb-5 banner-back">
		<div class="container ">
			<div class="row ">
				<div class="col-md-6 offset-md-3">
					<div class="card">
						<div
							class="card-header bg-primary text-white text-center banner-background m-0 ">
							<span class="fa fa-user-plus fa-3x"></span>
							<p>SignUp Here</p>
						</div>
						<div class="card-body">
							<form id="reg-form" action="RegisterServlet" method="post">

								<div class="mb-3">
									<label for="exampleInputuser" class="form-label">User
										Name</label> <input name="uname" type="text" class="form-control"
										id="exampleInputuser">
								</div>
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Email
										address</label> <input name="uemail" type="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp">
									<div id="emailHelp" class="form-text">We'll never share
										your email with anyone else.</div>
								</div>
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Password</label>
									<input name="upassword" type="password" class="form-control"
										id="exampleInputPassword1">
								</div>

								<div class="mb-3">
									<label for="Gender" class="form-label">Select Gender </label><br>
									<input type="radio" name="ugender" value="male"> male <input
										type="radio" id="ugender" name="ugender" value="female">
									female
								</div>

								<div class="form-group mb-2">
									<textarea name="uabout" rows="2" class="form-control">please write about yourself!</textarea>

								</div>


								<div class="mb-3 form-check">
									<input name="check" type="checkbox" class="form-check-input"
										id="exampleCheck1" value="check"> <label
										class="form-check-label" for="exampleCheck1">Accept
										all terms & conditions.</label> <br>

									<div class="container text-center" id="loader"
										style="display: none;">
										<span class="fa fa-refresh fa-spin fa-4x"></span>
										<h4>Please wait..</h4>
									</div>
								</div>
								<button id="sumbimt-btn" type="submit" class="btn btn-primary">Submit</button>
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script>
	  $(document).ready(function () {
          console.log("loaded........")

          $('#reg-form').on('submit', function (event) {
              event.preventDefault();



              let form = new FormData(this);

              $("#sumbimt-btn").hide();
              $("#loader").show();
              //send register servlet:
              $.ajax({
                  url: "RegisterServlet",
                  type: 'POST',
                  data: form,
                  success: function (data, textStatus, jqXHR) {
                      console.log(data)

                      $("#sumbimt-btn").show();
                      $("#loader").hide();

                      if (data.trim() === 'done')
                      {

                          swal("Registered successfully..We are going to redirect to login page")
                                  .then((value) => {
                                      window.location = "login.jsp"
                                  });
                      } else
                      {

                          swal(data);
                      }

                  },
                  error: function (jqXHR, textStatus, errorThrown) {
                      $("#sumbimt-btn").show();
                      $("#loader").hide();
                      swal("something went wrong..try again");

                  },
                  processData: false,
                  contentType: false

              });



          });


      });


	
	
	</script>
</body>
</html>