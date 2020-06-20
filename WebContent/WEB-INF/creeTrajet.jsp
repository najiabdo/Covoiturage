<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="beans.Utilisateur" %>
<%@page import="beans.Authentification" %>
<%@page import="dao.DAO" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
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
    <%=(String)request.getAttribute("erreur")%>
    <%List<String> r=DAO.toutLesRegion();%>
    <form action="creationTrajet" method="POST">
      <div>
        <label for="regionDepart">depart : </label>
       <select name="regionDepart">
      <%for(int i=0;i<(r.size());i++){ %>
        <option value=<%=i+1%> ><%=r.get(i) %></option>
        <%} %>
      </select>
        <label for="cartierDepart">Cartier : </label>
        <input type="text" name="cartierDepart" id="cartierDepart" />
      </div>

      <div>
        <label for="regionArrive">Destination : </label>
        <select name="regionArrive">
      <%for(int i=0;i<(r.size());i++){ %>
        <option value=<%=i+1%> ><%=r.get(i) %></option>
        <%} %>
      </select>
        

        <label for="cartierArrive">Cartier : </label>
        <input type="text" name="cartierArrive" id="cartierArrive" />
      </div>
      <div>
        <label for="ddDepart">date du depart :</label>
        <input
          type="date"
          name="ddDepart"
          placeholder="09-09-1999"
          id="ddDepart"
        />
      </div>
      <div>
        <label for="">bagage autorisé :</label>
        <input type="radio" id="bagageoui" name="bagage" value="oui" />
        <label for="bagageoui">oui</label>
        <input type="radio" id="bagagenon" name="bagage" value="non" />
        <label for="bagagenon">non</label>
      </div>
      <div>
        <label for="prix">Prix du trajet par passager :</label>
        <input type="number" name="prix" id="prix" />
        <span> DH</span>
      </div>
      <input type="submit">
	</form>
  </body>
</html>
