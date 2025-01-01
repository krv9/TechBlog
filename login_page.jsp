<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.techblog.entities.Message" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login_page</title>

<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css">
<!-- Font Awesome (updated version) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

</head>
<body>

<%@include file="normal_navbar.jsp" %>


<main class="d-flex align-items-center" style="height:75vh">
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				
				<div class="card">
				
					<div class="card-header primary-bg text-white text-center">
						<p><i class="fa-solid fa-user" style="color: #f1f2f3;"></i> Login @ Here</p>
					</div>
					<%
					Message m=(Message)session.getAttribute("msg");
					if(m!=null){
						%>
						<div class="alert <%=m.getCssClass() %>" role="alert">
						<%= m.getMessage() %>
						</div>
						<%
						session.removeAttribute("msg");
					}
					%>
					<div class="card-body">
						<form action="loginservlet" method="POST">
							  <div class="mb-3">
							    <label for="exampleInputEmail1" class="form-label">Email address</label>
							    <input type="email"  name="email" required class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
							    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
							  </div>
							  <div class="mb-3">
							    <label for="exampleInputPassword1" class="form-label">Password</label>
							    <input type="password" name="password" required class="form-control" id="exampleInputPassword1">
							  </div>
							  <div class="container text-center">	
							   <button type="submit" class="btn primary-bg text-light">Submit</button>
							  </div>
						</form>
					</div>
				</div>
				
			</div>
		</div>

	</div>
</main>

<!-- Bootstrap 5 JS (no jQuery required) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/index.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

</body>
</html>