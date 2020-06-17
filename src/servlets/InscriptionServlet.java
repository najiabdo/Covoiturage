package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

/**
 * Servlet implementation class InscriptionServlet
 */
@WebServlet("/InscriptionServlet")
public class InscriptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InscriptionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		if(request.getParameter("id")!=null)
		{
			if(DAO.existId(request.getParameter("id")))//id deja existant
			{
				if(DAO.usedId(request.getParameter("id")))			
					getServletContext().getRequestDispatcher("/WEB-INF/inscription1.jsp").forward(request, response);   
				else
				{
					HttpSession s=request.getSession(true);
					s.setAttribute("id",request.getParameter("id"));
					s.setAttribute("regions", DAO.toutLesRegion());
					getServletContext().getRequestDispatcher("/WEB-INF/inscription2.jsp").forward(request, response);   
				}
			}else
				getServletContext().getRequestDispatcher("/WEB-INF/inscription1.jsp").forward(request, response);   	
		}else
			getServletContext().getRequestDispatcher("/WEB-INF/inscription1.jsp").forward(request, response);     
	}

}
