<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Product Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="/assets/css/style.css">
        <link rel="stylesheet" href="/assets/css/style1.css">
        <link href="https://fonts.googleapis.com/css?family=Barlow:400,600,700|Lexend+Deca&display=swap" rel="stylesheet">
    	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body class="category-page-background">
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
        <div class="container col-9 main">
            <div class="row gray-text mx-0 my-3">
                <small><a href="/home" class="gray-text">Home</a></small>
                <small class="mx-1"><a href="/category/${product.category.id}" class="gray-text"> > <c:out value="${product.category.name}"/></a></small>
                <small class=""> > <c:out value="${product.name}"/></small>
            </div>
            <div class="row justify-content-between">
                <div class="col-6">
                    <div class="category-page-left-navbar p-5 text-center col-12 border">
                        <img class="product-page-img col-9" src="${product.image}">
                    </div>
                    <div class="category-page-left-navbar p-4 col-12 border my-4">
                    	<big class="collection-color font-weight-bold">Description</big>
                    	<p class="text-muted mt-3">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer leo massa, fermentum sit amet nulla eget, commodo porttitor odio. Aliquam in metus blandit, tristique neque ut, placerat dolor. Duis vitae est consectetur, tincidunt quam in, lacinia magna. In luctus placerat magna sagittis rhoncus. Nullam interdum erat non odio egestas, sit amet ornare neque consectetur. Vivamus imperdiet, lorem eget dictum faucibus, nunc sapien semper risus, quis tempus nisl ex sollicitudin quam.</p>
                    </div>
                </div>
                <div class="col-6">
                    <div class="category-page-left-navbar p-4 col-12 border">
                    	<form:form action="/addCart" method="post" modelAttribute="orderProduct">
	                        <h3 class="title mt-2"><c:out value="${product.name}"/></h3>
	                    	<hr>
	                    	<p><span class="collection-color font-weight-bold">Price:</span> $<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${product.price}" /></p>
	                    	<p><span class="collection-color font-weight-bold">Minimum required for this order to be complete:</span> <c:out value="${product.cap - product.numPurchased}"/></p>
							<div class="form-group row">
								<span class="collection-color font-weight-bold col-form-label col-2">Quantity:</span>
								<div class="col-3">
									<form:input type="number" min="0" value="1" class="form-control rounded-0" path="quantity"/>
								</div>
								<form:hidden path="product" value="${product.id}"/>
								<form:hidden path="user" value="${user.id}"/>
							</div>
							<button type="submit" class="btn btn-info btn-block rounded-0">Add to cart</button>
						</form:form>
                    </div>
                    <div class="category-page-left-navbar p-4 col-12 border my-4">
                    	<big class="collection-color font-weight-bold">Shipping and Returns</big>
                    	<ul class="mt-3 text-muted pl-3 pr-1">
                    		<li class="pl-3">Sed vitae lorem a nibh tempor ultricies. Ut eleifend interdum accumsan. Morbi neque ipsum, laoreet eget libero sed, tempus egestas lectus.</li>
                    		<li class="pl-3">Aliquam quis nibh dolor. Maecenas vestibulum vehicula iaculis. Suspendisse blandit eros et lorem aliquam, at bibendum massa suscipit. </li>
                    		<li class="pl-3">Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam tincidunt tempus erat non tempus. Aenean dui tellus, facilisis vitae elit ut, faucibus mollis massa.</li>
                    		<li class="pl-3">Sed vitae lorem a nibh tempor ultricies. Ut eleifend interdum accumsan. Morbi neque ipsum, laoreet eget libero sed, tempus egestas lectus.</li>
                    	</ul>
                    </div>
                </div>
        	</div>
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