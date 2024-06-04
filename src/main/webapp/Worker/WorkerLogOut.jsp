<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>

<jsp:include page="../head.jsp"></jsp:include>
<style>
    body {
        background-image: url("");
        background-repeat: no-repeat;
        background-size: cover;
        color: black;
        min-height: 100vh;
    }

    #logout-container {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        height: 100%;
    }

    #logout-message {
        color: green;
        font-weight: bold;
        margin-bottom: 20px;
    }

    #logout-button {
        margin-top: 20px;
    }
</style>
</head>
<body>
<jsp:include page="../custheader.jsp"></jsp:include>

<%
    session.invalidate();
%>

<div class="container" id="logout-container">
    <div class="row">
        <div class="col-sm-12 text-center">
            <h1 id="logout-message">You have been successfully logged out</h1>
            <p>Thank you for choosing us.....</p>
            <button type="button" class="btn btn-outline-danger" id="logout-button" onclick="window.location.href='../index.jsp'">Back to Index page</button>
        </div>
    </div>
</div>

</body>    
</html>
