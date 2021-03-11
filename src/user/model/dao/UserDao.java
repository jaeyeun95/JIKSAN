package user.model.dao;

import static common.JDBCTemp.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import user.model.vo.User;

//쿼리문 작성해서 db로 전달해서 실행하고 결과받음
//select 문은 받은 결과(ResultSet)를 vo 객체에 옮겨 저장(결과매핑)해서 리턴 처리함
public class UserDao {
	public UserDao() {}
	
//컬럼순서 DB랑 동일해야함!	
	//로그인 처리용 메소드 : select
	public User selectLogin(Connection conn, String userId, String userPw) {
		User u = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from tb_user "
				+ "where user_id = ? and user_pw = ?";
		
		try {
			//미완성된 쿼리문을 가지고 객체 먼저 생성함
			pstmt = conn.prepareStatement(query);
			//객체 생성 후에 쿼리문을 완성시킴
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			
			//쿼리문 실행시키고 결과 받음
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				u = new User();
				
				u.setUserNo(rset.getInt("user_no"));
				u.setUserId(rset.getString("user_id"));
				u.setUserPw(rset.getString("user_pw"));
				u.setUserNm(rset.getString("user_nm"));
				u.setBirthday(rset.getDate("birthday"));
				u.setGender(rset.getString("gender"));
				u.setPhone(rset.getString("phone"));
				u.setAddress(rset.getString("address"));
				u.setNickNm(rset.getString("nick_nm"));
				u.setUserLv(rset.getInt("user_lv"));
				u.setLoginOk(rset.getString("loginok"));
				u.setEnrollDate(rset.getDate("enroll_date"));
				u.setLastModified(rset.getDate("last_modified"));				
								
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return u;
	}
	
	//회원 가입 처리용 메소드 : insert
	public int insertUser(Connection conn, User user) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into tb_user "
				+ "values (seq_userno.nextval, ?, ?, ?, ?, ?, ?, ?, ?, default, default, sysdate, sysdate)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPw());
			pstmt.setString(3, user.getUserNm());
			pstmt.setDate(4, user.getBirthday());
			pstmt.setString(5, user.getGender());
			pstmt.setString(6, user.getPhone());
			pstmt.setString(7, user.getAddress());
			pstmt.setString(8, user.getNickNm());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//회원 탈퇴 처리용 메소드 : delete
	public int deleteUser(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from tb_user where user_id = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);

			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//회원 정보 보기 처리용 메소드 : select
	public User selectUser(Connection conn, String userId) {
		User u = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from tb_user where user_id = ?";
		
		try {
			//미완성된 쿼리문을 가지고 객체 먼저 생성함
			pstmt = conn.prepareStatement(query);
			//객체 생성 후에 쿼리문을 완성시킴
			pstmt.setString(1, userId);			
			
			//쿼리문 실행시키고 결과 받음
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				u = new User();
				
				u.setUserId(rset.getString("user_id"));
				u.setUserPw(rset.getString("user_pw"));
				u.setUserNm(rset.getString("user_nm"));
				u.setBirthday(rset.getDate("birthday"));
				u.setGender(rset.getString("gender"));
				u.setPhone(rset.getString("phone"));
				u.setAddress(rset.getString("address"));
				u.setNickNm(rset.getString("nick_nm"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return u;
	}
	
	//회원 정보 수정 처리용 메소드 : update
	public int updateUser(Connection conn, User user) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update tb_user set user_pw = ?, phone = ?, address = ?,  "
				   + "user_id = ?, user_lv = ?, user_nm = ?, gender = ?, nick_nm = ?, last_modified = sysdate where user_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user.getUserPw());
			pstmt.setString(2, user.getPhone());
			pstmt.setString(3, user.getAddress());
			pstmt.setString(4, user.getUserId());
			pstmt.setInt(5, user.getUserLv());
			pstmt.setString(6, user.getUserNm());
			pstmt.setString(7, user.getGender());
			pstmt.setString(8, user.getNickNm());
			pstmt.setString(9, user.getUserId());
			pstmt.setInt(9, user.getUserNo());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//관리자용 회원 전체 조회 처리용 메소드 : select
	public ArrayList<User> selectList(Connection conn){
		ArrayList<User> list = new ArrayList<User>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from tb_user";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				User u = new User();
				
				u.setUserNo(rset.getInt("user_no"));
				u.setUserId(rset.getString("user_id"));
				u.setUserPw(rset.getString("user_pw"));
				u.setUserNm(rset.getString("user_nm"));
				u.setBirthday(rset.getDate("birthday"));
				u.setGender(rset.getString("gender"));
				u.setPhone(rset.getString("phone"));
				u.setAddress(rset.getString("address"));
				u.setNickNm(rset.getString("nick_nm"));
				u.setEnrollDate(rset.getDate("enroll_date"));
				u.setLastModified(rset.getDate("last_modified"));
				u.setLoginOk(rset.getString("loginok"));
								
				list.add(u);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	
	//아이디 중복체크
	public int selectCheckId(Connection conn, String userId) {
		int idcount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select count(user_id) from tb_user where user_id = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				idcount = rset.getInt(1);
				System.out.println("idcount : " + idcount);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}		
		
		return idcount;
	}
	
	//닉네임 중복체크
	public int selectCheckNnm(Connection conn, String nickNm) {
		int nnmcount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select count(nick_nm) from tb_user where nick_nm = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nickNm);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				nnmcount = rset.getInt(1);
				System.out.println("nnmcount : " + nnmcount);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}		
		
		return nnmcount;
	}

		public int updateLoginOk(Connection conn, String user_id, String loginok) {
			int result = 0;
			PreparedStatement pstmt = null;
			
			String query = "update tb_user set loginok = ? where user_id = ?";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, loginok);
				pstmt.setString(2, user_id);					
	
				result = pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			
			return result;
		}

}





