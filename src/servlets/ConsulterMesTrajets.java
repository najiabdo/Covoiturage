package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Trajet;
import beans.Utilisateur;
import dao.DAO;

/**
 * Servlet implementation class ConsulterMesTrajets
 */
@WebServlet("/ConsulterMesTrajets")
public class ConsulterMesTrajets extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	doPost(req, resp);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses=request.getSession(false);
        Utilisateur u=(Utilisateur)ses.getAttribute("utilisateur");
        if(ses.getAttribute("utilisateur")!=null) {
       	 if(request.getParameter("annulation")!=null && request.getParameter("id")!=null) {
 				if(request.getParameter("annulation").equalsIgnoreCase("oui")){
 					DAO.removeTrajet(Integer.parseInt(request.getParameter("id")));
 					List<Trajet> t=DAO.allTrajet(u.getIdU());
 					request.setAttribute("listTrajet",t);
 					getServletContext().getRequestDispatcher("/WEB-INF/mesTrajet.jsp").forward(request, response);
 				}else {
 					List<Trajet> t=DAO.allTrajet(u.getIdU());
 					request.setAttribute("listTrajet",t);
  					getServletContext().getRequestDispatcher("/WEB-INF/mesTrajet.jsp").forward(request, response);
 				}
 		  }else {
 				List<Trajet> t=DAO.allTrajet(u.getIdU());
				request.setAttribute("listTrajet",t);
 				getServletContext().getRequestDispatcher("/WEB-INF/mesTrajet.jsp").forward(request, response);
 			}
        }else {
       		getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }
	}

}
