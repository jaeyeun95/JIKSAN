package disease.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import disease.model.service.DiseaseService;
import disease.model.vo.Disease;
import user.model.vo.User;

/**
 * Servlet implementation class DiseaseSearchServlet
 */
@WebServlet("/dsearch")
public class DiseaseSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiseaseSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	      request.setCharacterEncoding("utf-8");
	      
	      int currentPage = 1;
	      
	      if(request.getParameter("page") != null) {
	         currentPage = Integer.parseInt(request.getParameter("page"));
	      }
	      int  limit = 10;
	      

	       String category = request.getParameter("category"); 
	       String keyword = request.getParameter("keyword");


	      
	      ArrayList<Disease> list = null;
	      DiseaseService dservice = new DiseaseService();
	      
	      int listCount = 0;
	      switch(category) {
	      case "diseaseNm" : String diseaseNm = request.getParameter("keyword");
	               list = dservice.selectSearchNm(diseaseNm);
	               listCount = dservice.getSearchNmListCount(diseaseNm);
	               break;
				/*
				 * case "content":String diseaseContent = request.getParameter("keyword"); list
				 * = dservice.selectSearchText01(diseaseText01); listCount =
				 * dservice.getSearchText01ListCount(diseaseContent); break;
				 */
	                        
	      }
	      
	         
	   
	      System.out.println("dsearch" + listCount);
	      //????????? ????????? ????????? ????????? ????????? ??? ?????????
	      int maxPage = (int)((double)listCount / limit + 0.9);      //12.1 page ??? 13 page ??? ?????? ???
	      //?????? ???????????? ?????? ?????????????????? ?????? ????????? ??? ??????
	      //??? : currentPage ??? 35page ??????, 10?????? ???????????? ????????? ?????? ?????????????????? 31??? ???
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
	            System.out.println("???????????????");
	            view = request.getRequestDispatcher("views/disease/diseaseListView.jsp");
	                  }else if(loginUser != null && loginUser.getUserLv() > 1) {
	                     System.out.println("????????? ?????????");
	                     view = request.getRequestDispatcher("views/disease/diseaseAdminListView.jsp");
	                  }else if(loginUser != null && loginUser.getUserLv() == 1){
	                     System.out.println("????????? ?????????");
	            view = request.getRequestDispatcher("views/disease/diseaseListView.jsp");   
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
	         request.setAttribute("message", category + "????????? ?????? ?????? ??????");
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
