<%@page import="com.example.model.FeedbackMod"%>
<%@page import="com.example.model.ComplainsMod"%>
<%@page import="com.example.model.ReviewsMod"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.BookingMod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../head.jsp"></jsp:include>
<script>
		
		
		   function confirm_delete(reviewId) {
			   let ans = confirm("Do you Want To Delete Booking Review");
		       if (ans) {
		           window.location = "/YesManApp/DeleteReviewServlet?reviewId="+reviewId;
		}
		 }

</script>
</head>
<body>
<jsp:include page="../adminheader.jsp"></jsp:include>
<jsp:include page="../adminnav.jsp"></jsp:include>


	<div class="container-fluid">
		<div class="row ">


			<%
			//for vewing in the tble code 
			FeedbackMod reviews = new FeedbackMod();
					
				
			List<FeedbackMod> reviewList = reviews.getAllFeeds();
					%>




			<div class="col-sm-12">
				<h1 class="text text-center bg-dark text-white">Reviews</h1>
				<div class='table-responsive'>
					<table class="table mt-5 table-bordered table-hover" id='table_id'>
						<thead class='table table-dark'>
							<tr>
								<th scope="col">SLNO</th>
								<th scope="col">FeedBack Id</th>
								<th scope="col">UserId</th>
								<th scope="col">WebSite Service</th>
								<th scope="col">FeedBackDate </th>
								<th scope="col">FeedBack Message</th>
								


							</tr>
						</thead>
						<tbody class='table  table-dark'>
							<%
							int slno = 0;

							for (FeedbackMod revOb : reviewList) {
							%>
							<tr>
								<td class="text-center"><%=slno++%></td>
								<td class="text-center"><%=revOb.getFeedbackId() %></td>
								<td class="text-center"><%=revOb.getUserId()%></td>
								<td class="text-center"><%=revOb.getWebsiteService()%></td>
								<td class="text-center"><%=revOb.getFeedBackDate()%></td>
								<td class="text-center"><%=revOb.getFeedbackMessage()%></td>

							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>











	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>