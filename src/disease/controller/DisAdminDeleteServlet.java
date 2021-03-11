package disease.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import disease.model.service.DiseaseService;

/**
 * Servlet implementation class DisAdminDeleteServlet
 */
@WebServlet("/ddelete.ad")
public class DisAdminDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisAdminDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * int diseaseNo = Integer.parseInt(request.getParameter("no"));
		 * 
		 * int result = new DiseaseService().deleteDisease(diseaseNo);
		 * 
		 * if(result > 0) { String renameFileName = request.getParameter("rfile");
		 * if(renameFileName != null) { String savePath =
		 * request.getSession().getServletContext().getRealPath(
		 * "/resources/disease_files"); new File(savePath + "\\" +
		 * renameFileName).delete(); } response.sendRedirect("/jiksan/dlist"); }else {
		 * RequestDispatcher view =
		 * request.getRequestDispatcher("views/common/error.jsp");
		 * request.setAttribute("message", diseaseNo + " 삭제 실패"); view.forward(request,
		 * response);
		 */
		
		int diseaseNo = Integer.parseInt(request.getParameter("diseasenum"));
		int DiseaseReplyLev = Integer.parseInt(request.getParameter("level"));
		
		if(new DiseaseService().deleteDisease(diseaseNo, DiseaseReplyLev) > 0) {
			
			response.sendRedirect("/jiksan/diseaselist?page=1");
		}else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", diseaseNo + "글 삭제 실패.");
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
