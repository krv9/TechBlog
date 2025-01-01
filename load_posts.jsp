<%@ page import="com.techblog.dao.post_dao" %>
<%@ page import="com.techblog.helper.ConnectionProvider" %>
<%@ page import="com.techblog.entities.post" %>
<%@ page import="java.util.List" %>
<div class="container">
	    <div class="row">
	    <% 
	    Thread.sleep(1000);
	    try {
	        post_dao d = new post_dao(ConnectionProvider.getConnection());
	        String cidParam = request.getParameter("cid");
	        int cid = (cidParam != null && !cidParam.isEmpty()) ? Integer.parseInt(cidParam) : 0;
	
	        List<post> posts = (cid == 0) ? d.getAllPosts() : d.getPostByCatID(cid);
	
	        if (posts != null && !posts.isEmpty()) {
	            for (post p : posts) {
	    %>
	                <div class="col-md-6 mt-2">
	                    <div class="card">
	                        <img alt="Post Image" class="card-img-top" src="blogpics/<%= p.getPpic() != null ? p.getPpic() : "default.jpg" %>">
	                        <div class="card-body mb-2">
	                            <b><%= p.getPtitle() %></b>
	                            <p><%= p.getPcontent() %></p>
	                        </div>
	                    </div>
	                </div>
	    <%
	            }
	        } else {
	    %>
	            <p>No posts found for category <%= cid %>!</p>
	    <%
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        out.println("<p>Error loading posts. Please try again later.</p>");
	    }
	    %>
	</div>
</div>
