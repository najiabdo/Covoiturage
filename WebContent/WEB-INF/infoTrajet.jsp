<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="beans.Trajet" %>
<%@page import="beans.Vehicule" %>
<%@page import="beans.Utilisateur" %>
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
<%Trajet t=(Trajet)request.getAttribute("tt");%>
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
<a href="rejoidreTrajet?confirm=oui&idTT=<%=t.getIdT()%>">rejoidre</a>
<%}else{ %>
<p>max passager atteint</p>
<%} %>
<a href="rejoidreTrajet?confirm=non">annuller</a>
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