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
 * Servlet implementation class QaReplyUpdateServlet
 */
@WebServlet("/qareplyup")
public class QaReplyUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QaReplyUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// 댓글과 대댓글 수정 처리용 컨트롤러
				request.setCharacterEncoding("utf-8");
				
				int currentPage = Integer.parseInt(request.getParameter("page"));
				
				Qa reply = new Qa();
				reply.setQaNo(Integer.parseInt(request.getParameter("qanum")));
				reply.setQaTitle(request.getParameter("qtitle"));
				reply.setQaContent(request.getParameter("qcontent"));
				
				int result = new QaService().updateReply(reply);
				
				if(result > 0) {
					response.sendRedirect("/jiksan/qalist?page=" + currentPage);
				}else {
					RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
					request.setAttribute("message", reply.getQaNo() + "번 댓글 수정 실패.");
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
