<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>User Login Page</title>
	 <link rel="stylesheet" href="<c:url value="/css/style.css"/>" >
	
	<link rel="stylesheet" href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>">
</head>
<body>
	<!-- Main Content -->
	
		<div class="container-fluid">
	
	
		<div class="row main-content ">
			<div class="col-sm-5 company__info">
				<a href=""></a>
			</div>
			  <div class="col-sm-7 login_form ">
				<div class="container-fluid input_form">
					<div class="row">
						<h2 style="text-align:center;">User Log In</h2>
					</div>
				
					<div class="row">
						<form action="logins" class="form-group">
							<div class="row">
								<input type="text" name="username" id="username" class="form__input" placeholder="Username">
							</div>
							<div class="row">
								
								<input type="password" name="password" id="password" class="form__input" placeholder="Password">
							</div>
							
							<div class="row">
								<input type="submit" value="Submit" class="btn">
							</div>
						</form>
					</div>
					<div class="row">
						<p style="text-align:center;">New User? <a style="text-decoration:none" class="button" href="user">Register Here</a></p>
					</div>
				</div>
	</div>
	</div>
	</div>
	
	
	</body>
	</html>