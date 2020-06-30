package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import beans.Utilisateur;
import beans.Vehicule;
import dao.DAO;
import dao.DAOEvaluation;

/**
 * Servlet implementation class Profil
 */
@WebServlet("/Profil")
public class Profil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 if(request.getParameter("id")!=null)
         {
        	Utilisateur u=DAO.getUserByIDU(Integer.parseInt(request.getParameter("id")));
        	request.setAttribute("utilisateur", u);
        	request.setAttribute("like", DAOEvaluation.countLike(u.getIdU()));
        	request.setAttribute("dislike", DAOEvaluation.countDislike(u.getIdU()));
        	getServletContext().getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
         }else {
        	 response.sendRedirect("acceuil.jsp");
         }
	}

}
