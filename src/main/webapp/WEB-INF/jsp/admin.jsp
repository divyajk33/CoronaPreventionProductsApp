<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Products</title>
  <link rel="stylesheet" href="<c:url value="/css/main1.css"/>" >
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
 <div class="bs-example">
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <a href="home" class="navbar-brand">
            <img src="<c:url value="/css/images/coronapic.png" />" height="28" alt="Corona">
        </a>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav">
                <a href="home" class="nav-item nav-link ">Home</a>
                <a href="addProduct" class="nav-item nav-link active">Add Products</a>
                <a href="listProducts" class="nav-item nav-link">View Products</a>
                
            </div>
            <div class="navbar-nav ml-auto">
                <a href="home" class="nav-item nav-link">Login</a>
            </div>
        </div>
    </nav>
</div>
		<div class="wrapper" >
		
			<div class="inner">
			
				<form action="add"   method="post" enctype="multipart/form-data">
					<h3>Add Products</h3>
					
						<div class="form-wrapper">
							<label for="Name">Name</label>
							<input type="text" path="pname"class="form-control" name="pname">
						</div>
						
					
					<div class="form-wrapper">
						<label for="Product Cost">Cost</label>
						<input type="text" path="pcost" class="form-control" name="pcost">
					</div>
					<div class="form-wrapper">
						<label for="">Description</label>
						<input type="text" path="pdesc" class="form-control" name="pdesc">
					</div>
					 <label style ="color:#fff !important;" for="image">Select Image:</label>
					 <input type="file" path="image" name="image" >
					<br/>
					<br/>
					<button type="submit">Add </button>
				</form>
			</div>
		</div>
		
	</body>
</html>