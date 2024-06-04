<%@page import="java.util.List"%>
<%@page import="com.example.model.ServicesMod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../head.jsp"></jsp:include>

<script>
		
		
		   function confirm_delete(serviceId) {
               let ans = confirm("Do you want to delete this record?");
                  if (ans) {
                      window.location = "/YesManApp/DeleteServiceServlet?serviceId=" + serviceId;
   }
 }

</script>
</head>
<body>
	<jsp:include page="../adminheader.jsp"></jsp:include>
	<jsp:include page="../adminnav.jsp"></jsp:include>



	<div class="container mt-3" style="margin-bottom: 10rem">


		<%
		ServicesMod service = new ServicesMod();
		List<ServicesMod> serviceList = service.getAllServices(null);
		System.out.println("serviceList=" + serviceList.size());
		%>

		<%
		String res = request.getParameter("res");
		if (res != null) {
			if (res.equals("1")) {
		%>
		<div class="alert alert-success alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong>Order Status Updated.
		</div>
		<%
		} else if (res.equals("0")) {
		%>
		<div class="alert alert-danger alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Failed!</strong>Order Status not Updated.
		</div>
		<%
		}
		}
		%>
		<h2 class="text-center">
			<u>View Services</u>
		</h2>
		<br />
		<div class="table-responsive">
			<table class="table table-striped table-info table-hover"
				id="table_id">
				<thead class="table-warning">
					<tr>

						<th>Slno</th>
						<th>ServiceId</th>
						<th>ServiceName</th>
						<th>ServicePic</th>
						<th>Operation</th>
						<th>ServicePic</th>
					</tr>
				</thead>
				<tbody>
					<%
					int slno = 0;
					for (ServicesMod serviceOb : serviceList) {
						slno++;
					%>
					<tr>


						<td><%=slno%></td>
						<td><%=serviceOb.getServiceId()%></td>
						<td><%=serviceOb.getServiceName()%></td>


						<td><a
							href='EditServicePic.jsp?tableName=services&setColName=servicepic&whereColName=serviceId&conditionValue=<%=serviceOb.getServiceId()%>&colName=servicePic'>
								<img
								src='../uploads/<%=serviceOb.getServicePic()%>'
								style='width: 80px; height: 80px' />
								
								
						</a></td>
						<td>
						
						
						
						<input type="button" class="btn btn-sm btn-info bg-danger text-white"
							onclick="confirm_delete(<%=serviceOb.getServiceId()%>)"
							value="Delete" /></td>
							
							
						<td>
						
						
									<a href='/YesManApp/Admin/EditServices.jsp?serviceId=<%=serviceOb.getServiceId()%>'>
							<i class="bi bi-pencil-square" style="font-size:2rem" ></i></a>
						
						
						
						
						</td>

					</tr>
						<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$('#table_id').DataTable();
			
			$('#success_id').slideUp(3000);
		});
	</script>














	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>