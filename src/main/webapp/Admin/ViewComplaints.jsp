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
			ComplainsMod reviews = new ComplainsMod();
					
				
			List<ComplainsMod> reviewList = reviews.getAllComplaints();
					%>




			<div class="col-sm-12">
				<h1 class="text text-center bg-dark text-white">Reviews</h1>
				<div class='table-responsive'>
					<table class="table mt-5 table-bordered table-hover" id='table_id'>
						<thead class='table table-info'>
							<tr>
								<th scope="col">SLNO</th>
								<th scope="col">Complaint Id</th>
								<th scope="col">UserId</th>
								<th scope="col">Worker Id</th>
								<th scope="col">Complaint Text</th>
								<th scope="col">ComplaintDate</th>
								


							</tr>
						</thead>
						<tbody class='table  table-secoundary'>
							<%
							int slno = 0;

							for (ComplainsMod revOb : reviewList) {
							%>
							<tr>
								<td class="text-center"><%=slno++%></td>
								<td class="text-center"><%=revOb.getComplaintId() %></td>
								<td class="text-center"><%=revOb.getUserId()%></td>
								<td class="text-center"><%=revOb.getWorkerId()%></td>
								<td class="text-center"><%=revOb.getComplaintText()%></td>
								<td class="text-center"><%=revOb.getComplaintDate()%></td>

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