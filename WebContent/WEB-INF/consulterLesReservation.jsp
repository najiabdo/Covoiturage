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
<link rel="stylesheet" href="css/style.css" />
    <link
      href="https://fonts.googleapis.com/css2?family=Lobster&family=Pacifico&family=Roboto+Condensed:wght@700&family=Sigmar+One&family=Ultra&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700"
      rel="stylesheet"
    />
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%List<Reservation> r=(List<Reservation>)ses.getAttribute("reservation"); %>
  <nav>
        <img src="images/icon.jpg" alt="" />
        <ul class="menu">
          <li>
            <a href="acceuil.jsp"> <span class="material-icons">home</span>Home </a>
          </li>
          <li>
            <a href="ConsulterTrajet">
              <span class="material-icons">search</span>Find Itinerary
            </a>
          </li>
          <li>
            <a href="#">
              <span class="material-icons">perm_identity</span>About Us
            </a>
          </li>
          <li>
            <a href="#">
              <span class="material-icons">help_outline</span>Need Help ?
            </a>
          </li>
         <%if(ses.getAttribute("utilisateur")==null){ %>
          <li>
            <a href="AuthentificationServlet">
              <span>Connexion</span>
            </a>
          </li>
          <li>
            <a href="InscriptionServlet">
              <span>Inscription</span>
            </a>
          </li>
          <%}else{ %>
          <li>
            <a href="Profil?id=<%=((Utilisateur)ses.getAttribute("utilisateur")).getIdU()%>">
              <span>Profil</span>
            </a>
          </li>
          <li>
            <a href="Deconnection">
              <span>Deconnection</span>
            </a>
          </li>
          <%} %>
        </ul>
      </nav>
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
			<a href="Profil?id=<%=r.get(i).getIdU()%>"><%=DAO.getUtilisateur(r.get(i).getIdU()) %></a>
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
    <footer>
      <div>
        <img src="images/icon.jpg" alt="" />
      </div>
      <div>
        <h3>
          more informations<span><span></span></span>
        </h3>
        <ul>
          <li>
            <a href="help.jsp">
              <i class="material-icons">keyboard_arrow_right</i>Comment ça
              marche
            </a>
          </li>
          <%if(ses.getAttribute("utilisateur")==null){ %>
          <li>
            <a href="AuthentificationServlet">
              <span>Connexion</span>
            </a>
          </li>
          <li>
            <a href="InscriptionServlet">
              <span>Inscription</span>
            </a>
          </li>
          <%}else{ %>
          <li>
            <a href="Profil?id=<%=((Utilisateur)ses.getAttribute("utilisateur")).getIdU()%>">
              <span>Profil</span>
            </a>
          </li>
          <li>
            <a href="Deconnection">
              <span>Deconnection</span>
            </a>
          </li>
          <%} %>
          <li>
            <a href="ConsulterTrajet">
              <i class="material-icons">keyboard_arrow_right</i>Consulter les
              trajets
            </a>
          </li>
        </ul>
      </div>
      <div>
        <h3>
          à propos de Staypa<span><span></span></span>
        </h3>
        <ul>
          <li>
            <a href="aboutUs.jsp">
              <i class="material-icons">keyboard_arrow_right</i>Qui sommes-nous
              ?
            </a>
          </li>
          <li>
            <a href="motDeEquipe.jsp">
              <i class="material-icons">keyboard_arrow_right</i>Mot de l'equipe
              Staypa
            </a>
          </li>
        </ul>
      </div>
      <div>
        <h3>
          CONTACT<span><span></span></span>
        </h3>
        <ul>
          <li>
            <i class="material-icons">phone</i>
            <h3>+212 (0)661182058</h3>
          </li>
          <li>
            <i class="material-icons">email</i>
            <h3>support@staypa.ma</h3>
          </li>
        </ul>
      </div>
    </footer>
</body>
</html>