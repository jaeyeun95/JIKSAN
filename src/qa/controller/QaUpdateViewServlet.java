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
 * Servlet implementation class QaUpdateViewServlet
 */
@WebServlet("/qaupview")
public class QaUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QaUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// Qa 수정페이지 출력 처리용 컨트롤러
				request.setCharacterEncoding("utf-8");//한글처리
				int qaNo = Integer.parseInt(request.getParameter("qanum"));
				int currentPage = Integer.parseInt(request.getParameter("page"));
				
				Qa qa = new QaService().selectQa(qaNo);
				
				response.setContentType("text/html; charset=utf-8");//한글처리
				RequestDispatcher view = null;
				if(qa != null) {
					view = request.getRequestDispatcher("views/qa/qaUpdateView.jsp");
					request.setAttribute("qa", qa);
					request.setAttribute("page", currentPage);
					view.forward(request, response);
				}else {
					view = request.getRequestDispatcher("views/common/error.jsp");
					request.setAttribute("message", qaNo + "번 글 수정페이지로 이동 실패.");
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
