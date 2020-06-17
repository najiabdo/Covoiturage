<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%HttpSession ses=request.getSession(); %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="beans.Utilisateur" %>
<%@page import="beans.Trajet" %>
<%@page import="dao.DAO" %>
<%@page import="beans.Reservation"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Mes Reservations</h1>
<%List<Reservation> r=(List<Reservation>)ses.getAttribute("reservation"); %>
<table>
	<tr>
		<td>
		date de reservation
		</td>
		<td>
		createur
		</td>
		<td>
		trajet
		</td>
		<td>
		etat
		</td>
		<td>
		annulation
		</td>
		<td>
		Statut
		</td>
	</tr>
	<%for(int i=0;i<r.size();i++){ %>
	<tr>
		<td>
			<%=r.get(i).getDdReservation() %>
		</td>
		<td>
			<%= DAO.getUtilisateur(DAO.getTrajetById(r.get(i).getIdT()).getIdCreateur()) %>
		</td>
		<td>
			<%=r.get(i).getIdT() %>
		</td>
		<td>
			<%=r.get(i).getEtat() %>
		</td>
		<td>
			<a href="MesReservation?annulation=oui&id=<%=r.get(i).getIdR()%>">oui</a>
		</td>
		<td>
		    <%if(r.get(i).getEtat()==0){%>
		    <p>En attente</p>
		    <%}else if(r.get(i).getEtat()==1){%>
		    <p>accepted</p>
		     <%}else if(r.get(i).getEtat()==2){%>
		     <p>refused</p>
		     <%} %>
		</td>
	</tr>
	<%} %>
</table>
</body>
</html>