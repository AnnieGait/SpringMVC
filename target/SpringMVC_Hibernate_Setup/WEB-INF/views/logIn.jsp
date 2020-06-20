<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log In</title>
</head>
<body>
	<!--
	<form action="logIn" th:object="${user}" method="POST" enctype="utf8">
		<div>
			<label th:text value="{label.user.name}">NAME</label> <input
				th:field="*{name}" />
			<p th:each="error: ${fields.errors('name')}" th:text="${error}">Validation
				error</p>
		</div>

		<div>
			<label th:text="{label.user.id}">ID</label> <input
				th:field="*{id}" />
			<p th:each="error : ${fields.errors('id')}" th:text="${error}">Validation
				error</p>
		</div>

		<button type="submit" th:text="{label.form.submit}">submit</button>
	</form>
	-->


	<!-- qwerty --> 
	<!-- 
	<form action="dataProcessingServlet" method="POST">
		<br> Enter Your Name:<br>
		<!-- input type="text" --
		<input type="edit" name="name"><br>
		<td>
		<!-- <form:input path="name" /></td> --
		<br>
		<!-- na to allaxw apo "LOG IN!" se "Let's Chat!" --
		<input type="submit" value="LOG IN!" /> 
		<!-- <input type="submit" value="See your data" /> --

	</form>
	-->
	

	<!-- The below form seems to work! All Good :P -->
	<!-- test 
	<form action="logIn" method="POST">
		<hidden path="id" />
		<table>
			<tr>
				<td><label path="id">Id</label></td>
				<td><input path="id"/></td>
			</tr>
			<tr>
				<td><label path="name">Name</label></td>
				<td><input path="name"/></td>
			</tr>
			<tr>
                    <td><input type="submit" value="Submit"/></td>
            </tr>	
		</table>
	</form>
	
	-->

	<form id="logIn" method="post">
		<label>NAME: </label> 
		<input type="text" name="name">
		<br /> 
		<label>ID: </label> 
		<input type="text" name="id">
		<br />
		<button>Submit</button>
	</form>

</body>
</html>