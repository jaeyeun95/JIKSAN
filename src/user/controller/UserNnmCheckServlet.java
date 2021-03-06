package user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;

/**
 * Servlet implementation class MemberIdCheckServlet
 */
@WebServlet("/nnmchk")
public class UserNnmCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserNnmCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원가입시 아이디 중복 확인 처리용 컨트롤러
		// ajax 로 요청온 것임
		
		String nickNm = request.getParameter("nick_nm");
		
		int nnmcount = new UserService().selectCheckNnm(nickNm);
		
		String returnValue = null;
		if(nnmcount == 0) {
			returnValue = "ok";
		}else {
			returnValue = "dup";
		}
			
		//ajax 는 response 를 이용해서 출력스트림 만들어서 네트워크 출력 처리함
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(returnValue);
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
