package aboutDisease.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aboutDisease.model.service.DiseaseService;
import aboutDisease.model.vo.aboutDisease;

/**
 * Servlet implementation class DisAdminUpdateServlet
 */
@WebServlet("/dupdate.ad")
public class DisAdminUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisAdminUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		aboutDisease dis = new aboutDisease();
		dis.setDiseaseNo(Integer.parseInt(request.getParameter("DISEASE_NO")));
		dis.setDiseaseNm(request.getParameter("DISEASE_NM"));
		dis.setAboutDisText(request.getParameter("ABOUT_DIS_TEXT"));
		
		int result = new DiseaseService().updateDis(dis);
		
		RequestDispatcher view = null;
		if(result > 0) {
			response.sendRedirect("/jiksan/diseaseList");
			
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", dis.getDiseaseNm() + " 수정 실패.");
			view.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
