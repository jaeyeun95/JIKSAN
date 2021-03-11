package qa.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import qa.model.vo.Qa;

import static common.JDBCTemp.*;
import qa.model.dao.QaDao;
import qa.model.vo.Qa;

public class QaService {
	
	private QaDao qdao = new QaDao();
	
	public QaService() {}
	
	//db 테이블 board 에 저장된 총 목록(행)갯수 조회용
		public int getListCount() {
			Connection conn = getConnection();
			int listCount = qdao.getListCount(conn);
			close(conn);
			return listCount;
		}
		//전체 목록 조회
		public ArrayList<Qa> selectList(int currentPage, int limit){
			Connection conn = getConnection();
			ArrayList<Qa> list = qdao.selectList(conn, currentPage, limit);
			close(conn);
			return list;
		}

		public void addReadCount(int qaNo) {
			Connection conn = getConnection();
			int result = qdao.addReadCount(conn, qaNo);
			if(result > 0)
				commit(conn);
			else
				rollback(conn);
			close(conn);
		}
		
		public Qa selectQa(int qaNo) {
			Connection conn = getConnection();
			Qa qa = qdao.selectQa(conn, qaNo);
			close(conn);
			return qa;
		}

		public int insertQa(Qa qa) {
			Connection conn = getConnection();
			int result = qdao.insertOriginQa(conn, qa);
			if(result > 0)
				commit(conn);
			else
				rollback(conn);
			close(conn);
			return result;
		}

		public void updateReplySeq(Qa reply) {
			Connection conn = getConnection();
			int result = qdao.updateReplySeq(conn, reply);
			if(result > 0)
				commit(conn);
			else
				rollback(conn);
			close(conn);
		}

		public int insertReply(Qa reply) {
			Connection conn = getConnection();
			int result = qdao.insertReply(conn, reply);
			if(result > 0)
				commit(conn);
			else
				rollback(conn);
			close(conn);
			return result;
		}

		public int deleteQa(int qaNo, int qaReplyLev) {
			Connection conn = getConnection();
			int result = qdao.deleteBoard(conn, qaNo, qaReplyLev);
			if(result > 0)
				commit(conn);
			else
				rollback(conn);
			close(conn);
			return result;
		}

		public int updateReply(Qa reply) {
			Connection conn = getConnection();
			int result = qdao.updateReply(conn, reply);
			if(result > 0)
				commit(conn);
			else
				rollback(conn);
			close(conn);
			return result;
		}

		public int updateOrigin(Qa qa) {
			Connection conn = getConnection();
			int result = qdao.updateOrgin(conn, qa);
			if(result > 0)
				commit(conn);
			else
				rollback(conn);
			close(conn);
			return result;
		}

		public ArrayList<Qa> selectTop3() {
			Connection conn = getConnection();
			ArrayList<Qa> list = qdao.selectTop3(conn);
			close(conn);
			return list;
		}

		public ArrayList<Qa> selectSearchTitle(String qaTitle) {
			Connection conn = getConnection();
			ArrayList<Qa> list = qdao.selectSearchTitle(conn, qaTitle);
			close(conn);
			return list;
		}

		public ArrayList<Qa> selectSearchWriter(String qaWriter) {
			Connection conn = getConnection();
			ArrayList<Qa> list = qdao.selectSearchWriter(conn, qaWriter);
			close(conn);
			return list;

		}


		public int getSearchTitleListCount(String qaTitle) {
			Connection conn = getConnection();
			int listCount = qdao.getSearchTitleListCount(conn, qaTitle);
			close(conn);
			return listCount;
		}

		public int getSearchWriter(String qaWriter) {
			Connection conn = getConnection();
			int listCount = qdao.getSearchWriter(conn, qaWriter);
			close(conn);
			return listCount;
		}

		public int getSearchDate(Date beginDate, Date endDate) {
			Connection conn = getConnection();
			int listCount = qdao.getSearchDate(conn, beginDate, endDate);
			close(conn);
			return listCount;
		}
	
}
