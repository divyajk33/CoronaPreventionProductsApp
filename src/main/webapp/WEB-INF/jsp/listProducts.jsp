<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>

      <meta name="viewport" content="width=device-width, initial-scale=1">
	 <link rel="stylesheet" href="<c:url value="/css/main2.css"/>" >
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
				      <li><a href="addProduct">Add Products</a></li>
					  <li class='active'><a href="listProducts">Products</a></li>
				     
				    </ul>
				   <ul class='nav navbar-nav navbar-right'>
				     
				      <li><a href="home"> Login</a></li>
				    </ul>
				  </div>
				</nav>
		        	<p style='font-family: Roboto, cursive !important;text-align:center;font-size:30px;'>
            <strong> Corona Prevention Products</strong>
        	</p>
        	
        
		
        	 <br/>
        	 <br/>

	<div class=row>
		<c:forEach items="${product}" var="pb">
		  <div class=column>
		  <div class=card>
         <img width="100" height="100" src="getProductPhoto/<c:out value='${pb.pid}'/>">
		    <br/>
		    <br/>
          <span class='fa fa-star checked'></span>
              <span class='fa fa-star checked'></span>
              <span class='fa fa-star checked'></span>
              <span class='fa fa-star'></span>
              <span class='fa fa-star'></span>
		      <h3>${pb.pname}</h3>
		   <p>$ ${pb.pcost}</p>
			  
			 <p>${pb.pdesc}</p>
			<p><a class="btn btn-warning" href="editproduct/${pb.pid}">Edit</a>
     <a class="btn btn-warning" href="deleteProduct?pid=${pb.pid}">Delete</a></p>  
		      
		   </div>
		   
		  </div>
		
		</c:forEach>
		  
		</div>
		
		
		<br/>

		</body>
		</html>