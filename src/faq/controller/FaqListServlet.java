package faq.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import faq.model.service.FaqService;
import faq.model.vo.Faq;
import user.model.vo.User;

/**
 * Servlet implementation class FaqListServlet
 */
@WebServlet("/faqlist")
public class FaqListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//faq 목록보기 처리용 컨트롤러
		ArrayList<Faq> list = new FaqService().selectList();
		System.out.println("faqlist");
		RequestDispatcher view = null;
		if(list.size() > 0) {
			HttpSession session = request.getSession(false);
			User loginUser = (User)session.getAttribute("loginUser");
			if(loginUser == null) {
				System.out.println("비로그인시");
				// 비로그인상태일때
				view = request.getRequestDispatcher("views/faq/faqListView.jsp");
			}else if(loginUser != null && loginUser.getUserLv() > 1) {
					// 관리자인경우
					System.out.println("관리자로그인");
					view = request.getRequestDispatcher("views/faq/faqAdminListView.jsp");
				}else {
					//사용자 로그인된 상태
					System.out.println("사용자 로그인");
					view = request.getRequestDispatcher("views/faq/faqListView.jsp");
				}
			request.setAttribute("list", list);
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "faq 전체 조회 실패");
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
