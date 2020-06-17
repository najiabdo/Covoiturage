<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%if( request.getAttribute("Erreur")!=null){ %>
<p><%= (String)request.getAttribute("Erreur") %></p>
<%} %>

<form action="Authentification" method="post">
<label>Login :</label>
<input type="text" placeholder="xyz@domaine.com"  name="login">
<label>Password :</label>
<input type="password"  name="password">
<input type="submit" value="Connexion">
</form>

</body>
</html>