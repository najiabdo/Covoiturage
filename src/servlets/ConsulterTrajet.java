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
import dao.DAO;

/**
 * Servlet implementation class rejoidreTrajet
 */
@WebServlet("/ConsulterTrajet")
public class ConsulterTrajet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
@Override
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	doPost(request, response);
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses = request.getSession(false);
		List<Trajet> t=null;
		Trajet tt=null;
			if(request.getParameter("idTT")==null)
			{
				if(request.getParameter("depart")!=null && request.getParameter("arrive")!=null)
				{
					   t=DAO.rechercherTrajets(Integer.parseInt(request.getParameter("depart")), Integer.parseInt(request.getParameter("arrive")));		
						request.setAttribute("t", t);
						getServletContext().getRequestDispatcher("/WEB-INF/consulterTrajet.jsp").forward(request, response);   
				    
				}else {
					t=DAO.allTrajet();
					request.setAttribute("t", t);
					getServletContext().getRequestDispatcher("/WEB-INF/consulterTrajet.jsp").forward(request, response);   
				}
	        }  
			else
			{
				tt=DAO.getTrajetById(Integer.parseInt(request.getParameter("idTT")));
				ses.setAttribute("tt", tt);
				request.setAttribute("deja", "deja inscrit");
				getServletContext().getRequestDispatcher("/WEB-INF/infoTrajet.jsp").forward(request, response); 
			}
		
	}

}
