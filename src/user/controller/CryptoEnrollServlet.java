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

import user.model.service.UserService;
import user.model.vo.User;

/**
 * Servlet implementation class CryptoEnrollServlet
 */
@WebServlet("/enroll.cp")
public class CryptoEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CryptoEnrollServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 암호화 처리 회원가입 컨트롤러
		// 1. 전송온 값에 한글이 있다면 인코딩 처리함
		request.setCharacterEncoding("utf-8");

		// 2. 전송온 값 꺼내서 변수 또는 vo 객체에 기록 저장함
		User user = new User();
		user.setUserId(request.getParameter("user_id"));
		
		//패스워드 추출함
		String password = request.getParameter("user_pw");		
		//패스워드 암호화 처리함
		try {
			//패스워드 암호화 처리를 위한 객체 생성 : 암호화 알고리즘 지정함
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			//암호화 처리를 위해 패스워드 문자열을 byte[] 로 바꿈
			byte[] pwValues = password.getBytes(Charset.forName("UTF-8"));
			//byte[]을 이용해 암호화 처리함
			md.update(pwValues);
			//암호화된 byte[]을 다시 String 으로 바꿈
			String cryptoPw = Base64.getEncoder().encodeToString(pwValues);
			user.setUserPw(cryptoPw);
			System.out.println("암호화된 패스워드" + cryptoPw + 
					", 글자길이 : " + cryptoPw.length());
		} catch (NoSuchAlgorithmException e) {			
			e.printStackTrace();
		}
		
		user.setUserLv(Integer.parseInt(request.getParameter("user_lv")));
		user.setUserNm(request.getParameter("user_nm"));
		user.setPhone(request.getParameter("phone"));
		user.setNickNm(request.getParameter("nick_nm"));
		user.setGender(request.getParameter("gender"));

		// 같은 이름으로 여러 개의 값이 전송온 경우
		// birthday=yyyy/mm/dd
		// String[] 배열레퍼런스 = request.getParameterValues("이름");
		// db 의 테이블의 컬럼값 기록형태가 하나의 문자열이므로
		// String[] ==> String : join() 메소드 사용
		// String 으로 들어온 년/월/일 을 Date 형으로 바꿔줌
		user.setBirthday(java.sql.Date.valueOf(String.join("-", request.getParameterValues("birthday"))));
		// 테스트
		/*String[] birthday = request.getParameterValues("birthday");
		for(String a: birthday) {
			System.out.println(a);
		}
		String b = String.join("-", birthday);
		System.out.println(b);
		
		java.sql.Date c = java.sql.Date.valueOf(b);
		System.out.println(c);
		*/
		
		/* 원래 처음에 있던거
		  user.setBirthday(java.sql.Date.valueOf(String.join("/", request.getParameterValues("birthday"))));
		*/

		// 같은 이름으로 여러 개의 값이 전송온 경우
		// address=우편번호, 기본주소, 상세주소
		// String[] 배열레퍼런스 = request.getParameterValues("이름");
		// db 의 테이블의 컬럼값 기록형태가 하나의 문자열이므로
		// String[] ==> String : join() 메소드 사용
		user.setAddress(String.join(",", request.getParameterValues("address")));

		// 3. 모델의 서비스 객체 생성하고, 메소드 실행해서 처리 결과받기
		int result = new UserService().insertUser(user);

		// 4. 받은 결과에 따라 성공/실패 페이지를 선택해서 내보냄
		if (result > 0) {
			response.sendRedirect("/jiksan/index.jsp");
		} else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "회원 가입 실패!");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
