<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="beans.Utilisateur" %>
<%@page import="beans.Authentification" %>
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
    <style>
    .wrap>div
    {
    padding-top:20px;
    }
    .contenaire {
        background-color: rgb(60, 36, 122);
        height: 100%;
        font-family: Arial, Helvetica, sans-serif;
        padding: 40px;
        position: relative;
      }
      .wrap {
        max-width: 350px;
        border-radius: 20px;
        margin: auto;
        box-sizing: border-box;
        padding: 40px;
        color: #fff;
        background: rgba(0, 0, 0, 0.8);
      }
      .inscriTitle {
        text-align: center;
      }
            input[type="text"],
      input[type="password"],
      input[type="date"],
      input[type="email"],
      input[type="number"]
      {
        width: 100%;
        box-sizing: border-box;
        padding: 12px 5px;
        background: white;
        outline: none;
        border: none;
        border-bottom: 1px dotted #fff;
        color: rgb(37, 10, 187);
        border-radius: 5px;
        margin: 5px;
        font-weight: bold;
      }
      select{
        width: 100%;
        box-sizing: border-box;
        padding: 12px 5px;
        background: white	;
        outline: none;
        color: rgb(37, 10, 187);
        border-radius: 5px;
        margin: 5px;
        font-weight: bold;
      }
      input[type="submit"] {
        width: 100%;
        box-sizing: border-box;
        padding: 10px 0px;
        margin-top: 30px;
        outline: none;
        border: none;
        background: #60adde;
        opacity: 0.7;
        border-radius: 20px;
        font-size: 20px;
        color: #fff;
      }
      input[type="submit"]:hover {
        background: #003366;
        opacity: 0.7;
      }
    </style>
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
    <%List<String> r=DAO.toutLesRegion(); %>
    <form action="creationTrajet" method="POST">
    <div class="contenaire">
            <p style="color:red;position:absolute;">
               <% if(request.getAttribute("erreur")!=null){%>
               <%=(String)request.getAttribute("erreur")%>
               <%} %>
            </p>
            <div class="wrap">
              <h1 class="inscriTitle">Creer Trajet</h1>
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
      </div>
      </div>
	</form>
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
