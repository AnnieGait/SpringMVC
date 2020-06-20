<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%-- title is the TAB TITLE --%>
<title>Welcome to the new Home Page</title>
</head>
<body>

<br>
<br>
<br>
	<h2>This is the Home Page</h2>
	
	<!-- Na balw kwdika poy tha parousiazei to main menu -->
	
	
	
	<!-- kanei anafora sto allUsers.jsp -->
	<form action="allUsers" method="post">
		
		<%-- button "List All Users" has a submiting action --%>
		<input type="submit" value="List All Users" />

	</form>
</body>
</html>