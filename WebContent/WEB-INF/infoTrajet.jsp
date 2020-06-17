<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="beans.Trajet" %>
<%@page import="beans.Vehicule" %>
<%@page import="dao.DAO" %>
<%HttpSession ses=request.getSession(false); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%Trajet t=(Trajet)ses.getAttribute("tt");%>
<%Vehicule v=DAO.getVehiculeByIdU(t.getIdCreateur()); %>
<%if(request.getAttribute("deja")!=null){ %>
<h2 style="color:green;">Vous etes deja inscrit</h2>
<%} %>
<h4>nom du createur :</h4>
<p><%=DAO.getUtilisateur(t.getIdCreateur())%></p>
<h4>date depart :</h4>
<p><%=t.getDateDepart()%></p>
<h4>Region depart :</h4>
<p><%=DAO.getRegionByCartier(t.getIdCartierDepart())%></p>
<h4>cartier depart :</h4>
<p><%=DAO.getCartierName(t.getIdCartierDepart())%></p>
<h4>Region arrivé</h4>
<p><%=DAO.getRegionByCartier(t.getIdCartierArrive())%></p>
<h4>cartier arrivé :</h4>
<p><%=DAO.getCartierName(t.getIdCartierArrive())%></p>
<h4>Bagage Autorisé :</h4>
<p><%=t.isBagageAutorise()%></p>
<h4>Prix :</h4>
<p><%=t.getPrix()%></p>
<%if((int) v.getNdp()>DAO.nbrDePassager(t.getIdT())){ %>
<a href="rejoidreTrajet?confirm=oui">rejoidre</a>
<%}else{ %>
<p>max passager atteint</p>
<%} %>
<a href="rejoidreTrajet?confirm=non">annuller</a>
</body>
</html>