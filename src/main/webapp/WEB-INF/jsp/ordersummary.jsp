<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<c:url value="/css/main5.css"/>" media="screen" >
<link rel="stylesheet" href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>">
<title>Order  Summary</title>
</head>
<body>

<h2 style="color:white;text-align:center;">Order Summary</h2>
<p style="color:white;text-align:center;">Here is your order details</p>
<div class="row">
  <div class="col-75">
    <div class="container">
      <form>
      
        <div class="row">
          <div class="col-50">
            <h3>Billing & Shipping Address</h3>
            <label for="fname"><i class="fa fa-user"></i> Full Name</label>
            ${fname}
            <label for="email"><i class="fa fa-envelope"></i> Email</label>
            ${email}
           
            <label for="address"><i class="fa fa-address-card-o"></i> Address</label>
           ${address}
            <label for="city"><i class="fa fa-institution"></i> City</label>
           ${city}
            <div class="row">
              <div class="col-50">
                <label for="state">State</label>
              ${state}
              </div>
              <div class="col-50">
                <label for="zip">Zip</label>
                ${zip}
              </div>
            </div>
          </div>

         
          
        </div>
        
       
      </form>
    </div>
  </div>
  <div class="col-25">
    <div class="container">
      <h4>Cart Information<span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> </span></h4>
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
   <a href="home" class="btn">Return Home? Click Here </a>
</div>

</body>
</html>
    