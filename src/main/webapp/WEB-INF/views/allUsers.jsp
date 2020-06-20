<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Title is the tab title -->
<title>All Users</title>
</head>
<body>
	<h1>This is the Adminastrators Page!</h1>
	<br>
	<br>
	<br>
	<a href="${pageContext.request.contextPath}/main">Home Page</a>
	<br>
	<!--  kanei anafora se allh selida, paei sto addUser.jsp -->
	<a href="${pageContext.request.contextPath}/addUser">Add User</a>
	<br>
	<h3>List of all users</h3>
	<h3>The DB's table data</h3>
	${message}
	<br>
	<br>
	<table border="1px" cellpadding="0" cellspacing="0">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Phone</th>
				<th>Email</th>
				<th>Address</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="user" items="${userList}">
				<tr>
					<td>${user.id}</td>
					<td>${user.name}</td>
					<td>${user.phone}</td>
					<td>${user.email}</td>
					<td>${user.address}</td>
					
					<!--  kanei anafora se allh selida, paei sto editUser.jsp -->
					<td><a
						href="${pageContext.request.contextPath}/editUser/${user.id}">Edit</a></td>
					
					<!--  kanei anafora se allh selida, paei sto deleteUser.jsp -->
					<td><a
						href="${pageContext.request.contextPath}/deleteUser/${user.id}">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>


	</table>
</body>
</html>