package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;
import user.model.vo.User;

/**
 * Servlet implementation class NoticeDetailServlet
 */
@WebServlet("/ndetail")
public class NoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int noticeNo = Integer.parseInt(request.getParameter("notice_no"));
		int currentPage = 1;
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		NoticeService nservice = new NoticeService();
		
		nservice.addReadCount(noticeNo);
		
		Notice notice = new NoticeService().selectNotice(noticeNo);
		
		RequestDispatcher view = null;
		if(notice != null) {
			HttpSession session = request.getSession(false);
			User loginUser = (User)session.getAttribute("loginUser");
			if(loginUser == null) {
				System.out.println("비로그인시");
			view = request.getRequestDispatcher("views/notice/noticeDetailView.jsp");
			}else if(loginUser != null && loginUser.getUserLv() > 1) {
				System.out.println("관리자 로그인");
				view = request.getRequestDispatcher("views/notice/noticeAdminDetailView.jsp");
			}else if(loginUser != null && loginUser.getUserLv() == 1){
				System.out.println("사용자 로그인");
				view = request.getRequestDispatcher("views/notice/noticeDetailView.jsp");
			}
			request.setAttribute("notice", notice);
			request.setAttribute("currentPage", currentPage);
			view.forward(request, response);
			
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", noticeNo + "번 글 상세조회 실패");
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
