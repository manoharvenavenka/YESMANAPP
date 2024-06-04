<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<jsp:include page="../head.jsp"></jsp:include>
<style>

     body{
            background-image: url("");
            background-repeat: no-repeat;
            background-size: cover;
            color: dark;
            height:100%; /* Use min-height instead of height */
        
            
        }
</style>
</head>
<body>


</head>
<body>
<jsp:include page="../custheader.jsp"></jsp:include>

	<%
	session.invalidate();
	%>
	<div class="container" id="m">
				<div class="row">
				<div class="col-sm-3">
				<br>
				<br>
				</div>
				<div class="col-sm-6 mt-5" >

				<h1 style="black: green;text=bold;">You have been successfully logged out</h1>
				<span>Thank you for choosing us.....</span><br><br><br>

				<button type="button" class="btn btn-outline-danger float-left"
				onclick="window.location.href='../index.jsp'">Back to Index
				page</button>
				
				
				</div>
				<div class="col-sm-3">
				<br>
				<br>
				</div>
			
			</div>
			</div>
	
</body>

</html>