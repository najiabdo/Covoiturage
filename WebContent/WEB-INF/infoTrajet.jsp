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
</head>

<body>
<nav>
        <img src="images/icon.jpg" alt="" />
        <ul class="menu">
          <li>
            <a href="acceuil.html"> <span class="material-icons">home</span>Home </a>
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
        </ul>
      </nav>
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
<h4>Region arriv�</h4>
<p><%=DAO.getRegionByCartier(t.getIdCartierArrive())%></p>
<h4>cartier arriv� :</h4>
<p><%=DAO.getCartierName(t.getIdCartierArrive())%></p>
<h4>Bagage Autoris� :</h4>
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