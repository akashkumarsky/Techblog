<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>

<%@page import="com.tech.blog.dao.PostDao"%>
<div class="row">

	<%
	
	
	
	
User uuu=(User)session.getAttribute("currentUser");

PostDao d =new PostDao(ConnectionProvider.getConnection());
int cid =Integer.parseInt(request.getParameter("cid"));
List <Post> posts=null;
if(cid==0){
 posts = d.getallPosts(); 
}
else{
	posts=d.getPostByCatId(cid);
}
if(posts.size()==0){
	out.println("<div class ='container text-center '  ><h2 class ='display-3'> Sorry! No Posts Here</h2> </div>");
	return;
}
for(Post p :posts){
	
	%>
	
	
	<div class="col-md-4 mt-4">
		<div class="card">
			<div class="card-header bg-primary text-white">
				<h4 class="post-title"><%= p.getpTitle() %></h4>
			</div>
			<img src="blog_pics/<%= p.getpPic() %>" class="img-fluid">
			<div class="card-body">

				
				<p><%=p.getpContent() %></p>

			</div>
			<div class="card-footer bg-primary text-center">
				<% 
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                %>

				<a href="#!" onclick="doLike(<%= p.getpId()%>,<%= uuu.getId()%>)"
					class="btn btn-outline-light btn-sm"> <i
					class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getpId())%></span>
				</a> <a href="show_blog_page.jsp?post_id=<%= p.getpId() %>"
					class="btn btn-outline-light btn-sm">Read More...</a> <a href="#!"
					class="btn btn-outline-light btn-sm"> <i
					class="fa fa-commenting-o"></i> <span>20</span>
				</a>
			</div>

		</div>

	</div>

	<%
}
%>
</div>