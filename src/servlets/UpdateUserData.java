package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Authentification;
import beans.Tools;
import beans.Utilisateur;
import beans.Vehicule;
import dao.DAO;

/**
 * Servlet implementation class UpdateUserData
 */
@WebServlet("/UpdateUserData")
public class UpdateUserData extends HttpServlet {
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	doPost(req, resp);
}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         HttpSession ses=request.getSession(false);
         
         Utilisateur u=(Utilisateur) ses.getAttribute("utilisateur");
         if(ses.getAttribute("utilisateur")!=null){
        	 
		        if((request.getParameter("nom")!=null && !Tools.isEmpty(request.getParameter("nom")) && request.getParameter("prenom")!=null && !Tools.isEmpty(request.getParameter("prenom")))
		        		||
		        		(request.getParameter("ddn")!=null && !Tools.isEmpty(request.getParameter("ddn")))
		        		||
		        		(request.getParameter("ndt")!=null && !Tools.isEmpty(request.getParameter("ndt")))
		        		||
		        		(request.getParameter("email")!=null && !Tools.isEmpty(request.getParameter("email"))) 
		        		||
		        		(request.getParameter("password")!=null && !Tools.isEmpty(request.getParameter("password")))
		        		||
		        		(request.getParameter("marque")!=null && !Tools.isEmpty(request.getParameter("marque")) &&request.getParameter("matricule")!=null && !Tools.isEmpty(request.getParameter("matricule"))&& request.getParameter("ndp")!=null && !Tools.isEmpty(request.getParameter("ndp")))
		        		||
		        		(request.getParameter("region")!=null && !Tools.isEmpty(request.getParameter("region")))){
		        	System.out.println("testtttttttttttttttttttttttttttttttttttttttttttttttt1");
		        	switch(request.getParameter("m")){
		        	    case "m1":
			        	DAO.updateNom(u.getIdU(), request.getParameter("nom"));
			        	DAO.updatePrenom(u.getIdU(), request.getParameter("prenom"));
			        	u.setNom(request.getParameter("nom"));
			        	u.setPrenom(request.getParameter("prenom"));
			        	request.setAttribute("utilisateur", u);
			        	ses.setAttribute("utilisateur",u);
			        	break;
		        	    case "m2":
		        		DAO.updateDdn(u.getIdU(), request.getParameter("ddn"));
		        		u.setDdn(request.getParameter("ddn"));
		        		request.setAttribute("utilisateur", u);
		        		ses.setAttribute("utilisateur",u);
		        	 	break;
		        	    case "m3":
		        		DAO.updateNdt(u.getIdU(), Integer.parseInt(request.getParameter("ndt")));
		        		u.setNdt(Integer.parseInt(request.getParameter("ndt")));
		        		request.setAttribute("utilisateur", u);
		        		ses.setAttribute("utilisateur",u);
		        		break;
		        	    case "m4":
		        		DAO.updateEmail(u.getIdU(), request.getParameter("email"));
		        		u.setEmail(request.getParameter("email"));
		        		request.setAttribute("utilisateur", u);
		        		ses.setAttribute("utilisateur",u);
		        		break;
		        		case "m5":
		        		DAO.updateRegion(u.getIdU(), Integer.parseInt(request.getParameter("region")));
		        		u.setidR(Integer.parseInt(request.getParameter("region")));
		        		request.setAttribute("utilisateur", u);
		        		ses.setAttribute("utilisateur",u);
		        		break;	
		        		case "m6":
		        		System.out.println("test");
		        		DAO.updateVoitureUtilisateur(u.getIdU(), request.getParameter("matricule"), request.getParameter("marque"), Integer.parseInt(request.getParameter("ndp")));
		        		u.setMatricule(request.getParameter("matricule"));
		        		Vehicule v=new Vehicule(request.getParameter("matricule"), request.getParameter("marque"), Integer.parseInt(request.getParameter("ndp")));
		        		ses.setAttribute("utilisateur",u);
		        		ses.setAttribute("vehicule",v);
		        		request.setAttribute("utilisateur", u);
		        		request.setAttribute("vehicule", v);
		        		break;
		        	    case "m7":
		        		Authentification a=(Authentification) ses.getAttribute("authentification");
		        		DAO.updatePassword(a.getId(), request.getParameter("password"));
		        		a.setPassword(request.getParameter("password"));
		        		ses.setAttribute("authentification",a);
		        		request.setAttribute("utilisateur", u);
		        		break;
		        	}
		        	getServletContext().getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
		        }
	        	
         }else {
            	getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
         }
	}

}
