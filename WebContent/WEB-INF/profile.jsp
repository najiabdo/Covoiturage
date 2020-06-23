<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%HttpSession ses= request.getSession(false); %>
<%@page import="beans.Utilisateur" %>
<%@page import="dao.DAO" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%Utilisateur u=(Utilisateur)request.getAttribute("utilisateur"); %>
<!DOCTYPE html>
<html>
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
    <style type="text/css">
		<%if(ses.getAttribute("utilisateur")==null ||u.getIdU()!=((Utilisateur)ses.getAttribute("utilisateur")).getIdU()){ %>
			#m1,
			#m2,
			#m3,
			#m4,
			#m5,
			#m6,
			#m7{
			display:none;
			}
		<%} %>
		    #m1m,
			#m2m,
			#m3m,
			#m4m,
			#m5m,
			#m6m,
			#m7m{
		    display:none;
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
      <div>
         <ul>
         
         <li>
	         Nom et Prenom : <%=u.getNom()%> <%=u.getPrenom()%>  
	         <span style="cursor: pointer;Color:blue;" id="m1">Modifier</span>
	         <form method="post" action="UpdateUserData?m=m1" id="m1m">
		         <input type="text" placeholder="nom" name="nom" value="<%=u.getNom()%>" required>
		         <input type="text" placeholder="prenom" name="prenom" value="<%=u.getPrenom()%>" required>
		         <input type="submit" value="valider">
	         </form>
         </li>
         
         <li>
         Date de naissance   :<%=u.getDdn()%>    
         <span style="cursor: pointer;Color:blue;" id="m2">Modifier</span>
	         <form method="post" action="UpdateUserData?m=m2" id="m2m">
	         	<input type="date" placeholder="19-09-1999" name="ddn" value="<%=u.getDdn()%>" required>
	         	<input type="submit" value="valider">
	         </form>
         </li>
         <li>
         Numero de telephone :0<%=u.getNdt() %>   
         <span style="cursor: pointer;Color:blue;" id="m3">Modifier</span>
       	     <form method="post" action="UpdateUserData?m=m3" id="m3m">
	         	<input type="numbre" placeholder="06XXXXXXXX" name="ndt" value="0<%=u.getNdt() %>" required>
	         	<input type="submit" value="valider">
	         </form>
         </li>
         <li>
         Email               :<%=u.getEmail() %>   
         <span style="cursor: pointer;Color:blue;" id="m4">Modifier</span>
       		 <form method="post" action="UpdateUserData?m=m4" id="m4m">
	         	<input type="email" placeholder="xyz@domaine.com" name="email" value="<%=u.getEmail() %> " required>
	         	<input type="submit" value="valider">
	         </form>
         </li>
         <li>
         Region de residence :<%=DAO.getRegionById(u.getidR())%>   
         <span style="cursor: pointer;Color:blue;" id="m5">Modifier</span>
             <form method="post" action="UpdateUserData?m=m5" id="m5m">
	         	<% List<String> regions=DAO.toutLesRegion(); %>
                <select name="region">
	               <%for(int i=0;i<(regions.size());i++){ %>
	               <option value=<%=i+1%> ><%=regions.get(i) %></option>
	               <%} %>
                </select>
                <input type="submit" value="valider">
	         </form>
         </li>
         <%if(!u.getMatricule().equalsIgnoreCase("**")){ %>
         <li>
         Voiture : <%=(DAO.getVehicule(u.getMatricule())) %>   
         <span style="cursor: pointer;Color:blue;" id="m6">Modifier</span>
	         <form method="post" action="UpdateUserData?m=m6" id="m6m">
		         	<input type="text" placeholder="Matricule" name="matricule" required>
		         	<input type="text" placeholder="marque" name="marque" required>
		         	<input type="numbre" name="ndp" required>
		         	<input type="submit" value="valider">
		     </form>
         </li>
         <%} %>
         
         <li>
         <span style="cursor: pointer;Color:blue;" id="m7"> changer mon mot de passe</span>
             <form method="post" action="UpdateUserData?m=m7" id="m7m">
	         	<input type="password" name="password" required>
	         	<input type="submit" value="valider">
	         </form>
         </li>
         </ul>
      </div>
      <%if(ses.getAttribute("utilisateur")!=null && u.getIdU()==((Utilisateur)ses.getAttribute("utilisateur")).getIdU()) {%>
      <div>
          <a href="MesReservation"><h2 >Consulter mes demande de Reservations</h2></a>
      </div>
      <%if(!u.getMatricule().equalsIgnoreCase("**")){ %>
         <div>
              <a href="ConsulterMesTrajets"><h2>Consulter Vos trajets</h2></a>
              <a href="ConsulterReservation"><h2>Consulter les reservation de Vos trajets</h2></a>
         </div>
         <%} %>
       <%} %>
         
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
    <script src="js/jquery-3.4.1.js"></script>
    <script>
      $(document).ready(function () {
        $("#m1").click(function () {
          $("#m1m").toggle();
        });
        $("#m2").click(function () {
          $("#m2m").toggle();
        });
        $("#m3").click(function () {
            $("#m3m").toggle();
          });
        $("#m4").click(function () {
            $("#m4m").toggle();
        });
        $("#m5").click(function () {
            $("#m5m").toggle();
          });
        $("#m6").click(function () {
            $("#m6m").toggle();
        });
        $("#m7").click(function () {
            $("#m7m").toggle();
        });
      });
    </script>
</body>
</html>