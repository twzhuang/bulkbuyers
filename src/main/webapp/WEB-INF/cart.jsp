<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Your Shopping Cart</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/style1.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Barlow:400,600,700|Lexend+Deca&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body class="gray">
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

    <div class="container my-5 col-9 main">
    	<c:if test="${cart.size() > 0}">
	    	<h3 class="title">My Cart</h3>
	    	<div class="row justify-content-between">
	    		<div class="col-8">
			        <table class="col-12 white">
			            <thead class="border">
			                <tr>
			                    <th>Product</th>
			                    <th id="quantity">Quantity</th>
			                    <th id="total">Total</th>
			                </tr>
			            </thead>
			            <tbody class="border">
			            	<c:forEach items="${cart}" var="p">
			            		<tr class="border">
				                    <td class="col-4">
				                        <img src="${p.product.image}" alt="${p.product.name}" class="col-3 d-inline-block">
				                        <div class="d-inline-block align-bottom col-8">
				                            <small class="text-muted"><c:out value="${p.product.brand}"/></small>
				                            <a href="/products/${p.product.id}">
				                                <p class="blue"><c:out value="${p.product.name}"/></p>
				                            </a>
				                            <p class="price h5">$<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${p.product.price}" /></p>
				                        </div>
				                    </td>
				                    <td class="text-center col-6">
				                        <input type="number" min="0" value="${p.quantity}">
				                        <a href="/products/${p.id}/remove" class="text-muted"><small>Remove</small></a>
				                    </td>
				                    <td class="col-2">
				                        <p>$<c:out value="${p.product.price * p.quantity}"/></p>
				                    </td>
				                </tr>
			            	</c:forEach>
			            </tbody>
			        </table>
	    		</div>
	    		<div class="col-4">
	    			<div class="col-12 border p-3 white">
	   					<div class="row justify-content-between">
	    					<p class="blue col">Total</p>
	    					<p class="blue col">$<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${total}" /></p>
	    				</div>
	    				<hr>
	    				<small class="text-muted">Tax included. Shipping calculated at checkout</small>
	    				<form:form method="post" action="/checkout" modelAttribute="order">
	    					<form:hidden path="user" value="${id}"/>
	    					<button type="submit" class="text-light btn btn-info btn-block rounded-0 mt-3">Checkout</button>
	    					<!-- <a href="/checkout" class="text-light btn btn-info btn-block rounded-0 mt-3">Checkout</a>-->
	    				</form:form>
	    			</div>
	    		</div>
	    	</div>
	    </c:if>
	    <c:if test="${cart.size() == 0}">
	    	<div id="emptyCart" class="gray container">
	    			<div class="text-center">
		    			<img src="/assets/images/cart-copy.png" style="width:150px">
		    			<h2 class="category">Your cart is empty</h2>
		    			<a href="/category/1" class="btn btn-info rounded-0">Shop our products</a>
	    			</div>
	    	
	    	</div>
	    </c:if>
  
    </div>
    <footer class="gray p-5 text-center">
        <small class="text-muted">© Warehouse by Tedman and Kathy</small>
    </footer>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>