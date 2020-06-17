<% HttpSession ses=request.getSession(false); String
a=(String)ses.getAttribute("id"); %>
<%@page import="java.util.ArrayList" %>
<%@page import="beans.Utilisateur" %>
<%@page import="beans.Authentification" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <style type="text/css">
    #veh
    {
    display:none;
    }
    
    </style>
  </head>
  <body>
    <p style="color:red;">
    <% if(request.getAttribute("erreur")!=null){%>
    <%=(String)request.getAttribute("erreur")%>
    <%} %></p>
    
    <%! Utilisateur u=new Utilisateur();%>
    <%! Authentification au = new Authentification();%>
    
    <% if(request.getAttribute("utilisateur")!=null){%>
    <% u=(Utilisateur)request.getAttribute("utilisateur"); %>
    <%} %>
    <% if(request.getAttribute("authentification")!=null){%>
    <% au=(Authentification)request.getAttribute("authentification"); %>
    <%} %>
     
    <p>id de votre carte est :</p>
    <%= a %>
    <form action="Inscription2Servlet" method="post">
      <label for="nom">nom :</label>
      <input type="text" name="nom" placeholder="ex : NAJI" value=<%=u.getNom()%>>
      <hr />
      <label for="prenom">prenom :</label>
      <input type="text" name="prenom" placeholder="Martin" value=<%=u.getPrenom()%>>
      <hr />
      <label for="ddn">date de naissance :</label>
      <input type="date" name="ddn" placeholder="09-10-2000" value=<%=u.getDdn()%>>
      <hr />
      <label for="ndt">numero de telephone :</label>
      <input type="number" name="ndt" value=<%=u.getNdt()%>>
      <hr />
      <label for="email">email :</label>
      <input type="email" name="email" placeholder="xyz@domaine.com" value=<%=u.getEmail()%>>
      <hr />
      <label for="login">login :</label>
      <input type="text" name="login" value=<%=au.getLogin()%>>
      <hr />
      <label for="password">password :</label>
      <input type="password" name="password"/>
      <hr />
      <h3>avez vous une voiture ?</h3>
      <input type="radio" name="voiture" value="oui" id="oui" />
      <label for="">oui</label>
      <input type="radio" name="voiture" value="non" id="non" checked/>
      <label for="">non</label>
      <div id="veh">
        <label for="matricule">matricule :</label>
        <input type="text" name="matricule" />
        <label for="marque">marque :</label>
        <input type="text" name="marque" />
        <label for="ndp">nombre de place :</label>
        <input type="number" name="ndp" />
      </div>
      <hr />
      <% ArrayList<String> regions=(ArrayList<String>)ses.getAttribute("regions"); %>
      <select name="region">
      <%for(int i=0;i<(regions.size());i++){ %>
        <option value=<%=i+1%> ><%=regions.get(i) %></option>
        <%} %>
      </select>
      
      
      <input type="submit" name="" id="" />
    </form>

    <script src="jquery-3.4.1.js"></script>
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
