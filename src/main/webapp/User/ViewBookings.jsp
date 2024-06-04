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
		
		
		   function confirm_delete(bookingId) {
			   let ans = confirm("Do you Want To Update Booking");
		       if (ans) {
		           window.location = "/YesManApp/UpdateBookingStatusServlet?n=1&bookingId="+bookingId+"&status=Cancelled";
		}
		 }

</script>
</head>
<body>
	<jsp:include page="../userheader.jsp"></jsp:include>
	<jsp:include page="../UNavBar.jsp"></jsp:include>


	<div class="container-fluid">
		<div class="row ">


			<%
			//for vewing in the tble code 
			BookingMod booking = new BookingMod();
			List<BookingMod> bookinglist = booking.getAllBookings((int) session.getAttribute("userId"));
			%>




			<div class="col-sm-12">
				<h1 class="text text-center bg-success text-white">Bookings</h1>
				<div class='table-responsive'>
					<table class="table mt-5 table-bordered table-hover" id='table_id'>
						<thead class='table table-dark'>
							<tr>
								<th scope="col">SLNO</th>
								<th scope="col">Booking Id</th>
								<th scope="col">Booking Date</th>
								<th scope="col">worker Id</th>
								<th scope="col">Service Name</th>
								<th scope="col">Status</th>
								<th scope="col">Operation</th>
								<th scope="col">Rating</th>
								<th scope="col">Complaints</th>


							</tr>
						</thead>
						<tbody class='table  table-warning'>
							<%
							int slno = 0;

							for (BookingMod bookOb : bookinglist) {
							%>
							<tr>
								<td class="text-center"><%=slno++%></td>
								<td class="text-center"><%=bookOb.getBookingId()%></td>
								<td class="text-center"><%=bookOb.getBookingDate()%></td>
								<td class="text-center"><%=bookOb.getWorkerId()%></td>
								<td class="text-center"><%=bookOb.getServiceName()%></td>
								<td class="text-center"><%=bookOb.getStatus()%></td>




								<td class="text-center">
									<%
									//System.out.println("status= " + workerOb.getStatus().toString());
									if (bookOb.getStatus().toString().equalsIgnoreCase("Confirmed")) {
									%> <input type="button" class="btn btn-danger text-white"
									style="background-color: red"
									onclick="confirm_delete(<%=bookOb.getBookingId()%>)"
									value="Cancel" /> <%
 } else if (bookOb.getStatus().toString().equalsIgnoreCase("cancelled")) {
 %>

									<button class="btn btn-sm btn-success" disabled value="">
										<h6>
											<i class="bi bi-x-octagon-fill"></i>
										</h6>
									</button> <%
 } else {
 %> <i class="bi bi-person-walking" style="font-size: 1.5rem"></i><i
									class="bi bi-person-walking" style="font-size: 1.8rem"></i><i
									class="bi bi-person-walking" style="font-size: 2rem"></i> <%
 }
 %>


								</td>

								<td class="text-center">
									<%
									ReviewsMod ratin = new ReviewsMod();
									Boolean found = ratin.isRatingGiven((int) session.getAttribute("userId"), bookOb.getWorkerId());
									if (found == false) {
									%> <a
									href="/YesManApp/User/UserRating.jsp?workerId=<%=bookOb.getWorkerId()%>"
									class="btn btn-md"><h3>
											<i class="bi bi-star-half"></i>
										</h3></a> <%
 }
 %>
								</td class="text-center">
								<td>
								
								 <a
									href="/YesManApp/User/UserComplain.jsp?workerId=<%=bookOb.getWorkerId()%>"
									class="btn btn-md"><h3>
										<i class="bi bi-person-raised-hand"></i>
										</h3></a>
								</td>


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