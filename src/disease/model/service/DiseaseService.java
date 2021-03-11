package disease.model.service;

import static common.JDBCTemp.close;
import static common.JDBCTemp.commit;
import static common.JDBCTemp.getConnection;
import static common.JDBCTemp.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import disease.model.dao.DiseaseDao;
import disease.model.vo.Disease;


public class DiseaseService {
	
	private DiseaseDao disdao = new DiseaseDao();
	
	public DiseaseService() {}

	public ArrayList<Disease> selectRList(){
		Connection conn = getConnection();
		ArrayList<Disease> list = disdao.selectRList(conn);
		close(conn);
		return list;
	}
	
	public ArrayList<Disease> selectList(int currentPage, int limit) {
		Connection conn = getConnection();
		ArrayList<Disease> list = disdao.selectList(conn, currentPage, limit);
		close(conn);
		return list;
	}
	
	public Disease selectDisease(int diseaseNo) {
		Connection conn = getConnection();
		Disease dis = disdao.selectDisease(conn, diseaseNo);
		close(conn);
		return dis;
	}
	
	public int insertDisease(Disease disease) {
		Connection conn = getConnection();
		int result = disdao.insertDisease(conn, disease);
		if( result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public int updateDisease (Disease disease) {
		Connection conn = getConnection();
		int result = disdao.updateDisease(conn, disease);
		if(result > 0) 
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public int deleteDisease (int diseaseNo, int diseaseReplyLev) {
		Connection conn = getConnection();
		int result = disdao.deleteDisease(conn, diseaseNo);
		if(result > 0) 
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}


	public ArrayList<Disease> selectSearchNm(String diseaseNm) {
		Connection conn = getConnection();
		ArrayList<Disease> list = disdao.selectSearchTitle(conn, diseaseNm);
		close(conn);
		return list;
	}

	public int getListCount() {
		Connection conn = getConnection();
		int listCount = disdao.getListCount(conn);
		close(conn);
		return listCount;
	}

	public int getSearchNmListCount(String diseaseNm) {
		Connection conn = getConnection();
		int listCount = disdao.getSearchContentListCount(conn, diseaseNm);
		close(conn);
		return listCount;
	}

	public int getSearchText01ListCount(String diseaseContent) {
		// TODO Auto-generated method stub
		return 0;
	}
}
