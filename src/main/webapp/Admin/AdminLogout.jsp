<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Logged Out</title>
    <jsp:include page="../head.jsp"></jsp:include>
    <style>
        body {
            background-image: url("");
            background-repeat: no-repeat;
            background-size: cover;
            color: #333; /* Changed dark to #333 for better readability */
            min-height: 100%; /* Use min-height instead of height */
        }
        /* Adjust styles for better readability */
        .container {
            margin-top: 5%;
        }
        h1 {
            color: green; /* Changed black to green */
            font-weight: bold; /* Corrected the typo in font-weight */
        }
        .btn {
            margin-top: 20px; /* Added margin-top to the button for spacing */
        }
    </style>
</head>
<body>
<jsp:include page="../adminheader.jsp"></jsp:include>

<%
    session.invalidate();
%>
<div class="container">
    <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-6 mt-5">
            <h1>You have been successfully logged out</h1>
            <span>Thank you for choosing us.....</span><br><br><br>
            <button type="button" class="btn btn-outline-danger float-left" onclick="window.location.href='../index.jsp'">Back to Index Page</button>
        </div>
        <div class="col-sm-3"></div>
    </div>
</div>

</body>
</html>
