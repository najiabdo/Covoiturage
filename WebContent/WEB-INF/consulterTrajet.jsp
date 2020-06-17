<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="beans.Utilisateur" %>
<%@page import="beans.Authentification" %>
<%@page import="beans.Trajet" %>
<%@page import="dao.DAO" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <body>
     <form action="">
    <%List<String> r=DAO.toutLesRegion();%>
    <label for="depart">depart :</label>
    <select name="depart" id="depart">
      <%for(int i=0;i<(r.size());i++){ %>
        <option value=<%=i+1%> ><%=r.get(i) %></option>
        <%} %>
      </select>
    <label for="arrive">arrivé :</label>
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
         Bagage autorisé 
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
         arrivé
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
      <td>
         <input type="text" readonly="readonly" value=<%=DAO.getUtilisateur(t.get(i).getIdCreateur()) %>>
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
  </body>
</html>
