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
    <style type="text/css">
    h1
    {
      color: white;
	  font-family: "Montserrat", sans-serif;
	  font-size: 30px;
	  font-weight: 800;
	  text-transform: uppercase;
	  padding-top:20px;
	  text-decoration:underline;
	  text-align:center;
    
    }
    th
    {
      color: white;
	  font-family: "Montserrat", sans-serif;
	  font-size: 18px;
	  font-weight: 600;
	  text-transform: uppercase;
	  padding-top:20px;
	  text-decoration:underline;
	  text-align:center;
    
    }
     a
    {
      color: red;
	  font-family: "Montserrat", sans-serif;
	  font-size: 18px;
	  font-weight: 500;
	  text-transform: uppercase;
	  padding-right:20px;
	  text-decoration: none;
    }
   
    td
    {
      background-color:white;
      border:2px solid #2c79a7;
      color: black;
	  font-family: "Montserrat", sans-serif;
	  font-size: 15px;
	  font-weight: 700;
	  text-transform: uppercase;
      padding:10px 20px;
    }
    
    .contenaire
    {
       background-color: rgb(60, 36, 122);
    }
	table
	{
	padding: 80px 10px;
	}
	thead{
	padding-bottom: 20px;
	}
    </style>
</head>
</head>
<body>
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

<%List<Reservation> r=(List<Reservation>)ses.getAttribute("reservation"); %>
<div class="contenaire">
<h1>Status de mes Reservations</h1>
<table>
	<tr>
		<th>
		date de reservation
		</th>
		<th>
		createur
		</th>
		<th>
		depart
		</th>
		<th>
		arrive
		</th>
		<th>
		annulation
		</th>
		<th>
		Statut
		</th>
	</tr>
	<%for(int i=0;i<r.size();i++){ %>
	<tr>
		<td>
			<%=r.get(i).getDdReservation() %>
		</td>
		<td >
		  <a style="color:blue;" href="Profil?id=<%=DAO.getTrajetById(r.get(i).getIdT()).getIdCreateur()%>"><%= DAO.getUtilisateur(DAO.getTrajetById(r.get(i).getIdT()).getIdCreateur()) %></a>
		</td>
		<td>
		    <%=DAO.getRegionByCartier((DAO.getTrajetById(r.get(i).getIdT())).getIdCartierDepart()) %>
		</td>
		<td>
			<%=DAO.getRegionByCartier((DAO.getTrajetById(r.get(i).getIdT())).getIdCartierArrive()) %>
		</td>
		<td>
			<a href="MesReservation?annulation=oui&id=<%=r.get(i).getIdR()%>">oui</a>
		</td>
		<td>
		    <%if(r.get(i).getEtat()==0){%>
		    <p style="color:yellow;">En attente</p>
		    <%}else if(r.get(i).getEtat()==1){%>
		    <p style="color:green;">accepted</p>
		     <%}else if(r.get(i).getEtat()==2){%>
		     <p style="color:red;">refused</p>
		     <%} %>
		</td>
	</tr>
	<%} %>
</table>
</div>
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