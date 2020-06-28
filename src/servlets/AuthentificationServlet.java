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
import dao.DAO;

/**
 * Servlet implementation class AuthentificationServlet
 */
@WebServlet("/AuthentificationServlet")
public class AuthentificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthentificationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
@Override
public void init() throws ServletException {
	// TODO Auto-generated method stub
	super.init();
}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
@Override
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("login")==null || request.getParameter("password")==null)
		getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
		else if(Tools.isEmpty(request.getParameter("login")) || Tools.isEmpty(request.getParameter("password")))
		{
			request.setAttribute("Erreur", "Veuillez saisir vos coordonner correctement");
			getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
		}
		else{
			Authentification u=null;
			Utilisateur a=null;
            u=DAO.connexion(request.getParameter("login"), request.getParameter("password"));
            if(u==null)
	            {
	            request.setAttribute("Erreur", "login ou mot de passe incorrecte");
	            getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
	            }else {
		            	
		            if(u.getEtat()==false){
		            	request.setAttribute("Erreur","veuillez presenter votre carte au systeme");	
		            	getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
		            }
		            else{
		            	a=DAO.getUserByRFID(u.getId());
		            	HttpSession ses=request.getSession(true);
		            	ses.setAttribute("utilisateur", a);
		            	ses.setAttribute("authentification", u);
		            	if(!a.getMatricule().equalsIgnoreCase("**"))
		            		ses.setAttribute("vehicule", DAO.getVehicule(a.getMatricule()));
		            	
		            	response.sendRedirect("Profil");
		            }
	            } 
		}
	}
}
