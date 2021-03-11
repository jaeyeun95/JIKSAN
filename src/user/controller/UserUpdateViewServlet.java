package user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;
import user.model.vo.User;
/**
 * Servlet implementation class UserUpdateViewServlet
 */
@WebServlet("/uupview")
public class UserUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원 정보 수정 페이지를 내보내는 컨트롤러
		//1. 전송온 값에 한글이 있으면, 인코딩 처리함
		//2. 전송온 값 꺼내서 변수 또는 vo 객체에 기록 저장함
		String userId = request.getParameter("user_id");
		
		//3. 서비스 객체 생성하고, 회원정보 조회하는 메소드 실행해서 결과 받기
		User user = new UserService().selectUser(userId);
		
		//4. 반환된 결과를 가지고 성공/실패에 대한 뷰페이지를 선택해서 내보냄
		RequestDispatcher view = null;
		if(user != null) {
			view = request.getRequestDispatcher("views/user/userUpdate.jsp");
			request.setAttribute("user", user);
			view.forward(request, response);
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", userId + " 회원님의 정보가 존재하지 않습니다.");
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




