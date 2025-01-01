<%@ page import="java.sql.Connection" %>
<%@ page import="com.techblog.helper.ConnectionProvider" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TechBlog</title>
<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css">
<!-- Font Awesome (updated version) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<style >
.banner-background{
clip-path: polygon(0 0, 100% 0, 100% 100%, 84% 79%, 70% 100%, 58% 79%, 43% 100%, 0 100%);
}
</style>

</head>
<body>
<!-- navbar -->
<%@ include file="normal_navbar.jsp" %>

<!-- container part starts here -->

<div class="container-fluid p-0 m-0">

<div class="jumbotron primary-bg text-white banner-background">
<div class="container text-white">
<h3 class="display-3"> Welcome to Tech Blog </h3>
<p> Tech Blog is platform where people can blog for others to enhance their knowledge from experts. </p>

<a href="signup_page.jsp" class="btn btn-outline-light"><i class="fa-solid fa-user-plus" style="color: #f2f2f2;"></i> Start it's free</a>

<a href="login_page.jsp" class="btn btn-outline-light"><i class="fa-solid fa-user fa-spin" style="color: #f2f2f2;"></i> Login</a>
<br>
</div>
</div>

</div>

<!--Cards  -->
<br>
<div class="container">

<div class="row mb-3">
	<div class="col-md-4">
		<div class="card" >
  			<div class="card-body">
    			<h5 class="card-title">Java Programming</h5>
    			<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
   				<a href="#" class="btn text-white" id="bg-btn">Read more</a>
  			</div>
		</div>
	</div>
	<div class="col-md-4">
		<div class="card" >
  			<div class="card-body">
    			<h5 class="card-title">Java Programming</h5>
    			<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
   				<a href="#" class="btn text-white" id="bg-btn">Read more</a>
  			</div>
		</div>
	</div>
	<div class="col-md-4">
		<div class="card" >
  			<div class="card-body">
    			<h5 class="card-title">Java Programming</h5>
    			<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
   				<a href="#" class="btn text-white" id="bg-btn">Read more</a>
  			</div>
		</div>
	</div>
</div>


<div class="row mb-3">
	<div class="col-md-4">
		<div class="card" >
  			<div class="card-body">
    			<h5 class="card-title">Java Programming</h5>
    			<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
   				<a href="#" class="btn text-white" id="bg-btn">Read more</a>
  			</div>
		</div>
	</div>
	<div class="col-md-4">
		<div class="card" >
  			<div class="card-body">
    			<h5 class="card-title">Java Programming</h5>
    			<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
   				<a href="#" class="btn text-white" id="bg-btn">Read more</a>
  			</div>
		</div>
	</div>
	<div class="col-md-4">
		<div class="card" >
  			<div class="card-body">
    			<h5 class="card-title">Java Programming</h5>
    			<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
   				<a href="#" class="btn text-white" id="bg-btn">Read more</a>
  			</div>
		</div>
	</div>
</div>


</div>

<!-- Bootstrap 5 JS (no jQuery required) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="js/index.js" type="text/javascript"></script>
</body>
</html>
