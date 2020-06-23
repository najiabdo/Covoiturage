<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="beans.Utilisateur" %>
<%@page import="beans.Authentification" %>
<%@page import="beans.Trajet" %>
<%@page import="dao.DAO" %>
<%HttpSession ses= request.getSession(false); %>
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
     <form action="">
    <%List<String> r=DAO.toutLesRegion();%>
    <label for="depart">depart :</label>
    <select name="depart" id="depart">
      <%for(int i=0;i<(r.size());i++){ %>
        <option value=<%=i+1%> ><%=r.get(i) %></option>
        <%} %>
      </select>
    <label for="arrive">arriv� :</label>
     <select name="arrive" id="arrive">
      <%for(int i=0;i<(r.size());i++){ %>
        <option value=<%=i+1%> ><%=r.get(i) %></option>
        <%} %>
      </select>
    <input type="submit" value="rechercher" />
    </form>
    <%List<Trajet> t=(List<Trajet>)request.getAttribute("t");%>
    <table>
    <tr>
      <td>
         Bagage autoris� 
      </td>
      <td>
         Prix 
      </td>
      <td>
         Date Depart
      </td>
      <td>
         Conducteur
      </td>
      <td>
         Depart
      </td>
      <td>
         arriv�
      </td>
    </tr>
    <%for(int i=0;i<t.size();i++){%>
    <tr>
      <td>
         <input type="text" readonly="readonly" value=<%=t.get(i).isBagageAutorise()%>>
      </td>
      <td>
         <input type="text" readonly="readonly" value=<%=t.get(i).getPrix() %>>
      </td>
      <td>
         <input type="text" readonly="readonly" value=<%=t.get(i).getDateDepart() %>>
      </td>
      <td >
         <a href="Profil?id=<%=t.get(i).getIdCreateur()%>"><input  style="cursor: pointer;color:blue;"  type="text" readonly="readonly" value=<%=DAO.getUtilisateur(t.get(i).getIdCreateur()) %>></a>
      </td>
      <td>
         <input type="text" readonly="readonly" value=<%=DAO.getRegionByCartier(t.get(i).getIdCartierDepart()) %>>
      </td>
      <td>
         <input type="text" readonly="readonly" value=<%=DAO.getRegionByCartier(t.get(i).getIdCartierArrive()) %>>
      </td>
      <td>
         <a href="ConsulterTrajet?idTT=<%=t.get(i).getIdT()%>"> consulter</a>
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
              <i class="material-icons">keyboard_arrow_right</i>Comment �a
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
          � propos de Staypa<span><span></span></span>
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
