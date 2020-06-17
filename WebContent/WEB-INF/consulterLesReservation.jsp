<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%HttpSession ses=request.getSession(); %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="beans.Utilisateur" %>
<%@page import="beans.Trajet" %>
<%@page import="dao.DAO" %>
<%@page import="beans.Reservation"%>
<!-- Conducteur -->
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%List<Reservation> r=(List<Reservation>)ses.getAttribute("reservation"); %>
<table>
	<tr>
		<td>
		date de reservation
		</td>
		<td>
		la personne
		</td>
		<td>
		trajet
		</td>
		<td colspan="2">
		/
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
			<%=DAO.getUtilisateur(r.get(i).getIdU()) %>
		</td>
		<td>
			<%=r.get(i).getIdT() %>
		</td>
		<td>
			<a href="ConsulterReservation?confirm=oui&id=<%=r.get(i).getIdR()%>">Accepter</a>
		</td>
		<td>
			<a href="ConsulterReservation?confirm=non&id=<%=r.get(i).getIdR()%>">Refuser</a>
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