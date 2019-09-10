<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><c:out value="${category.name}"/></title>
    <link href="https://fonts.googleapis.com/css?family=Barlow:400,600,700|Lexend+Deca&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="/assets/css/style.css">
    <link rel="stylesheet" href="/assets/css/style1.css">
</head>

<body class="container-fluid p-0 category-page-background">
    <!-- Nav bar -->
    <div class="navbar header py-4">
        <div class="container col-9 main">
            <h4 class="name"><a href="/home" class="text-light">Warehouse</a></h4>

            <form class="form-inline my-2 my-lg-0 col-7">
                <div class="input-group col-12 p-0">
                    <input class="form-control" type="search" placeholder="Search by product or category"
                        aria-label="Search">
                    <div class="input-group-append">
                        <button class="btn btn-info my-2 my-sm-0" type="submit">
                            <img src="https://img.icons8.com/ios-filled/20/000000/search.png" class="invert">
                        </button>
                    </div>
                </div>
            </form>
            <div class="d-inline-block header__action-item-content">
            	<c:if test="${user != null}">
            		<p class="text-light m-0">Hello, <c:out value="${user.firstName}"/> <a href="/logout" class="text-light ml-2"><u>Logout</u></a></p>
            	</c:if>
            	<c:if test="${user == null}">
	            	<a href="" class="text-light d-block" id="login">Login / Signup</a>
	            </c:if>
	            <div id="popup" class="popover popover--large popover--unlogged p-4" aria-hidden="true">
	            	
	            	<div class="popover__panel-list" style="" id="popover-list">
	            		<div class="popover__panel popover__panel--default" id="loginPanel">
	            			<h5 class="blue">Login to my account</h5>
			            	<p>Enter your email and password</p>
			            	<form action="/home/login" method="post">
			            		<div class="form-group">
			            			<input class="form-control rounded-0" placeholder="Email" name="email">
			            		</div>
			            		<div class="form-group">
			            			<input class="form-control rounded-0" type="password" placeholder="Password" name="password">
			            		</div>
			            		<button type="submit" class="btn btn-block btn-info rounded-0">Login</button>
			            	</form>
			            	<p class="my-3">New customer? <a href="" class="current-category-color" id="createAccount">Create your account</a></p>
	            		</div>
	            		<div class="popover__panel popover__panel--sliding" id="registerPanel">
		            		<h5 class="blue">Create my account</h5>
		            		<p>Please fill in the information below:</p>
			            	<form:form action="/home/register" method="post" modelAttribute="u">
			            		<div class="form-group">
			            			<form:input path="firstName" class="form-control rounded-0" placeholder="First name"/>
			            		</div>
			            		<div class="form-group">
			            			<form:input path="lastName" class="form-control rounded-0" placeholder="Last name"/>
			            		</div>
			            		<div class="form-group">
			            			<form:input path="email" class="form-control rounded-0" placeholder="Email"/>
			            		</div>
			            		<div class="form-group">
			            			<form:input path="password" type="password" class="form-control rounded-0" placeholder="Password"/>
			            		</div>
			            		<button type="submit" class="btn btn-block btn-info rounded-0">Create my account</button>
			            	</form:form>
			            	<p class="my-3">Already have an account? <a href="" class="current-category-color" id="loginAccount">Login here</a></p>	
	            		</div>
	            	</div>
	            	
	            </div>
	        </div>
            <div>
                <a href="/cart" class="text-light">
                    <img src="/assets/images/cart-copy.png" alt="shopping-cart" style="width:30px" class="cart invert">
                    Cart
                </a>
            </div>
        </div>

    </div>
    <div class="container my-3 col-9 main">
    	<div class="row gray-text mx-0">
            <small><a href="/home" class="gray-text">Home</a></small>
            <small class="mx-1"> > <c:out value="${category.name}"/></small>
        </div>
    	<div class="row justify-content-between">
	    	<div class="col-3">
		        <div class="category-page-borders col-12 category-page-left-navbar p-4 d-inline-block align-top">
		            <h6 class="collection-color mb-3">Collections</h6>
		            <c:forEach items="${categories}" var="category">
		            	<div><a href="/category/${category.id}" class="current-category-text-color"><c:out value="${category.name} (${category.products.size()})"/></a></div>
		            </c:forEach>
		            
		        </div>
		    </div>
		    <div class="col-9">
		        <div class="category-page-borders col-12 d-inline-block align-top container-fluid p-0 background-white">
		            <div class="category-image mb-3 category-page-borders"></div>
		            <h3 class="collection-color mb-3 mx-4 title"><c:out value="${category.name}"/></h3>
		            <div class="container-fluid">
		                <div class="row">
		                	<c:forEach items="${category.products}" var="product">
			                    <div class="col-3 category-page-borders-second text-center pt-3">
			                        <img src="${product.image}" class="product-image">
		                        	<form:form modelAttribute="orderproduct" action="/addCart" method="post">
				                        <div class="" id="productInfo">
				                        	
				                        	<div class="text-left">
				                        		<small class="text-muted d-block"><c:out value="${product.brand}"/></small>
					                        	<a href="/products/${product.id}" class="blue"><c:out value="${product.name}"/></a>
					                        	<p class="current-category-text-color price h5">$<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${product.price}" /></p>
							                 
				                        	</div>
				                        	<div class="test">
				                        		<p class="current-category-text-color mt-2"><c:out value="${product.numPurchased}/${product.cap}"/> sold</p>	
						                        <button type="submit" class="btn product-button rounded-0 mb-3">Add to Cart</button>
				                        	</div>
				                        	<form:hidden path="product" value="${product.id}"/>
				                        	<form:hidden path="quantity" value="${1}"/>
				                        	
				                        </div>
			                    	</form:form>
			                    </div>
		                    </c:forEach>
		                </div>
		            </div>
		
		        </div>
	        </div>
	    </div>
        <div class="container my-5 col-12">
            <div class="row justify-content-between">
	            <div class="box1 col-4 rounded">
	                <h5>Electronics</h5>
	                <a class="btn btn-light pink" href="/category/5">Shop Electronics</a>
	            </div>
	            <div class="box2 col-3 rounded">
	                <h5>Appliances</h5>
	                <a class="btn btn-light purple" href="/category/2">Shop Appliances</a>
	            </div>
	            <div class="box3 col-4 rounded">
	                <h5>Audio</h5>
	                <a class="btn btn-light light-blue" href="/category/1">Shop Audio</a>
	            </div>
	        </div>
        </div>
        <hr>
    </div>
    <footer class="gray p-5 text-center">
        <small class="text-muted">© Warehouse by Tedman and Kathy</small>
    </footer>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="/assets/js/script.js"></script>
</body>
</html>