<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>

       <meta name=viewport content=width=device-width, initial-scale=1>
	 <link rel="stylesheet" href="<c:url value="/css/main3.css"/>" media="screen" >
	
	
    <script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
	<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css'>
		<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
		 <script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js'></script>
       <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Roboto:400,700'>
        <link rel=stylesheet href=https://use.fontawesome.com/releases/v5.6.3/css/all.css integrity=sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/ crossorigin=anonymous>
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
		        	<p style='font-family: Roboto, cursive !important;text-align:center;font-size:30px;color:white !important;'>
            <strong> Corona Prevention Products</strong>
        	</p>
        	
        
		
        	 <br/>
        	 <br/>
      	
<div class="shopping-cart">
  <!-- Title -->
  <div class="title">
    Make your own prevention kit
  </div>
 <div class="row">
 
  <c:forEach items="${product}" var="pb">
  
  <div class="item">
    <div class="buttons">
     
      <span class="like-btn"></span>
    </div>
 
    <div class="image">
      <img width="100" height="100" src="getProductPhoto/<c:out value='${pb.pid}'/>" alt="" />
    </div>
 
    <div class="description">
    <span>${pb.pname}</span>
     <span>${pb.pdesc}</span>
    </div>
   
   
 
 
    <div class="total-price">$ ${pb.pcost}</div>
   
 <div class="quantity"><a style="text-decoration:none" class="button" href="${pageContext.request.contextPath }/products/buy/${pb.pid}">Add to kit</a></div>
	
  
  </div>
  
 </c:forEach>
 
</div>

</div>

	
		
		<br/>
<script type="text/javascript">$('.like-btn').on('click', function() {
   $(this).toggleClass('is-active');
});</script>
		</body>
		</html>