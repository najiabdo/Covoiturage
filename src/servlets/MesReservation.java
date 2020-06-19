package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Utilisateur;
import dao.DAO;

/**
 * Servlet implementation class MesReservation
 */
@WebServlet("/MesReservation")
public class MesReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	doPost(req, resp);
    }
    
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         HttpSession ses=request.getSession(false);
         Utilisateur u=(Utilisateur)ses.getAttribute("utilisateur");
         if(ses.getAttribute("utilisateur")!=null) {
        	 if(request.getParameter("annulation")!=null && request.getParameter("id")!=null) {
  				if(request.getParameter("annulation").equalsIgnoreCase("oui")){
  					DAO.deleteReservation(Integer.parseInt(request.getParameter("id")));
  					ses.removeAttribute("reservation");
  					ses.setAttribute("reservation", DAO.getReservationByCreator(u.getIdU()));
  					getServletContext().getRequestDispatcher("/WEB-INF/mesReservation.jsp").forward(request, response);
  				}
  			}else {
  					ses.setAttribute("reservation", DAO.getReservationByCreator(u.getIdU()));
  					getServletContext().getRequestDispatcher("/WEB-INF/mesReservation.jsp").forward(request, response);
  			}
         }else {
        		getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
         }
	}

}
