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
 * Servlet implementation class QaOriginInsertServlet
 */
@WebServlet("/qainsert")
public class QaOriginInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QaOriginInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// Qa 원글 등록 처리용 컨트롤러
				
				RequestDispatcher view = null;
				
				request.setCharacterEncoding("utf-8");	//한글로받고
				// 전송 온 값 꺼내서 변수 또는 VO 객체에 기록 저장
				Qa qa = new Qa();
				
				qa.setQaTitle(request.getParameter("qtitle"));
				qa.setQaWriter(request.getParameter("qwriter"));
				qa.setQaContent(request.getParameter("qcontent"));


				// 모델의 서비스 객체 생성하고, 메소드 실행하고 결과받기
				int result = new QaService().insertQa(qa);

				//  받은 결과를 가지고 성공/실패에 대한 뷰를 선택해서 내보냄
				if (result > 0) { // 게시글 원글 등록이 성공했다면
					response.sendRedirect("/jiksan/qalist?page=1");
				} else {
					view = request.getRequestDispatcher("views/common/error.jsp");
					request.setAttribute("message", "게시글 원글 등록 실패!");
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
