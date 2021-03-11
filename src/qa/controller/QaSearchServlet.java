package qa.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import qa.model.service.QaService;
import qa.model.vo.Qa;
import user.model.vo.User;

/**
 * Servlet implementation class QaSearchServlet
 */
@WebServlet("/qasearch")
public class QaSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QaSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// QA 검색 처리용 컨트롤러
		
				request.setCharacterEncoding("utf-8");
				
				int currentPage = 1;
				
				if(request.getParameter("page") != null) {
					currentPage = Integer.parseInt(request.getParameter("page"));
				}
				int limit = 10;
				
				String search = request.getParameter("search");
				
				ArrayList<Qa> list = null;
				QaService qservice = new QaService();
				
				int listCount = 0;
				switch(search) {
				case "title":	String qaTitle = request.getParameter("keyword");
							list = qservice.selectSearchTitle(qaTitle);
							listCount = qservice.getSearchTitleListCount(qaTitle);
							//System.out.println(list);
							break;
				case "writer": String qaWriter = request.getParameter("keyword");
							list = qservice.selectSearchWriter(qaWriter);
							listCount = qservice.getSearchWriter(qaWriter);
							//System.out.println("글쓴이검색");
							break;
				}
				
				System.out.println("qasearch : " + listCount);
				
				//뷰에서 사용할 페이지 출력과 관련된 값 만들기
				int maxPage = (int)((double)listCount / limit + 0.9);
				//현재 페이지가 속한 페이지 그룹의 시작 페이지 값 설정
				int startPage = ((int)((double)currentPage / 10)) * 10 + 1;
				int endPage = startPage + 9;
				
				if(maxPage < endPage) {
					endPage = maxPage;
				}
				RequestDispatcher view = null;
				if(list.size() > 0) {
					view = request.getRequestDispatcher("views/qa/qaListView.jsp");
					
					request.setAttribute("list", list);
					request.setAttribute("maxPage", maxPage);
					request.setAttribute("startPage", startPage);
					request.setAttribute("endPage", endPage);
					request.setAttribute("listCount", listCount);
					request.setAttribute("currentPage", currentPage);
					view.forward(request, response);
				}else {
					view = request.getRequestDispatcher("views/common/error.jsp");
					request.setAttribute("message", search + " 항목의 검색 조회 실패.");
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
