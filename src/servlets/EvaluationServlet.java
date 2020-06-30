package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Evaluation;
import beans.Utilisateur;
import dao.DAOEvaluation;

/**
 * Servlet implementation class Evaluation
 */
@WebServlet("/Evaluation")
public class EvaluationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   @Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses=request.getSession(false);
		if(ses.getAttribute("utilisateur")==null)
			getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
		else
		{
			Utilisateur u=(Utilisateur) ses.getAttribute("utilisateur");
			
			if(DAOEvaluation.getEvalusationByid(u.getIdU(), Integer.parseInt(request.getParameter("idU")))==null)
			{
				Evaluation e=new Evaluation(Boolean.parseBoolean(request.getParameter("eva")),u.getIdU(),Integer.parseInt(request.getParameter("idU")));
				DAOEvaluation.insertEvaluation(e);
				response.sendRedirect("Profil?id="+request.getParameter("idU"));
			}else {
				Evaluation e=new Evaluation(Boolean.parseBoolean(request.getParameter("eva")),u.getIdU(),Integer.parseInt(request.getParameter("idU")));
				System.out.println(e.isEvaluation());
				DAOEvaluation.updateEvaluation(e);
				response.sendRedirect("Profil?id="+request.getParameter("idU"));
			}
		}
	}
}
