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
	  padding-bottom:60px;
    
    }
    h3
    {
      color: white;
	  font-family: "Montserrat", sans-serif;
	  font-size: 24px;
	  font-weight: 500;
	  text-transform: uppercase;
	  display:inline;
	  padding-right:20px;
	  padding-left:20px;
    
    }
    div>ul>li>a,li
    {
      color: white;
	  font-family: "Montserrat", sans-serif;
	  font-size: 18px;
	  font-weight: 500;
	  text-transform: uppercase;
	  padding-right:20px;
	  padding-top:20px;
    } 
    .contenaire
    {
       background-color: rgb(60, 36, 122);
    }
    label
    {
      color: white;
	  font-family: "Montserrat", sans-serif;
	  font-size: 18px;
	  font-weight: 500;
	  text-transform: uppercase;
	  padding-right:20px;
    }
    input[type="submit"]
    {
      border-radius:20px;
      background-color:#2c79a7;
      color: white;
	  font-family: "Montserrat", sans-serif;
	  font-size: 15px;
	  font-weight: 300;
	  text-transform: uppercase;
	  text-align: center;
	  padding:2px 10px;
	  border:1px solid black;
	   margin-left: 30px;
    }
    input
    {
      background-color:white;
      border:2px solid #2c79a7;
      color: black;
	  font-family: "Montserrat", sans-serif;
	  font-size: 15px;
	  font-weight: 500;
	  text-transform: uppercase;
      padding:2px 10px;
    }
    #m1,
	#m2,
	#m3,
	#m4,
	#m5,
	#m6,
	#m7{
	
	font-family: "Montserrat", sans-serif;
	font-size: 18px;
    font-weight: 500;
    text-transform: uppercase;
	padding-left:100px;
	}
	.lien
	{
	display:flex;
	justify-content:space-between;
	padding: 60px 0px;
	}
	pre
	{
	display:inline;
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
      <div class="contenaire">
      <h1>profile</h1>
      <div>
         <ul>
         
         <li>
	         <pre>Nom et Prenom              :</pre><h3> <%=u.getNom()%> <%=u.getPrenom()%>  </h3>
	         <span style="cursor: pointer;color: #2c79a7;" id="m1">Modifier</span>
	         <form method="post" action="UpdateUserData?m=m1" id="m1m">
		         <input type="text" placeholder="nom" name="nom" value="<%=u.getNom()%>" required>
		         <input type="text" placeholder="prenom" name="prenom" value="<%=u.getPrenom()%>" required>
		         <input type="submit" value="valider">
	         </form>
         </li>
         
         <li>
         <pre>Date de naissance          :</pre> <h3><%=u.getDdn()%>    </h3>
         <span style="cursor: pointer;color: #2c79a7;" id="m2">Modifier</span>
	         <form method="post" action="UpdateUserData?m=m2" id="m2m">
	         	<input type="date" placeholder="19-09-1999" name="ddn" value="<%=u.getDdn()%>" required>
	         	<input type="submit" value="valider">
	         </form>
         </li>
         <li>
         <pre>Numero de telephone        :</pre><h3>0<%=u.getNdt() %>   </h3>
         <span style="cursor: pointer;color: #2c79a7;" id="m3">Modifier</span>
       	     <form method="post" action="UpdateUserData?m=m3" id="m3m">
	         	<input type="numbre" placeholder="06XXXXXXXX" name="ndt" value="0<%=u.getNdt() %>" required>
	         	<input type="submit" value="valider">
	         </form>
         </li>
         <li>
         <pre>Email                      :</pre><h3><%=u.getEmail() %>   </h3>
         <span style="cursor: pointer;color: #2c79a7;" id="m4">Modifier</span>
       		 <form method="post" action="UpdateUserData?m=m4" id="m4m">
	         	<input type="email" placeholder="xyz@domaine.com" name="email" value="<%=u.getEmail() %> " required>
	         	<input type="submit" value="valider">
	         </form>
         </li>
         <li>
         <pre>Region de residence        :</pre><h3><%=DAO.getRegionById(u.getidR())%>  </h3> 
         <span style="cursor: pointer;color: #2c79a7;" id="m5">Modifier</span>
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
         <pre>Voiture                    : </pre><h3><%=(DAO.getVehicule(u.getMatricule())) %>  </h3>
         <span style="cursor: pointer;color: #2c79a7;" id="m6">Modifier</span>
	         <form method="post" action="UpdateUserData?m=m6" id="m6m">
		         	<input type="text" placeholder="Matricule" name="matricule" required>
		         	<input type="text" placeholder="marque" name="marque" required>
		         	<input type="numbre" name="ndp" required>
		         	<input type="submit" value="valider">
		     </form>
         </li>
         <%} %>
         
         <li>
         <%if(ses.getAttribute("utilisateur")!=null && u.getIdU()==((Utilisateur)ses.getAttribute("utilisateur")).getIdU()) {%>
         <pre>mot de passe               :</pre>
         <%} %>
         <span style="cursor: pointer;color: #2c79a7;" id="m7"> changer mon mot de passe</span>
             <form method="post" action="UpdateUserData?m=m7" id="m7m">
	         	<input type="password" name="password" required>
	         	<input type="submit" value="valider">
	         </form>
         </li>
         </ul>
      </div>
      <%if(ses.getAttribute("utilisateur")!=null && u.getIdU()==((Utilisateur)ses.getAttribute("utilisateur")).getIdU()) {%>
      <div class="lien">
          <a href="MesReservation">Consulter mes demande de Reservations</a>
      <%if(!u.getMatricule().equalsIgnoreCase("**")){ %>
              <a href="ConsulterMesTrajets">Consulter Vos trajets</a>
              <a href="ConsulterReservation">Consulter les reservation de Vos trajets</a>
              <a href="creationTrajet">Creez un trajet</a>
         <%} %>
         </div>
       <%} %>
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
          <li >
            <i class="material-icons">phone</i>
            <h3 class="ff">+212 (0)661182058</h3>
          </li>
          <li>
            <i class="material-icons">email</i>
            <h3 class="ff">support@staypa.ma</h3>
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