package notice.model.dao;

import static common.JDBCTemp.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import notice.model.vo.Notice;

public class NoticeDao {
	public NoticeDao() {

	}

	public ArrayList<Notice> selectList(Connection conn, int currentPage, int limit) {
		ArrayList<Notice> list = new ArrayList<Notice>();
		PreparedStatement stmt = null;
		ResultSet rset = null;

		String query = "select *  " + 
				"from(select rownum rnum, NOTICE_NO, NOTICE_WRITER, NOTICE_TITLE, NOTICE_CONTENT,  " + 
				"                    NOTICE_ORIGIN_FILE_NAME, NOTICE_RENAME_FILE_NAME, NOTICE_DATE, NOTICE_COUNT  " + 
				"from (select * from tb_notice " + 
				"            order by notice_no desc)) " + 
				"where rnum >=? and rnum <= ?";
		
		int startRow = (currentPage - 1) * limit + 1; // 3 page 이면 시작행은 21
		int endRow = startRow + limit - 1; // 3page 이면 끝행은 30

		try {
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, startRow);
			stmt.setInt(2, endRow);
			rset = stmt.executeQuery();

			while (rset.next()) {
				Notice notice = new Notice();

				notice.setNoticeNo(rset.getInt("NOTICE_NO"));
				notice.setNoticeWriter(rset.getInt("NOTICE_WRITER"));
				notice.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				notice.setNoticeContent(rset.getString("NOTICE_CONTENT"));
				notice.setNoticeOriginFileName(rset.getString("NOTICE_ORIGIN_FILE_NAME"));
				notice.setNoticeRenameFileName(rset.getString("NOTICE_RENAME_FILE_NAME"));
				notice.setNoticeDate(rset.getDate("NOTICE_DATE"));
				notice.setNoticeCount(rset.getInt("NOTICE_COUNT"));

				list.add(notice);
				

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return list;

	}

	public Notice selectNotice(Connection conn, int noticeNo) {
		Notice notice = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from tb_notice where notice_no = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				notice = new Notice();
				
				notice.setNoticeNo(rset.getInt("NOTICE_NO"));
				notice.setNoticeWriter(rset.getInt("NOTICE_WRITER"));
				notice.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				notice.setNoticeContent(rset.getString("NOTICE_CONTENT"));
				notice.setNoticeOriginFileName(rset.getString("NOTICE_ORIGIN_FILE_NAME"));
				notice.setNoticeRenameFileName(rset.getString("NOTICE_RENAME_FILE_NAME"));
				notice.setNoticeDate(rset.getDate("NOTICE_DATE"));
				notice.setNoticeCount(rset.getInt("NOTICE_COUNT"));
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return notice;

	}

	public int insertNotice(Connection conn, Notice notice) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into tb_notice values ((select max(notice_no) + 1 from tb_notice) ,?, ?, ?, ?, ?, sysdate, ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			

			pstmt.setInt(1, notice.getNoticeWriter());
			pstmt.setString(2, notice.getNoticeTitle());
			pstmt.setString(3, notice.getNoticeContent());
			pstmt.setString(4, notice.getNoticeOriginFileName());
			pstmt.setString(5, notice.getNoticeRenameFileName());
			pstmt.setInt(6, notice.getNoticeCount());

			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateNotice(Connection conn, Notice notice) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = null;
				if(notice.getNoticeOriginFileName() == null) {
					query = "update tb_notice set notice_title = ?, notice_content = ?, "
							+ "notice_date = sysdate, NOTICE_ORIGIN_FILE_NAME = null, NOTICE_RENAME_FILE_NAME = null,  "
							+ " NOTICE_WRITER = ?,  notice_count = ? where notice_no = ?";
				}else {
				
				query = "update tb_notice set notice_title = ?, notice_content = ?, "
				+ "notice_date = sysdate, NOTICE_ORIGIN_FILE_NAME = ?, NOTICE_RENAME_FILE_NAME = ?, "
				+ " NOTICE_WRITER = ?,  notice_count = ? where notice_no = ?";
				}
		
				
				try {
			
			pstmt = conn.prepareStatement(query);
			if(notice.getNoticeOriginFileName() == null) {
			pstmt.setString(1, notice.getNoticeTitle());
			pstmt.setString(2, notice.getNoticeContent());

			pstmt.setInt(3, notice.getNoticeWriter());
			pstmt.setInt(4, notice.getNoticeCount());
			pstmt.setInt(5, notice.getNoticeNo());
			}else {
				pstmt.setString(1, notice.getNoticeTitle());
				pstmt.setString(2, notice.getNoticeContent());
				pstmt.setString(3,notice.getNoticeOriginFileName());
				pstmt.setString(4,notice.getNoticeRenameFileName());
				pstmt.setInt(5, notice.getNoticeWriter());
				pstmt.setInt(6, notice.getNoticeCount());
				pstmt.setInt(7, notice.getNoticeNo());
			}
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteNotice(Connection conn, int noticeNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from tb_notice where notice_no = ? " ;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;

		String query = "select count(*) from tb_notice";

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return listCount;
	}

	public ArrayList<Notice> selectSearchTitle(Connection conn, String noticeTitle) {
		ArrayList<Notice> list = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select *  " + 
				"from(select rownum rnum, NOTICE_NO, NOTICE_WRITER, NOTICE_TITLE, NOTICE_CONTENT,  " + 
				"                    NOTICE_ORIGIN_FILE_NAME, NOTICE_RENAME_FILE_NAME, NOTICE_DATE, NOTICE_COUNT  " + 
				"from (select * from tb_notice " + 
				"           where notice_title like ? " + 
				"            order by notice_no desc)) " + 
				"where rnum >=? and rnum <= ?";
		
		int currentPage = 1;
		int limit = 10;
		int startRow = (currentPage - 1) * limit + 1; // 3 page 이면 시작행은 21
		int endRow = startRow + limit - 1; // 3page 이면 끝행은 30

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + noticeTitle + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);



			rset = pstmt.executeQuery();

			while (rset.next()) {
				Notice notice = new Notice();

				notice.setNoticeNo(rset.getInt("NOTICE_NO"));
				notice.setNoticeWriter(rset.getInt("NOTICE_WRITER"));
				notice.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				notice.setNoticeContent(rset.getString("NOTICE_CONTENT"));
				notice.setNoticeOriginFileName(rset.getString("NOTICE_ORIGIN_FILE_NAME"));
				notice.setNoticeRenameFileName(rset.getString("NOTICE_RENAME_FILE_NAME"));
				notice.setNoticeDate(rset.getDate("NOTICE_DATE"));
				notice.setNoticeCount(rset.getInt("NOTICE_COUNT"));

				list.add(notice);
				

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public ArrayList<Notice> selectSearchContent(Connection conn, String noticeContent) {
		ArrayList<Notice> list = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select *  " + 
				"from(select rownum rnum, NOTICE_NO, NOTICE_WRITER, NOTICE_TITLE, NOTICE_CONTENT,  " + 
				"                    NOTICE_ORIGIN_FILE_NAME, NOTICE_RENAME_FILE_NAME, NOTICE_DATE, NOTICE_COUNT  " + 
				"from (select * from tb_notice " + 
				"           where notice_content like  ? " + 
				"            order by notice_no desc)) " + 
				"where rnum >=? and rnum <= ? ";
		
		int currentPage = 1;
		int limit = 10;
		int startRow = (currentPage - 1) * limit + 1; // 3 page 이면 시작행은 21
		int endRow = startRow + limit - 1; // 3page 이면 끝행은 30

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + noticeContent + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				Notice notice = new Notice();

				notice.setNoticeNo(rset.getInt("NOTICE_NO"));
				notice.setNoticeWriter(rset.getInt("NOTICE_WRITER"));
				notice.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				notice.setNoticeContent(rset.getString("NOTICE_CONTENT"));
				notice.setNoticeOriginFileName(rset.getString("NOTICE_ORIGIN_FILE_NAME"));
				notice.setNoticeRenameFileName(rset.getString("NOTICE_RENAME_FILE_NAME"));
				notice.setNoticeDate(rset.getDate("NOTICE_DATE"));
				notice.setNoticeCount(rset.getInt("NOTICE_COUNT"));

				list.add(notice);
				

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public ArrayList<Notice> selectNewTop3(Connection conn) {
		ArrayList<Notice> list = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select *  " + 
				"from " + 
				"(select rownum rnum, NOTICE_NO, NOTICE_TITLE, NOTICE_DATE " + 
				"from                             " + 
				"(select * from tb_notice " + 
				"order by notice_date desc)) " + 
				"where rnum >=1 and rnum <=3";
		


		try {
			pstmt = conn.prepareStatement(query);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Notice notice = new Notice();

				notice.setNoticeNo(rset.getInt("NOTICE_NO"));
				notice.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				notice.setNoticeDate(rset.getDate("NOTICE_DATE"));


				list.add(notice);
				

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public int getSearchTitleListCount(Connection conn, String noticeTitle) {
		int listCount = 0;
		PreparedStatement stmt = null;
		ResultSet rset = null;

		String query = "select count(*) from tb_notice where notice_title like ?";

		try {
			stmt = conn.prepareStatement(query);
			stmt.setString(1,  "%" + noticeTitle + "%");
			rset = stmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return listCount;
	}

	public int getSearchContentListCount(Connection conn, String noticeContent) {
		int listCount = 0;
		PreparedStatement stmt = null;
		ResultSet rset = null;

		String query = "select count(*) from tb_notice where notice_Content like ?";

		try {
			stmt = conn.prepareStatement(query);
			stmt.setString(1,  "%" + noticeContent + "%");
			rset = stmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return listCount;
	}

	public int addReadCount(Connection conn, int noticeNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update tb_notice set notice_count = notice_count + 1 where notice_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}





}
