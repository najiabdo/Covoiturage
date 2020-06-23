package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Reservation;
import beans.Trajet;
import beans.Utilisateur;
import beans.Vehicule;
import dao.DAO;

/**
 * Servlet implementation class rejoidreTrajet
 */
@WebServlet("/rejoidreTrajet")
public class rejoidreTrajet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

@Override
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	doPost(request, response);
}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses=request.getSession(false);
		if(ses.getAttribute("utilisateur")!=null)
		{
			if(request.getParameter("confirm").equalsIgnoreCase("oui")){
				Trajet t=DAO.getTrajetById(Integer.parseInt(request.getParameter("idTT")));
				Utilisateur u=(Utilisateur)ses.getAttribute("utilisateur");
				Reservation r=new Reservation(u.getIdU(),t.getIdT());
				Vehicule v=DAO.getVehiculeByIdU(u.getIdU());
				if((int) v.getNdp()>DAO.nbrDePassager(t.getIdT())){   
					if(!DAO.isInTrajet(t.getIdT(),u.getIdU())){
						DAO.creeReservation(r);
						ses.removeAttribute("tt");
						response.sendRedirect("ConsulterTrajet");
					}else {
						ses.removeAttribute("tt");
					    response.sendRedirect("ConsulterTrajet");
					}
				}else {
					//pas de place disponible
				}
			}else {
				response.sendRedirect("ConsulterTrajet");
			}
		}else {
			getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
		}
	}

}
