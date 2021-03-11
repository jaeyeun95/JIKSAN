package qa.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qa.model.service.QaService;
import qa.model.vo.Qa;

/**
 * Servlet implementation class QaDetailServlet
 */
@WebServlet("/qadetail")
public class QaDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QaDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글 상세보기 처리용 컨트롤러
				int qaNo = Integer.parseInt(request.getParameter("qanum"));
				int currentPage = 1;
				if(request.getParameter("page") != null)
					currentPage = Integer.parseInt(request.getParameter("page"));
				
				
				QaService qservice = new QaService();
					
				//해당 게시글 조회수 1 증가 처리함
				qservice.addReadCount(qaNo);
				
				//해당 게시글 조회해 옴
				Qa qa = qservice.selectQa(qaNo);
				
				RequestDispatcher view = null;
				if(qa != null) {
					view = request.getRequestDispatcher("views/qa/qaDetailView.jsp");
					request.setAttribute("qa", qa);
					request.setAttribute("currentPage", currentPage);
					view.forward(request, response);
				}else {
					view = request.getRequestDispatcher("views/common/error.jsp");
					request.setAttribute("message", qaNo + "번 게시글 상세조회 실패.");
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
