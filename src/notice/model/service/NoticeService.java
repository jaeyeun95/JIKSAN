package notice.model.service;

import static common.JDBCTemp.*;


import java.sql.Connection;
import java.util.ArrayList;

import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;

public class NoticeService {
	private NoticeDao ndao = new NoticeDao();
	
	public NoticeService() {}

	public ArrayList<Notice> selectList(int currentPage, int limit){
		Connection conn = getConnection();
		ArrayList<Notice> list = ndao.selectList(conn, currentPage, limit);
		close(conn);
		return list;
	}
	
	public Notice selectNotice(int noticeNo) {
		Connection conn = getConnection();
		Notice notice = ndao.selectNotice(conn, noticeNo);
		close(conn);
		return notice;
	}

	public int insertNotice(Notice notice) {
		Connection conn = getConnection();
		int result = ndao.insertNotice(conn, notice);
		if( result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public int updateNotice(Notice notice) {
		Connection conn = getConnection();
		int result = ndao.updateNotice(conn, notice);
		if( result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public int deleteNotice(int noticeNo) {
		Connection conn = getConnection();
		int result = ndao.deleteNotice(conn, noticeNo);
		if( result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}



	public ArrayList<Notice> selectSearchTitle(String noticeTitle) {
		Connection conn = getConnection();
		ArrayList<Notice> list = ndao.selectSearchTitle(conn, noticeTitle);
		close(conn);
		return list;
	}

	public ArrayList<Notice> selectSearchContent(String noticeContent) {
		Connection conn = getConnection();
		ArrayList<Notice> list = ndao.selectSearchContent(conn, noticeContent);
		close(conn);
		return list;
	}

	public ArrayList<Notice> selectNewTop3() {
		Connection conn = getConnection();
		ArrayList<Notice> list = ndao.selectNewTop3(conn);
		close(conn);
		return list;
	}

	public int getSearchTitleListCount(String noticeTitle) {
		Connection conn = getConnection();
		int listCount = ndao.getSearchTitleListCount(conn, noticeTitle);
		close(conn);
		return listCount;
	}

	public int getSearchContentListCount(String noticeContent) {
		Connection conn = getConnection();
		int listCount = ndao.getSearchContentListCount(conn, noticeContent);
		close(conn);
		return listCount;
	}
	public int getListCount() {
		Connection conn = getConnection();
		int listCount = ndao.getListCount(conn);
		close(conn);
		return listCount;
	}

	public void addReadCount(int noticeNo) {
		Connection conn = getConnection();
		int result = ndao.addReadCount(conn, noticeNo);
		close(conn);

	}


	
}



