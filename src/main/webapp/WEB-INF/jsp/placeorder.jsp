<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<c:url value="/css/main5.css"/>" media="screen" >
<title>Place Order</title>
</head>
<body>
<h2>Order Form</h2>
<p>Fill in the your personal information</p>
<div class="row">
  <div class="col-75">
    <div class="container">
      <form action="order" method="post">
      
        <div class="row">
          <div class="col-50">
            <h3>Billing Address</h3>
            <label for="fname"><i class="fa fa-user"></i> Full Name</label>
            <input type="text" id="fname" name="fname" placeholder="John M. Doe">
            <label for="email"><i class="fa fa-envelope"></i> Email</label>
            <input type="text" id="email" name="email" placeholder="john@example.com">
            <label for="address"><i class="fa fa-address-card-o"></i> Address</label>
            <input type="text" id="address" name="address" placeholder="542 W. 15th Street">
            <label for="city"><i class="fa fa-institution"></i> City</label>
            <input type="text" id="city" name="city" placeholder="New York">

            <div class="row">
              <div class="col-50">
                <label for="state">State</label>
                <input type="text" id="state" name="state" placeholder="NY">
              </div>
              <div class="col-50">
                <label for="zip">Zip</label>
                <input type="text" id="zip" name="zip" placeholder="10001">
              </div>
            </div>
          </div>

          
          
        </div>
        <label>
          <input type="checkbox" checked="checked" name="sameadr"> Shipping address same as billing
        </label>
        <input type="submit" value="Continue to checkout" class="btn">
      </form>
    </div>
  </div>
  <div class="col-25">
    <div class="container">
      <h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> </span></h4>
      <c:forEach var="item" items="${sessionScope.cart }">
			<c:set var="total"
				value="${total + item.pt.pcost * item.quantity }"></c:set>
			
				
				
			<p>${item.pt.pname } <span class="price">	$ ${item.pt.pcost }</span>
      <p>Quantity : <span class="price">${item.quantity }</span></p><p>Sub Total: <span class="price">$ ${item.pt.pcost* item.quantity }</span></p>
		</c:forEach>
		
			
			
		
      
      
      <hr>
      <p>Total <span class="price" style="color:black"><b>$ ${total }</b></span></p>
    </div>
  </div>
</div>

</body>
</html>