<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
  <link rel="stylesheet" href="<c:url value="/css/main3.css"/>" media="screen" >
	
	
    <script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
	<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css'>
		<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
		 <script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js'></script>
       <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Roboto:400,700'>
        <link rel=stylesheet href=https://use.fontawesome.com/releases/v5.6.3/css/all.css integrity=sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/ crossorigin=anonymous>
	
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart Page</title>
</head>
<body>
 <nav class='navbar navbar-inverse'>
				  <div class='container-fluid'>
				     <a class="navbar-brand" href="home"><img src="<c:url value="/css/images/coronapic.png" />" height="28" alt="Corona"></a>
				    <ul class='nav navbar-nav'>
				    
				     <li><a href="home">Home</a></li>
				      <li><a href="user">Add User</a></li>
					  <li ><a class='active' href="showproductstoadd">Products</a></li>
				     
				    </ul>
				   <ul class='nav navbar-nav navbar-right'>
				     
				      <li><a href="home"> Login</a></li>
				    </ul>
				  </div>
				</nav>
	<div class="container">		
	<h2 style='text-align:center;color:white !important'>Corona Prevention Kit</h2>
	
	<br>
	<br>
	
	<table  class="table">
		<tr>
			<th>Option</th>
			
			<th>Name</th>
			<th>Photo</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Sub Total</th>
		</tr>
		<c:set var="total" value="0"></c:set>
		<c:forEach var="item" items="${sessionScope.cart }">
			<c:set var="total"
				value="${total + item.pt.pcost * item.quantity }"></c:set>
			<tr>
				<td ><a style="text-decoration:none;color:white;"
					href="${pageContext.request.contextPath }/products/remove/${item.pt.pid }"
					onclick="return confirm('Are you sure?')">Remove</a></td>
				
				<td>${item.pt.pname }</td>
				<td><img 
					width="100" height="100" src="${pageContext.request.contextPath }/products/getProductPhoto/<c:out value='${item.pt.pid}'/>"></td>
				<td>$ ${item.pt.pcost }</td>
				<td>${item.quantity }</td>
				<td>$ ${item.pt.pcost* item.quantity }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="6" align="right"><strong>Total</strong></td>
			<td>$ ${total }</td>
		</tr>
	</table>
	
	<br>
	<center>
	<div class="row">
	<a align="center" class="butn" style="text-decoration:none;color:white;" href="${pageContext.request.contextPath }/products/showproductstoadd">Continue
		Shopping</a>
		&nbsp;&nbsp;&nbsp;
	<a class="butn" style="text-decoration:none;color:white;" href="${pageContext.request.contextPath }/products/placeorder">Place Order</a>
</div>
</center>
</div>
</body>
</html>