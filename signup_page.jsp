<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>

<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css">
<!-- Font Awesome (updated version) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


<!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
<%@include file="normal_navbar.jsp" %>

<main  style="padding-top:1rem;">

	<div class="container">
		
		<div class="col-md-4 offset-md-4">
			<div class="card " >
				
				<div class="card-header primary-bg text-center text-white">
					Sign Up <i class="fa-solid fa-user-plus" style="color: #f3f4f7;"></i> 
				</div>
				<div class="card-body">
				
				</div>
						<form action="signupservlet" id="signup-form" method="POST">
							  <div class="mb-3">
							    <label for="name" class="form-label">User Name</label>
							    <input name="name" type="text" class="form-control" placeholder="Name" id="name" aria-describedby="name">
							  </div>
							  <div class="mb-3">
							    <label for="Gender"  class="form-label">Select your Gender</label>
							    <br>
							    <input type="radio" name="gender" id="gender" value="male">Male	
							    <input type="radio" name="gender"  id="gender" value="female">Female
							    <input type="radio" name="gender" id="gender" value="other">Other						    
							  </div>
							  <div class="mb-3">
							    <label for="exampleInputEmail1"  class="form-label">Email address</label>
							    <input type="email"name="email" class="form-control" placeholder="Email" id="exampleInputEmail1" aria-describedby="emailHelp">
							  </div>
							  <div class="mb-3">
							    <label for="exampleInputPassword1" class="form-label">Password</label>
							    <input type="password" name="password" class="form-control" placeholder="Password" id="exampleInputPassword1">
							  </div>
							  <div class="form-group">
                                    <textarea name="about"  name="about" class="form-control" id=""  rows="5" placeholder="Enter something about yourself"></textarea>                     
                                </div>
							  <div class="mb-3 form-check">
							    <input name="check" type="checkbox" class="form-check-input" value="accepted" id="exampleCheck1">
							    <label class="form-check-label" for="exampleCheck1">I agree terms & conditions.</label>
							  </div>
							  <div class="container text-center">
							  		<button type="submit" class="btn primary-bg text-light">Submit</button>
							  </div>
						</form>				
			</div>
		</div>
		
	</div>

</main>


<!-- Bootstrap 5 JS (no jQuery required) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/index.js" type="text/javascript"></script>


<script>
$(document).ready(function(){
	console.log("loaded");

	$('#signup-form').on('submit', function(event){
		event.preventDefault();

		let form = new FormData(this);

		// Send to signup servlet
		$.ajax({
			url: "signupservlet",
			type: 'POST',
			data: form,
			processData: false,
			contentType: false,
			success: function(data, textStatus, jqXHR){
				console.log(data);
				
				// Success alert using SweetAlert
				Swal.fire({
					icon: 'success',
					title: 'Success!',
					text: 'User registered successfully.',
					showConfirmButton: false,
					timer: 3000 // Auto close after 2 seconds
				}).then(() => {
					// Optional: Redirect to another page after success
					window.location.href = 'login_page.jsp'; // Change this if needed
				});
			},
			error: function(jqXHR, textStatus, errorThrown){
				console.log(jqXHR);
				
				// Error alert using SweetAlert
				Swal.fire({
					icon: 'error',
					title: 'Oops...',
					text: 'Error in registering user. Please try again!',
				});
			}
		});
	});
});
</script>


</body>
</html>