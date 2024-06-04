<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Image</title>
    <jsp:include page="../head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../adminheader.jsp"></jsp:include>
<jsp:include page="../adminnav.jsp"></jsp:include>

<form action="/YesManApp/UploadImage" method="post" enctype="multipart/form-data">
    <div class="container mt-3 mb-5 card" style="background-color:#A259D5;">
        <div class="row">
            <div class="col-sm-12">
                <center>
                    <h1 class="text-white text-large">Edit Image</h1>
                    <input type="hidden" name="tableName" value='<%=request.getParameter("tableName") %>'>
                    <input type="hidden" name="setColName" value='<%=request.getParameter("setColName") %>'>
                    <input type="hidden" name="whereColName" value='<%=request.getParameter("whereColName") %>'>
                    <input type="hidden" name="conditionValue" value='<%=request.getParameter("conditionValue") %>'>
                </center>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                <label><i class="fa-regular fa-file-image"></i> Upload Image</label>
                <input type="file" class="form-control" name="image1">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <center>
                    <br>
                    <input type="submit" name="submit" class="form-control btn btn-md btn-outline-light p-3" style="width:150px" value="Update Image">
                    <br>
                    <br>
                </center>
            </div>
        </div>
    </div>
</form>

<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
