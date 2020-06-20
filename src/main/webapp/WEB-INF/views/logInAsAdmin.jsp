<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrator's Log In</title>
</head>
<body>
	<h1>Log In As Admin</h1>
	<h3>${passwordMessage}</h3>
	<!-- na dokimasw kai me form se sxolia h na allaxw to form -->
	<form id="logInAsAdmin" method="post">
		<br> Type the Admin Password: <br>
		<!-- input type="text" -->
		<label>PASSWORD (8 characters minimum) :</label>
		<input type="password" name="password">
		<br> 
		
		<br> 
		<button>Submit as Admin</button>
		<!-- <input type="submit" value="Submit as Admin" /> -->

	</form>

</body>
</html>