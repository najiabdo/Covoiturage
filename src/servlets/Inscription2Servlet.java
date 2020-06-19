package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Authentification;
import beans.Cartiers;
import beans.Tools;
import beans.Utilisateur;
import beans.Vehicule;
import dao.DAO;

@WebServlet("/Inscription2Servlet")
public class Inscription2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;    

	/*
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req,resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String erreur="**";
	    HttpSession ses=request.getSession(false);
	    String id=(String) ses.getAttribute("id");
	    Vehicule v=null;
	    Authentification a=null;
	    Utilisateur u=null;
	    //si un utilisateur essaie de passer a cette servlet sans utiliser la premiere (InscriptionServlet)
	    if(ses.getAttribute("id")!=null)
	    //controle de saisie
		   {
	    	
	    	if(request.getParameter("nom")!=null && request.getParameter("prenom")!=null && request.getParameter("ddn")!=null && request.getParameter("ndt")!=null && request.getParameter("email")!=null && request.getParameter("login")!=null && request.getParameter("password")!=null && request.getParameter("voiture")!=null && request.getParameter("region")!=null && !Tools.isEmpty(request.getParameter("nom")) && !Tools.isEmpty(request.getParameter("prenom")) && !Tools.isEmpty(request.getParameter("ddn")) && !Tools.isEmpty(request.getParameter("ndt")) && !Tools.isEmpty(request.getParameter("email")) && !Tools.isEmpty(request.getParameter("login")) && !Tools.isEmpty(request.getParameter("password")) && !Tools.isEmpty(request.getParameter("voiture")) && !Tools.isEmpty(request.getParameter("region")))
			   {
	    		v=new Vehicule();
			   if(request.getParameter("voiture").equalsIgnoreCase("oui"))
		    	{
					   if(request.getParameter("matricule")!=null && request.getParameter("marque")!=null && request.getParameter("ndp")!=null)
						   {
						     if(Tools.isInt(request.getParameter("ndp")))
						     {
						      v.setMarque(request.getParameter("marque"));
					          v.setMatricule(request.getParameter("matricule"));
					          v.setNdp(Integer.parseInt(request.getParameter("ndp")));
						     }else {
						    	 erreur+="**Veuillez saisir le nombre de place (entier) <br>";
						     }
				           }else{
				        	   erreur+="**Veuillez remplire les champs vide <br>";
				           }
		    	}else
		    	{
		    		v.setMatricule("**");
		    	}
			   
			   //authentification
			   if(request.getParameter("password").length()>40)
				   erreur+="**Vous avez depassé la taille maximale du mot de passe (max 40) <br>";
			   if(request.getParameter("password").length()<7)
				   erreur+="**La taille minimale du mot de passe est 8 <br>";
			   if(DAO.existLogin(request.getParameter("login")))
				   {
				   erreur+="**Ce login est deja utilisé <br>";
				   }
			   else
			   {
				   if(request.getParameter("password").length()<40 && request.getParameter("password").length()>7)
			          a=new Authentification(id, request.getParameter("password"), request.getParameter("login"));			   
			   }
			    //utilisateur
			   if(DAO.existEmail(request.getParameter("email")))
			    	erreur+="**Cette email est deja utilisé <br>";
			    if(Tools.isInt(request.getParameter("ndt")) && Integer.parseInt(request.getParameter("ndt"))<=799999999 && Integer.parseInt(request.getParameter("ndt"))>=600000000)
			      {
			    	if(!DAO.existndt(Integer.parseInt(request.getParameter("ndt"))))
			    	{
			    	if(!DAO.existEmail(request.getParameter("email")))
			    	 u=new Utilisateur(request.getParameter("nom"), request.getParameter("prenom"),request.getParameter("ddn"), (long)Integer.parseInt(request.getParameter("ndt")), request.getParameter("email"), id,Integer.parseInt(request.getParameter("region")),v.getMatricule());
			    	}else
			    	{
			    		erreur+="**le numero de telephone est deja utilisé <br>";
			    	}
			    }else{
			    	  erreur+="**Veuiller saisir un numero de telephone valide <br>";
			      }
			    if(erreur.equalsIgnoreCase("**")) {
			    //insertion dans la base
			    if(request.getParameter("voiture").equalsIgnoreCase("oui"))
			    DAO.creeVehicule(v);
		    	DAO.updateAuthentification(a);
		    	DAO.creeUtilisateur(u);
		    	ses.invalidate();
			    }
			    else
			    {
			    	a=new Authentification(id, request.getParameter("password"), request.getParameter("login"));	
			    	u=new Utilisateur(request.getParameter("nom"), request.getParameter("prenom"),request.getParameter("ddn"), (long)Integer.parseInt(request.getParameter("ndt")), request.getParameter("email"), id,Integer.parseInt(request.getParameter("region")),v.getMatricule());
			    	request.setAttribute("erreur", erreur);
			    	request.setAttribute("utilisateur", u);
			    	request.setAttribute("authentification", a);
			    	getServletContext().getRequestDispatcher("/WEB-INF/inscription2.jsp").forward(request, response);
			    }
			   	
			   	}
		else
			{
			getServletContext().getRequestDispatcher("/WEB-INF/inscription2.jsp").forward(request, response);}
		   }
	    else
	    	getServletContext().getRequestDispatcher("/WEB-INF/inscription1.jsp").forward(request, response);
	}
}
