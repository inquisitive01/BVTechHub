<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logout</title>
</head>
<body>

<%   
  
String name=(String)session.getAttribute("mailid"); 
session.invalidate(); //invalidating session for user to logout
response.sendRedirect("../html/landing.html"); //redirecting to landing page after logout

%>   
</body>
</html>