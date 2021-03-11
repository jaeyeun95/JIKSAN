package qa.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qa.model.service.QaService;

/**
 * Servlet implementation class QaDeleteServlet
 */
@WebServlet("/qadelete")
public class QaDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QaDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글(원글, 댓글, 대댓글) 삭제 처리용 컨트롤러
		
				int qaNo = Integer.parseInt(request.getParameter("qanum"));
				int QaReplyLev = Integer.parseInt(request.getParameter("level"));
				
				if(new QaService().deleteQa(qaNo, QaReplyLev) > 0) {
					
					response.sendRedirect("/jiksan/qalist?page=1");
				}else {
					RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
					request.setAttribute("message", qaNo + "번 글 삭제 실패.");
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
