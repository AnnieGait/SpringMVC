<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="resources/css/test.css" rel="stylesheet" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
</head>
<body background="resources/img/whiteEnvelope.jpg">
	<!-- <body background="resources/img/whiteEnvelope.jpg"> -->	
	<!-- <img src="resources/img/img.jpg"> -->
	
	<br>
	<br>

	<h1>The FoRoom</h1>
	<h2>Millions of users communicate everyday</h2>

	<a href="${pageContext.request.contextPath}/logIn">Log In</a>
	<br>
	<a href="${pageContext.request.contextPath}/addUser">Sign Up (Add
		User)</a>
	<br>
	<a href="${pageContext.request.contextPath}/logInAsAdmin">Log In as
		an Administrator</a>
	<br>
	<!--  
	<form action="logIn" method="post">
		
		<%-- button "List All Users" has a submiting action --%>
		<input type="submit" value="Log In">

	</form>	
	<br>
	<br>
	-->

	<!--  
	<form action="addUser" method="post">
		<input type="submit" value="Sign Up">
	</form>	
	<br>
	<br>
	-->

	<!--  
	<form action="logInAsAdmin" method="post">
		<input type="submit" value="Log In As Administrator">
	</form>
	<br>
	<br>
	-->
</body>
</html>