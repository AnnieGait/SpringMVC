<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
</head>
<body>

	<img src="/webapp/images/img.jpg"/>
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

</body>
</html>