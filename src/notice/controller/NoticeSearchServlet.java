package notice.controller;

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

import notice.model.service.NoticeService;
import notice.model.vo.Notice;
import user.model.vo.User;

/**
 * Servlet implementation class NoticeSearchServlet
 */
@WebServlet("/nsearch")
public class NoticeSearchServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //공지사항 검색 처리용 컨트롤러
      request.setCharacterEncoding("utf-8");
      
      int currentPage = 1;
      
      if(request.getParameter("page") != null) {
         currentPage = Integer.parseInt(request.getParameter("page"));
      }
      int  limit = 10;
      

       String category = request.getParameter("category"); 
       String keyword = request.getParameter("keyword");


      
      ArrayList<Notice> list = null;
      NoticeService nservice = new NoticeService();
      
      int listCount = 0;
      switch(category) {
      case "title" : String noticeTitle = request.getParameter("keyword");
               list = nservice.selectSearchTitle(noticeTitle);
               listCount = nservice.getSearchTitleListCount(noticeTitle);
               break;
      case "content":String noticeContent = request.getParameter("keyword");
               list = nservice.selectSearchContent(noticeContent);
               listCount = nservice.getSearchContentListCount(noticeContent);
               break;
                        
      }
      
         
   
      System.out.println("nsearch" + listCount);
      //뷰에서 사용할 페이지 출력과 관련된 값 만들기
      int maxPage = (int)((double)listCount / limit + 0.9);      //12.1 page 는 13 page 가 되게 함
      //현재 페이지가 속한 페이지그룹의 시작 페이지 값 지정
      //예 : currentPage 가 35page 이면, 10개씩 페이지를 표시할 경우 시작페이지는 31이 됨
      int startPage = ((int)((double)currentPage / 10)) * 10 + 1;
      int endPage = startPage + 9;
      
      if(maxPage < endPage) {
         endPage = maxPage;
      }
      
      
      RequestDispatcher view = null;
      if(list.size() > 0) {
         HttpSession session = request.getSession(false);
         User loginUser = (User)session.getAttribute("loginUser");
         if(loginUser == null) {
            System.out.println("비로그인시");
            view = request.getRequestDispatcher("views/notice/noticeListView.jsp");
                  }else if(loginUser != null && loginUser.getUserLv() > 1) {
                     System.out.println("관리자 로그인");
                     view = request.getRequestDispatcher("views/notice/noticeAdminListView.jsp");
                  }else if(loginUser != null && loginUser.getUserLv() == 1){
                     System.out.println("사용자 로그인");
            view = request.getRequestDispatcher("views/notice/noticeListView.jsp");   
         }
         request.setAttribute("list", list);
         request.setAttribute("currentPage", currentPage);
         request.setAttribute("maxPage", maxPage);
         request.setAttribute("startPage", startPage);
         request.setAttribute("endPage", endPage);
         request.setAttribute("listCount", listCount);
         request.setAttribute("category", category);
         request.setAttribute("keyword", keyword);
         
         view.forward(request, response);
      }else {
         view=request.getRequestDispatcher("views/common/error.jsp");
         request.setAttribute("message", category + "항목의 검색 조회 실패");
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