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
 * Servlet implementation class ConsulterReservation
 */
@WebServlet("/ConsulterReservation")
public class ConsulterReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		// TODO Auto-generated method stub
    		doPost(request, response);
    	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses=request.getSession(false);
		Utilisateur u=(Utilisateur)ses.getAttribute("utilisateur");
		if(ses.getAttribute("utilisateur")!=null){
			if(request.getParameter("confirm")!=null && request.getParameter("id")!=null) {
				if(request.getParameter("confirm").equalsIgnoreCase("oui")){
					DAO.updateEtatReservation(Integer.parseInt(request.getParameter("id")),1);
					ses.removeAttribute("reservation");
					ses.setAttribute("reservation", DAO.getReservationByTrajetCreator(u.getIdU()));
					getServletContext().getRequestDispatcher("/WEB-INF/consulterLesReservation.jsp").forward(request, response);
				}else if(request.getParameter("confirm").equalsIgnoreCase("non")){
					DAO.updateEtatReservation(Integer.parseInt(request.getParameter("id")),2);
					ses.removeAttribute("reservation");
					ses.setAttribute("reservation", DAO.getReservationByTrajetCreator(u.getIdU()));
					getServletContext().getRequestDispatcher("/WEB-INF/consulterLesReservation.jsp").forward(request, response);
				}
			}else {
				if(ses.getAttribute("vehicule")!=null) {
					ses.setAttribute("reservation", DAO.getReservationByTrajetCreator(u.getIdU()));
					System.out.println(u.getIdU());
					getServletContext().getRequestDispatcher("/WEB-INF/consulterLesReservation.jsp").forward(request, response);
			     }else {
			    	//retour vers la page precedente
			     }
			}
		}else {
			getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
		}
	}

}
