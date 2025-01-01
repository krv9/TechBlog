<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.techblog.entities.user" %>
<%@ page import="com.techblog.entities.category" %>
<%@ page import="com.techblog.dao.post_dao" %>
<%@ page import="com.techblog.helper.ConnectionProvider" %>
<%@ page errorPage="errorpage.jsp" %>


<%
    user user = (user) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark primary-bg ">
        <div class="container-fluid text-white">
            <a class="navbar-brand text-light" href="index.jsp"><i class="fa-brands fa-microblog"></i> Tech Blog</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link text-light" href="#"><i class="fa-solid fa-graduation-cap"></i> Learn Code</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdown" data-bs-toggle="dropdown">
                            <i class="fa-solid fa-layer-group"></i> Categories
                        </a>
                        <ul class="dropdown-menu primary-bg ">
                            <li><a class="dropdown-item text-light" href="#">Core Java</a></li>
                            <li><a class="dropdown-item text-light" href="#">Advance Java</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light" href="#" data-bs-toggle="modal" data-bs-target="#addpost-modal"><i class="fa-regular fa-address-card"></i> AddPost</a>
                    </li>
                </ul>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link text-light" href="#!"><i class="fa-regular fa-user"></i> <%= user.getName() %></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light" href="LogoutServlet"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <!-- Main Body of profile page -->
    
    <main>
    	<div class="container">
    			<div class="row mt-4">
    				
	    				<div class="col-md-4">
							   	 <div class="list-group">
							        <!-- Default link for all posts -->
							        <a href="#" onclick="getposts('')" class="list-group-item list-group-item-action active" aria-current="true">
							            All Posts
							        </a>
							        <!-- Dynamically generated category links -->
							        <%
							        post_dao dao = new post_dao(ConnectionProvider.getConnection());
							        ArrayList<category> list1 = dao.getAllCategories();
							        for (category cc : list1) {
							        %>
							        <a href="#" 
							           onclick="getposts('<%= cc.getCid() %>')" 
							           class="list-group-item list-group-item-action">
							            <%= cc.getName() %>
							        </a>
							        <%
							        }
							        %>
							    </div>
						</div>

    				
    				<div class="col-md-8" id="post-container">
    				
	    				<div class="container text-center" id="loader">
	    				
	    						<i class="fa fa-refresh fa-4x fa-spin"></i>
	    						<h3 class="mt-2">Loading...</h3>
	    				
	    				</div>
	    				
    				</div>
    				
    			</div>
    	</div>
    </main>
    
    <!-- End of Main Body of profile page -->

    <!-- Post Modal -->
    <div class="modal fade" id="addpost-modal" tabindex="-1" aria-labelledby="addPostLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header primary-bg text-white">
                    <h5 class="modal-title" id="addPostLabel">Add your Blog!</h5>
                    <button type="button" class="btn-close btn-light" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="post-form" enctype="multipart/form-data">
                        <div class="form-group mb-3">
                            <select class="form-control" name="cid" required>
                                <option value="" disabled selected>Select category</option>
                                <% 
                                    post_dao postd = new post_dao(ConnectionProvider.getConnection());
                                    ArrayList<category> list = postd.getAllCategories();
                                    for (category c : list) {
                                %>
                                <option value="<%= c.getCid() %>"><%= c.getName() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="form-group mb-3">
                            <input type="text" name="ptitle" class="form-control" placeholder="Enter title for your blog" required />
                        </div>
                        <div class="form-group mb-3">
                            <textarea name="pcontent" rows="5" class="form-control" placeholder="Enter content of your blog" required></textarea>
                        </div>
                        <div class="form-group mb-3">
                            <textarea name="pcode" rows="5" class="form-control" placeholder="Enter code of your blog"></textarea>
                        </div>
                        <div class="form-group mb-3">
                            <label >Select your pic:</label>
                            <input type="file" name="ppic" id="post-pic" class="form-control" required />
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-outline-primary">Post</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap & jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

    <!-- JavaScript for AJAX -->
    <script>
        $(document).ready(function () {
            $('#post-form').on('submit', function (event) {
                event.preventDefault();
                console.log("you have clicked on submit..")
                let form = new FormData(this);
                $.ajax({
                    url: 'addpostservlet',
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        //success ..
                        console.log(data);
                        if (data.trim() == 'done')
                        {
                            swal("Good job!", "saved successfully", "success");
                        } else
                        {
                            swal("Error!!", "Something went wrong try again...", "error");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        //error..
                        swal("Error!!", "Something went wrong try again...", "error");
                    },
                    processData: false,
                    contentType: false
                })
            })
        })
    </script>
    
    <!-- loading post through AJAX -->
    <script >
    function getposts(catid) {
    	
        console.log("Category ID sent to server:", catid); // Debugging
        $.ajax({
            url: "load_posts.jsp",
            data: { cid: catid },
            success: function (data) {
                console.log("Response from server:", data); // Debugging
                $("#loader").hide();
            	$('#post-container').show();
                $('#post-container').html(data);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.error("Error loading posts:", errorThrown);
            }
        });
    }


    $(document).ready(function(e){
	getposts()
    })
    </script>
    
</body>
</html>
