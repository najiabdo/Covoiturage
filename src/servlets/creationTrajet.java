package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Cartiers;
import beans.Tools;
import beans.Trajet;
import beans.Utilisateur;
import beans.Vehicule;
import dao.DAO;

/**
 * Servlet implementation class creationTrajet
 */
@WebServlet("/creationTrajet")
public class creationTrajet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
@Override
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       HttpSession ses=request.getSession(false);
       String erreur="**";
       if(ses==null)
       {
    	   //erreur
    	   getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
       }
       else
       {
    	   Vehicule v=(Vehicule) ses.getAttribute("vehicule");
    	   if(v==null)
    	   {
    		   //retour vers la page d'acceuil avec message d'erreur vous n'etes pas un conducteur
    	   }
    	   else
    	   {
    		   if(request.getParameter("regionDepart")!=null && request.getParameter("cartierDepart")!=null && request.getParameter("regionArrive")!=null && request.getParameter("cartierArrive")!=null && request.getParameter("ddDepart")!=null && request.getParameter("bagage")!=null && request.getParameter("prix")!=null && !Tools.isEmpty(request.getParameter("regionDepart")) && !Tools.isEmpty(request.getParameter("cartierDepart")) && !Tools.isEmpty(request.getParameter("regionArrive")) && !Tools.isEmpty(request.getParameter("cartierArrive")) && !Tools.isEmpty(request.getParameter("ddDepart")) && !Tools.isEmpty(request.getParameter("bagage")) && !Tools.isEmpty(request.getParameter("prix")))
    		   {
                   Utilisateur u=(Utilisateur) ses.getAttribute("utilisateur");
                   Cartiers cDepart=new Cartiers(request.getParameter("cartierDepart"), Integer.parseInt(request.getParameter("regionDepart")));
                   Cartiers cArrive=new Cartiers(request.getParameter("cartierArrive"), Integer.parseInt(request.getParameter("regionArrive")));
                   int idd=DAO.creeCartier(cDepart);
                   int ida=DAO.creeCartier(cArrive);
                   System.out.println(idd+""+ida);
    			   Trajet t=new Trajet(request.getParameter("bagage").equalsIgnoreCase("oui"),Integer.parseInt(request.getParameter("prix")),request.getParameter("ddDepart"),u.getIdU(),idd,ida);
    			   DAO.creeTraget(t);
    			   request.setAttribute("erreur", "cree avec succes");
    			   getServletContext().getRequestDispatcher("/WEB-INF/creeTrajet.jsp").forward(request, response);
    		   }else {
    			   //erreur
    			   getServletContext().getRequestDispatcher("/WEB-INF/creeTrajet.jsp").forward(request, response);
    		   }
    	   }
       }
	}

}
//probleme à regler
//la date de depart 
//les erreur de retour