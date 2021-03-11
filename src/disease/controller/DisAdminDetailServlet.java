package disease.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import disease.model.service.DiseaseService;
import disease.model.vo.Disease;
import user.model.vo.User;

/**
 * Servlet implementation class DisAdminDetailListServlet
 */
@WebServlet("/disease.ad")
public class DisAdminDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisAdminDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int diseaseNo = Integer.parseInt(request.getParameter("disease_no"));
		int currentPage = 1;
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		DiseaseService dservice = new DiseaseService();


		Disease disease = new DiseaseService().selectDisease(diseaseNo);
		
		RequestDispatcher view = null;
		if(disease != null) {
			HttpSession session = request.getSession(false);
			User loginUser = (User)session.getAttribute("loginUser");
			if(loginUser == null) {
				System.out.println("비로그인시");
			view = request.getRequestDispatcher("views/disease/diseaseDetailView.jsp");
			}else if(loginUser != null && loginUser.getUserLv() > 1) {
				System.out.println("관리자 로그인");
				view = request.getRequestDispatcher("views/disease/diseaseAdminDetailView.jsp");
			}else if(loginUser != null && loginUser.getUserLv() == 1){
				System.out.println("사용자 로그인");
				view = request.getRequestDispatcher("views/disease/diseaseDetailView.jsp");
			}
			request.setAttribute("disease", disease);
			request.setAttribute("currentPage", currentPage);
			view.forward(request, response);
			
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", diseaseNo + "번호 건강 및 질환 정보 상세조회 실패");
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
