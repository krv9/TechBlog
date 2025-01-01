<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %> <!-- Ensures this is an error page -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sorry, Something Went Wrong!</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <!-- Font Awesome (updated version) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>

    <div class="container text-center">
        <!-- Safely displaying the exception object -->
       
        <img src="img/computer.png" class="img-fluid" alt="Error image">
        <h3 class="display-3">Sorry! Something went wrong....</h3>
        <a href="index.jsp" class="btn btn-primary btn-lg text-white mt-3">Home</a>
    </div>

</body>
</html>
