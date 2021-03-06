package user.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.model.service.UserService;
import user.model.vo.User;

/**
 * Servlet implementation class CryptoLoginServlet
 */
@WebServlet("/login.cp")
public class CryptoLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CryptoLoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 로그인 처리용 컨트롤러
		// 클라이언트로 부터 로그인 요청을 받아서, 전송온 아이디와 암호를 추출함

		// 1. 전송온 값에 한글이 있다면, 인코딩 처리함
		request.setCharacterEncoding("utf-8");

		// 2. 전송온 값 꺼내서 변수 또는 vo 객체에 기록 저장함
		// 전송온 값(parameter)들은 모두 request 에 기록되어 전송옴
		// String 변수 = request.getParameter("input 태그의 name 속성에 설정한 이름");
		String userId = request.getParameter("user_id");
		String userPw = request.getParameter("user_pw");
		System.out.println("확인 : " + userId + ", " + userPw);

		// 패스워드 암호화 처리함
		try {
			// 패스워드 암호화 처리를 위한 객체 생성 : 암호화 알고리즘 지정함
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			// 암호화 처리를 위해 패스워드 문자열을 byte[] 로 바꿈
			byte[] pwValues = userPw.getBytes(Charset.forName("UTF-8"));
			// byte[]을 이용해 암호화 처리함
			md.update(pwValues);
			// 암호화된 byte[]을 다시 String 으로 바꿈
			userPw = Base64.getEncoder().encodeToString(pwValues);
			System.out.println("암호화된 패스워드" + userPw + ", 글자길이 : " + userPw.length());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		// 3. User 의 service 클래스 객체 생성하고, 로그인 메소드 실행하고 결과받음

		User loginUser = new UserService().selectLogin(userId, userPw);
		System.out.println("loginUser : " + loginUser);

		// 4. 리턴된 결과를 가지고 성공/실패에 대한 뷰페이지를 선택해서 응답함(response)
		if (loginUser != null && loginUser.getLoginOk().equals("Y")) {
			// 로그인 성공시, 해당 클라이언트의 세션 객체를 생성함
			// WAS(톰켓)가 관리하는 sessionScope 영역에 로그인 요청한 사용자의
			// 세션객체가 만들어지도록 함
			HttpSession session = request.getSession();
			System.out.println("session ID : " + session.getId());
			// 필요할 경우 세션객체에 객체정보를 저장할 수도 있음. Map 방식임
			// 세션레퍼런스.setAttribute("이름", 객체);
			session.setAttribute("loginUser", loginUser);
			// 뷰페이지를 선택해서 내보냄
			response.sendRedirect("/jiksan/views/user/userLogin.jsp");
		} else {
			// 로그인 실패시 에러페이지를 내보내도록 함
			// 방법 1. 뷰페이지만 선택해서 내보냄, 페이지에 출력할 값을 함께 보낼수 없음
			// response.sendRedirect("/first/views/common/error.jsp");

			// 방법 2. 내보낼 뷰페이지를 지정하고, 뷰페이지에 출력할 값도 함께 보내려면
			// getRequestDispather("상대경로로 내보낼 뷰파일지정"), 절대경로 사용 못 함
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");

			if (loginUser == null) {
				request.setAttribute("message", "로그인 실패!");
			} else if (loginUser.getLoginOk().equals("N")) {
				request.setAttribute("message", "관리자에 의해 로그인 제한됨! 관리자에게 문의하세요.");
			}
			view.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// System.out.println("LoginServlet 클래스의 doPost() 메소드가 연결 실행됨");
		doGet(request, response);
	}

}
