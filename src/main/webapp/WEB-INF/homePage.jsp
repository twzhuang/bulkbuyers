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
    <title></title>
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
    <!-- main images -->
    <div id="carouselExampleControls" class="carousel slide gray" data-ride="carousel">
        <div class="carousel-inner w-75">
            
            <div class="carousel-item active">
                <img class="d-block w-100" src="assets/images/faucet-crop.jpg" alt="Second slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="assets/images/oven.jpg" alt="Third slide">
            </div>
            
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <div class="container my-5 col-9 main">
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
    <div class="gray p-5 text-center">
        <h4 class="title">About Warehouse</h4>
        <div class="row justify-content-center">
            <p class="col-7">Our mission is to deliver products to our customers at a discounted price. We believe in
                providing our customers with the top-of-the-line products at a fraction of the cost.</p>
        </div>
        <a class="btn btn-info rounded-0 px-4 text-light" href="/category/1">Explore our products</a>
    </div>

    <div class="container mt-5 col-9 main">
        <div class="my-5">
            <p class="h5 ml-n3 title">Most Popular Products</p>
            <div class="row white border">
            	<c:forEach items="${products}" var="product">
	                <div class="col-3 border p-4">
		                <form:form action="/addCart" method="post" modelAttribute="orderProduct">
		                    <a href=""><img src="${product.image}" alt="" class="col-12"></a>
		                    <div id="productInfo">
			                    <div>
			                    	<small class="text-muted"><c:out value="${product.brand}"/></small>
				                    <p>
				                    	<a href="" class="blue"><c:out value="${product.name}"/></a>
				                    </p>
				                    <p class="price h5">$<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${product.price}" /></p>
				                    <p class="text-success"><c:out value="${product.numPurchased}/${product.cap}"/> sold</p>
			                	</div>
			                	<div>
				                	<form:hidden path="product" value="${product.id}"/>
									<form:hidden path="user" value="${user.id}"/>
									
									<button type="submit" class="btn btn-info btn-block rounded-0">Add to cart</button>
			                	</div>
		                	</div>
		                </form:form>
	                </div>
                </c:forEach>
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