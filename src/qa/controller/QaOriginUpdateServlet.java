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
 * Servlet implementation class QaOriginUpdateServlet
 */
@WebServlet("/qaoriginup")
public class QaOriginUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QaOriginUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글 원글 수정 처리용 컨트롤러
				request.setCharacterEncoding("utf-8");//한글처리

				//  전송 온 값 꺼내서 변수 또는 VO 객체에 기록 저장
				Qa qa = new Qa();
				qa.setQaTitle(request.getParameter("qtitle"));
				qa.setQaContent(request.getParameter("qcontent"));
				qa.setQaNo(Integer.parseInt(request.getParameter("qanum")));
				

				//모델의 서비스 객체 생성하고, 메소드 실행하고 결과받기
				int result = new QaService().updateOrigin(qa);

				response.setContentType("text/html; charset=utf-8");
				//뷰에담고
				RequestDispatcher view = null;
				// 
				if (result > 0) { // 공지글 등록이 성공했다면
					response.sendRedirect("/jiksan/qalist?page=" + Integer.parseInt(request.getParameter("page")));
				} else {
					view = request.getRequestDispatcher("views/common/error.jsp");
					request.setAttribute("message", qa.getQaNo() + " 번 게시글 수정 실패!");
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
