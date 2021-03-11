package qa.model.dao;

import static common.JDBCTemp.close;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import qa.model.vo.Qa;

public class QaDao {
	public QaDao() {}

	public ArrayList<Qa> selectList(Connection conn, int currentPage, int limit) {
		ArrayList<Qa> list = new ArrayList<Qa>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT * " + 
				"FROM (SELECT ROWNUM RNUM, QA_NO, QA_TITLE, QA_WRITER,  " + 
				"                        QA_CONTENT, " + 
				"                        QA_REF, QA_REPLY_REF,  " + 
				"                        QA_REPLY_LEV, QA_REPLY_SEQ, QA_READCOUNT,  " + 
				"                        QA_DATE " + 
				"            FROM (SELECT * FROM TB_QA " + 
				"                      ORDER BY QA_REF DESC, QA_REPLY_REF DESC,  " + 
				"                                     QA_REPLY_LEV ASC, QA_REPLY_SEQ ASC)) " + 
				"WHERE  RNUM >= ? AND RNUM <= ?";
		
		int startRow = (currentPage - 1) * limit + 1;  //3 page 이면 시작행은 21
		int endRow = startRow + limit - 1;   //3 page 이면 끝행은 30
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Qa qa = new Qa();
				
				qa.setQaNo(rset.getInt("qa_no"));
				qa.setQaWriter(rset.getString("qa_writer"));
				qa.setQaTitle(rset.getString("qa_title"));
				qa.setQaContent(rset.getString("qa_content"));
				qa.setQaRef(rset.getInt("qa_ref"));
				qa.setQaReplyLev(rset.getInt("qa_reply_lev"));
				qa.setQaReplyRef(rset.getInt("qa_reply_ref"));
				qa.setQaReplySeq(rset.getInt("qa_reply_seq"));
				qa.setQaReadCount(rset.getInt("qa_readcount"));
				qa.setQaDate(rset.getDate("qa_date"));
								
				list.add(qa);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int getListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from tb_qa";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}

	public int addReadCount(Connection conn, int qaNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update tb_qa "
				+ "set qa_readcount = qa_readcount + 1 "
				+ "where qa_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, qaNo);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public Qa selectQa(Connection conn, int qaNo) {
		Qa qa = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from tb_qa where qa_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, qaNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				qa = new Qa();
				
				qa.setQaNo(qaNo);
				qa.setQaWriter(rset.getString("qa_writer"));
				qa.setQaTitle(rset.getString("qa_title"));
				qa.setQaContent(rset.getString("qa_content"));
				qa.setQaRef(rset.getInt("qa_ref"));
				qa.setQaReplyLev(rset.getInt("qa_reply_lev"));
				qa.setQaReplyRef(rset.getInt("qa_reply_ref"));
				qa.setQaReplySeq(rset.getInt("qa_reply_seq"));
				qa.setQaReadCount(rset.getInt("qa_readcount"));
				qa.setQaDate(rset.getDate("qa_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return qa;
	}

	public int insertOriginQa(Connection conn, Qa qa) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into tb_qa values ("
				+ "(select max(qa_no) + 1 from tb_qa), ?, ?, ?, "
				+ "(select max(qa_no) + 1 from tb_qa), null, "
				+ "default, default, default, default)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, qa.getQaWriter());
			pstmt.setString(2, qa.getQaTitle());
			pstmt.setString(3, qa.getQaContent());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateReplySeq(Connection conn, Qa reply) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update tb_qa set "
				+ "qa_reply_seq = qa_reply_seq + 1 ";
		
		if(reply.getQaReplyLev() == 2) {
			query += "where qa_ref = ? and qa_reply_lev = ?";
		}
		if(reply.getQaReplyLev() == 3) {
			query += "where qa_ref = ? and qa_reply_lev = ? "
					+ "and qa_reply_ref = ?";
		}
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reply.getQaRef());
			pstmt.setInt(2, reply.getQaReplyLev());
			if(reply.getQaReplyLev() == 3) {
				pstmt.setInt(3, reply.getQaReplyRef());
			}
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertReply(Connection conn, Qa reply) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into tb_qa values ("
				+ "(select max(qa_no) + 1 from tb_qa), "
				+ "?, ?, ?, ?, ";
		
		if(reply.getQaReplyLev() == 2) {  //원글의 댓글일 때, board_reply_ref 는 자기번호를 기록함
			/*
			 * query += "default, " + "2, ?, default, default)";
			 */
			
			  query += "(select max(qa_no) + 1 from tb_qa), " + "2, ?, default, default)";
			 
		}
		if(reply.getQaReplyLev() == 3) {  //댓글의 댓글일 때
			query += "?, 3, ?, default, default)";
		}
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, reply.getQaWriter());
			pstmt.setString(2, reply.getQaTitle());
			pstmt.setString(3, reply.getQaContent());
			pstmt.setInt(4, reply.getQaRef());
			
			if(reply.getQaReplyLev() == 2) { 
				pstmt.setInt(5, reply.getQaReplySeq());
			}
			if(reply.getQaReplyLev() == 3) { 
				pstmt.setInt(5, reply.getQaReplyRef());
				pstmt.setInt(6, reply.getQaReplySeq());
			}
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}		
		
		return result;
	}

	public int deleteBoard(Connection conn, int qaNo, int qaReplyLev) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from tb_qa ";
		
		if(qaReplyLev == 1) //원글이면
			query += "where qa_ref = ?";
		if(qaReplyLev == 2) //댓글이면
			query += "where qa_reply_ref = ?";
		if(qaReplyLev == 3) //대댓글이면
			query += "where qa_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, qaNo);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateReply(Connection conn, Qa reply) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update tb_qa set qa_title = ?, qa_content = ? "
				+ "where qa_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);			
			pstmt.setString(1, reply.getQaTitle());
			pstmt.setString(2, reply.getQaContent());
			pstmt.setInt(3, reply.getQaNo());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateOrgin(Connection conn, Qa board) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update tb_qa set qa_title = ?, "
				+ "qa_content = ? " 
				+ "where qa_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);			
			pstmt.setString(1, board.getQaTitle());
			pstmt.setString(2, board.getQaContent());
			pstmt.setInt(3, board.getQaNo());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Qa> selectTop3(Connection conn) {
		ArrayList<Qa> list = new ArrayList<Qa>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * " + 
				"from (select rownum rnum, qa_no, qa_title, qa_readcount " + 
				"        from (select * from tb_qa " + 
				"                where qa_reply_lev = 1 " + 
				"                order by qa_readcount desc)) " + 
				"where rnum >= 1 and rnum <= 3";		
		
		try {
			pstmt = conn.prepareStatement(query);
						
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Qa qa = new Qa();
				
				qa.setQaNo(rset.getInt("qa_no"));				
				qa.setQaTitle(rset.getString("qa_title"));				
				qa.setQaReadCount(rset.getInt("qa_readcount"));				
								
				list.add(qa);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Qa> selectSearchTitle(Connection conn, String qaTitle) {
		ArrayList<Qa> list = new ArrayList<Qa>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "SELECT * " + 
				"FROM (SELECT ROWNUM RNUM, QA_NO, QA_TITLE, QA_WRITER,  " + 
				"                        QA_CONTENT, " + 
				"                        QA_REF, QA_REPLY_REF, " + 
				"                        QA_REPLY_LEV, QA_REPLY_SEQ, QA_READCOUNT,  " + 
				"                        QA_DATE " + 
				"            FROM (SELECT * FROM TB_QA " + 
				"                     WHERE QA_TITLE LIKE ? ORDER BY QA_NO DESC)) " + 
				"WHERE  RNUM >= ? AND RNUM <= ?";

		int currentPage = 1;
		int limit = 10;
		int startRow = (currentPage -1) * limit + 1;
		int endRow = startRow + limit -1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + qaTitle + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();

			while (rset.next()) {
				Qa qa = new Qa();

				qa.setQaNo(rset.getInt("qa_no"));
				qa.setQaWriter(rset.getString("qa_writer"));
				qa.setQaTitle(rset.getString("qa_title"));
				qa.setQaContent(rset.getString("qa_content"));
				qa.setQaRef(rset.getInt("qa_ref"));
				qa.setQaReplyLev(rset.getInt("qa_reply_lev"));
				qa.setQaReplyRef(rset.getInt("qa_reply_ref"));
				qa.setQaReplySeq(rset.getInt("qa_reply_seq"));
				qa.setQaReadCount(rset.getInt("qa_readcount"));
				qa.setQaDate(rset.getDate("qa_date"));
								
				list.add(qa);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public ArrayList<Qa> selectSearchWriter(Connection conn, String qaWriter) {
		ArrayList<Qa> list = new ArrayList<Qa>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "SELECT * " + 
				"FROM (SELECT ROWNUM RNUM, QA_NO, QA_TITLE, QA_WRITER,  " + 
				"                        QA_CONTENT, " + 
				"                        QA_REF, QA_REPLY_REF, " + 
				"                        QA_REPLY_LEV, QA_REPLY_SEQ, QA_READCOUNT,  " + 
				"                        QA_DATE " + 
				"            FROM (SELECT * FROM TB_QA " + 
				"                     WHERE QA_WRITER LIKE ? ORDER BY QA_NO DESC)) " + 
				"WHERE  RNUM >= ? AND RNUM <= ?";
		
		int currentPage = 1;
		int limit = 10;
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit -1;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + qaWriter + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();

			while (rset.next()) {
				Qa qa = new Qa();

				qa.setQaNo(rset.getInt("qa_no"));
				qa.setQaWriter(rset.getString("qa_writer"));
				qa.setQaTitle(rset.getString("qa_title"));
				qa.setQaContent(rset.getString("qa_content"));
				qa.setQaRef(rset.getInt("qa_ref"));
				qa.setQaReplyLev(rset.getInt("qa_reply_lev"));
				qa.setQaReplyRef(rset.getInt("qa_reply_ref"));
				qa.setQaReplySeq(rset.getInt("qa_reply_seq"));
				qa.setQaReadCount(rset.getInt("qa_readcount"));
				qa.setQaDate(rset.getDate("qa_date"));
								
				list.add(qa);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}


	public int getSearchTitleListCount(Connection conn, String qaTitle) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String Query = "select count(*) from tb_qa where qa_title like ?";
		
		try {
			pstmt = conn.prepareStatement(Query);
			pstmt.setString(1, "%" + qaTitle + "%");
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public int getSearchWriter(Connection conn, String qaWriter) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String Query = "select count(*) from tb_qa where qa_writer like ?";
		
		try {
			pstmt = conn.prepareStatement(Query);
			pstmt.setString(1, "%" + qaWriter + "%");
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public int getSearchDate(Connection conn, Date beginDate, Date endDate) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String Query = "select count(*) from tb_qa where qa_date between ? and ?";
		
		try {
			pstmt = conn.prepareStatement(Query);
			pstmt.setDate(1, beginDate);
			pstmt.setDate(2, endDate);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
}// class end
