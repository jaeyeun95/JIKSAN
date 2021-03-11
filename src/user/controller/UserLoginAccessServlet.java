package user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.service.UserService;


@WebServlet("/loginok")
public class UserLoginAccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     
    public UserLoginAccessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 접속 제한/해제 처리용 컨트롤러
		
		String user_id = request.getParameter("user_id");
		String ok = request.getParameter("ok");
		
		String loginok = null;
		if(ok.equals("true")) {
			loginok = "Y";
		}else {
			loginok = "N";
		}
		
		UserService uservice = new UserService();
		int result = uservice.updateLoginOk(user_id, loginok);
		
		RequestDispatcher view = null;
		if(result > 0) {  //로그인제한/해제 수정 성공시
			view = request.getRequestDispatcher("views/user/userListView.jsp");
			request.setAttribute("list", uservice.selectList());
			view.forward(request, response);
		}else {  //수정 실패시
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", user_id + " 회원 로그인 제한|해제 수정 실패");
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
