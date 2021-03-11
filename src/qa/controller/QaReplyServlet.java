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
 * Servlet implementation class QaReplyServlet
 */
@WebServlet("/qareply")
public class QaReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QaReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글 댓글달기 처리용 컨트롤러
				request.setCharacterEncoding("utf-8");

				int currentPage = Integer.parseInt(request.getParameter("page"));
				int qaNo = Integer.parseInt(request.getParameter("qanum"));

				// 전송받은 bnum 에 대한 정보를 조회함 : 원글인지 댓글인지 확인하기 위함
				QaService qservice = new QaService();
				
				Qa originQa = qservice.selectQa(qaNo);

				// 댓글 객체 생성과 값 기록 저장
				Qa reply = new Qa();
				reply.setQaTitle(request.getParameter("qtitle"));
				reply.setQaContent(request.getParameter("qcontent"));
				reply.setQaWriter(request.getParameter("qwriter"));
				//원글의 댓글인지, 댓글의 댓글인지에 따라 값 기록 처리함
				reply.setQaReplyLev(originQa.getQaReplyLev() + 1);
				//참조하는 원글 번호 기록
				reply.setQaRef(originQa.getQaRef());
				//참조하는 댓글 번호 기록
				if(reply.getQaReplyLev() == 2)  //원글의 댓글이면 일단 원글번호를 기록
					reply.setQaReplyRef(originQa.getQaRef());
				if(reply.getQaReplyLev() == 3) //댓글의 댓글이면 전송온 글번호를 기록
					reply.setQaReplyRef(qaNo);
				reply.setQaReplySeq(1);  //최근 댓글|대댓글이 항상 1이 되게 함
				
				//이전에 등록된 댓글|대댓글의 순번(board_reply_seq)을 1증가 처리함
				qservice.updateReplySeq(reply);
				
				//댓글 등록
				int result = qservice.insertReply(reply);
				
				if(result > 0) {
					response.sendRedirect("/jiksan/qalist?page=" + currentPage);
				}else {
					RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
					request.setAttribute("message", qaNo + "번 글에 대한 댓글 달기 실패.");
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
