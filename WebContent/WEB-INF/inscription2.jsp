<% HttpSession ses=request.getSession(false); String
a=(String)ses.getAttribute("id"); %>
<%@page import="java.util.ArrayList" %>
<%@page import="beans.Utilisateur" %>
<%@page import="beans.Authentification" %>
<%@page import="dao.DAO" %>
<%@page import="java.util.List" %>
<%! Utilisateur u=new Utilisateur();%>
<%! Authentification au = new Authentification();%>

<% if(request.getAttribute("utilisateur")!=null){%>
<% u=(Utilisateur)request.getAttribute("utilisateur"); %>
<%} %>
<% if(request.getAttribute("authentification")!=null){%>
<% au=(Authentification)request.getAttribute("authentification"); %>
<%} %>
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
    #veh
    {
    display:none;
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
        background: rgba(0, 0, 0, 0.1);
        outline: none;
        border: none;
        border-bottom: 1px dotted #fff;
        color: #fff;
        border-radius: 5px;
        margin: 5px;
        font-weight: bold;
      }
      select{
        width: 100%;
        box-sizing: border-box;
        padding: 12px 5px;
        background: rgba(0, 0, 0, 0.1);
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
    <header>
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
      <form action="Inscription2Servlet" method="post">
         <div class="contenaire">
            <p style="color:red;position:absolute;">
               <% if(request.getAttribute("erreur")!=null){%>
               <%=(String)request.getAttribute("erreur")%>
               <%} %>
            </p>
         <div class="wrap">
            <h1 class="inscriTitle">Inscription</h1>
            <input type="text" readonly value=<%= a %>>
            <input type="text" name="nom" placeholder="Nom" required value=<%=u.getNom()%>>
            <input type="text" placeholder="Prenom" required name="prenom" value=<%=u.getPrenom()%>>
            <input type="date" placeholder="02-11-1999" required name="ddn" value=<%=u.getDdn()%>>
            <input type="number" name="ndt" value=<%=u.getNdt()%> placeholder="numero de telephone 06xxxxxxx">
            <% List<String> regions=DAO.toutLesRegion(); %>
               <select name="region">
	               <%for(int i=0;i<(regions.size());i++){ %>
	               <option value=<%=i+1%> ><%=regions.get(i) %></option>
	               <%} %>
               </select>
            <input type="email" placeholder="Email" required name="email" value=<%=u.getEmail()%>>
            <input type="text" placeholder="Login" required name="login" value=<%=au.getLogin()%>>
            <input type="password" placeholder="Password" required name="password"/>
            <input type="radio" name="voiture" value="oui" id="oui" />
            <label for="">oui</label>
            <input type="radio" name="voiture" value="non" id="non" checked/>
            <label for="">non</label>
            <div id="veh">
               <input type="text" name="matricule" placeholder="matricule"/>
               <input type="text" name="marque" placeholder="marque"/>
               <input type="number" name="ndp" placeholder="nombre de place"/>
            </div>
            
            <input type="submit" value="S'inscrire" />
         </div>
         </div>
      </form>
    </header>
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
        $("#oui").click(function () {
          $("#veh").show();
        });
        $("#non").click(function () {
          $("#veh").hide();
        });
      });
    </script>
  </body>
</html>
