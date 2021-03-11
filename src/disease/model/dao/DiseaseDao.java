package disease.model.dao;

import static common.JDBCTemp.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import disease.model.vo.Disease;



public class DiseaseDao {
	
	public DiseaseDao() {}

	public ArrayList<Disease> selectRList(Connection conn){
		ArrayList<Disease> list = new ArrayList<Disease>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select disease_no, disease_nm, dept_no, reservable from tb_disease where reservable='Y'";
        try {
            stmt = conn.createStatement();
            rset = stmt.executeQuery(query);
            while(rset.next()) {
               Disease d = new Disease();
               
               d.setDiseaseNo(rset.getInt("disease_no"));
               d.setDiseaseNm(rset.getString("disease_nm"));
               d.setDeptNo(rset.getInt("dept_no"));
               d.setReservable(rset.getString("reservable"));
               
               list.add(d);
            }
         } catch (Exception e) {
            e.printStackTrace();
         }finally {
            close(rset);
            close(stmt);
         }
         
         return list;
      }
	
	public ArrayList<Disease> selectList(Connection conn, int currentPage, int limit) {
		ArrayList<Disease> list = new ArrayList<Disease>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from(select rownum rnum, disease_no, disease_nm, pic01 from " +
						 		" (select * from tb_disease where disease_no<900  order by disease_nm asc)) "
						 		+ " where rnum >=? and rnum<= ?";
				
		/*
		 * "select * from tb_disease where disease_no<900  order by disease_nm asc"; 
		 * "select disease_no, disease_nm, pic01, disease_alt_nm from tb_disease where disease_no<900  order by disease_nm asc" ;
		 */
		
		 	
		
		int startRow = (currentPage - 1) * limit + 1; // 3 page 이면 시작행은 21
		int endRow = startRow + limit - 1; // 3page 이면 끝행은 30
				
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Disease disease = new Disease();
				
				disease.setDiseaseNo(rset.getInt("DISEASE_NO"));
				disease.setDiseaseNm(rset.getString("DISEASE_NM"));
				disease.setPic01(rset.getString("PIC01"));

				list.add(disease);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
			return list;
	}



	public Disease selectDisease(Connection conn, int diseaseNo) {
		Disease disease = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from tb_disease where disease_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, diseaseNo);
			
			rset = pstmt.executeQuery();

			if (rset.next()) {
				disease = new Disease();
				disease.setDiseaseNo(rset.getInt("DISEASE_NO"));
				disease.setDiseaseNm(rset.getString("DISEASE_NM"));
				disease.setReservable(rset.getString("RESERVABLE"));
				disease.setDeptNo(rset.getInt("DEPT_NO"));
				disease.setSect01(rset.getString("SECT01"));
				disease.setText01(rset.getString("TEXT01"));
				disease.setPic01(rset.getString("PIC01"));
				disease.setSect02(rset.getString("SECT02"));
				disease.setText02(rset.getString("TEXT02"));
				disease.setPic02(rset.getString("PIC02"));
				disease.setSect03(rset.getString("SECT03"));
				disease.setText03(rset.getString("TEXT03"));
				disease.setPic03(rset.getString("PIC03"));
				disease.setSect04(rset.getString("SECT04"));
				disease.setText04(rset.getString("TEXT04"));
				disease.setPic04(rset.getString("PIC04"));
				disease.setSect05(rset.getString("SECT05"));
				disease.setText05(rset.getString("TEXT05"));
				disease.setPic05(rset.getString("PIC05"));
				disease.setSect06(rset.getString("SECT06"));
				disease.setText06(rset.getString("TEXT06"));
				disease.setPic06(rset.getString("PIC06"));
				disease.setSect07(rset.getString("SECT07"));
				disease.setText07(rset.getString("TEXT07"));
				disease.setPic07(rset.getString("PIC07"));
				disease.setDiseaseAltNm(rset.getString("DISEASE_ALT_NM"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return disease;
	}

	public int insertDisease(Connection conn, Disease disease) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "insert into tb_disease values ((select max(disease_no) + 1 from tb_disease) ,"
				+ " ?, ?, ?, "// diseaseNm, deptNo, reservable
				+ " ?, ?, ?, " // 01 정의
				+ " ?, ?, ?, " // 02 원인
				+ " ?, ?, ?, " // 03 증상
				+ " ?, ?, ?, " // 04 검사 · 진단
				+ " ?, ?, ?, " // 05 치료
				+ " ?, ?, ?, " // 06 합병증
				+ " ?, ?, ?, " // 07 주의사항
				+ " ? )"; // diseaseAltNm
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,  disease.getDiseaseNm());
			pstmt.setInt(2, disease.getDeptNo() );
			pstmt.setString(3, disease.getReservable());
			pstmt.setString(4, disease.getSect01());
			pstmt.setString(5, disease.getText01());
			pstmt.setString(6, disease.getPic01());
			pstmt.setString(7, disease.getSect02());
			pstmt.setString(8, disease.getText02());
			pstmt.setString(9, disease.getPic02());
			pstmt.setString(10, disease.getSect03());
			pstmt.setString(11, disease.getText03());
			pstmt.setString(12, disease.getPic03());
			pstmt.setString(13, disease.getSect04());
			pstmt.setString(14, disease.getText04());
			pstmt.setString(15, disease.getPic04());
			pstmt.setString(16, disease.getSect05());
			pstmt.setString(17, disease.getText05());
			pstmt.setString(18, disease.getPic05());
			pstmt.setString(19, disease.getSect06());
			pstmt.setString(20, disease.getText06());
			pstmt.setString(21, disease.getPic06());
			pstmt.setString(22, disease.getSect07());
			pstmt.setString(23, disease.getText07());
			pstmt.setString(24, disease.getPic07());
			pstmt.setString(25, disease.getDiseaseAltNm());

			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}


	public int updateDisease(Connection conn, Disease disease) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update tb_disease set "
				+ " disease_nm = ?,  dept_no = ?, reservable = ?, "// diseaseNm, deptNo, reservable
				+ " sect01 = ?, text01 = ?, pic01 = ?, " // 01 정의
				+ " sect02 = ?, text02 = ?, pic02 = ?, " // 02 원인
				+ " sect03 = ?, text03 = ?, pic03 = ?, " // 03 증상
				+ " sect04 = ?, text04 = ?, pic04 = ?, " // 04 검사 · 진단
				+ " sect05 = ?, text05 = ?, pic05 = ?, " // 05 치료
				+ " sect06 = ?, text06= ?, pic06 = ?, " // 06 합병증
				+ " sect07 = ?, text07 = ?, pic07 = ?, " // 07 주의사항
				+ " disease_alt_nm = ? " // diseaseAltNm
				+ " where disease_no= ?)"; 
		
		try {
			
		pstmt = conn.prepareStatement(query);
		
		pstmt.setString(1,  disease.getDiseaseNm());
		pstmt.setInt(2, disease.getDeptNo() );
		pstmt.setString(3, disease.getReservable());
		pstmt.setString(4, disease.getSect01());
		pstmt.setString(5, disease.getText01());
		pstmt.setString(6, disease.getPic01());
		pstmt.setString(7, disease.getSect02());
		pstmt.setString(8, disease.getText02());
		pstmt.setString(9, disease.getPic02());
		pstmt.setString(10, disease.getSect03());
		pstmt.setString(11, disease.getText03());
		pstmt.setString(12, disease.getPic03());
		pstmt.setString(13, disease.getSect04());
		pstmt.setString(14, disease.getText04());
		pstmt.setString(15, disease.getPic04());
		pstmt.setString(16, disease.getSect05());
		pstmt.setString(17, disease.getText05());
		pstmt.setString(18, disease.getPic05());
		pstmt.setString(19, disease.getSect06());
		pstmt.setString(20, disease.getText06());
		pstmt.setString(21, disease.getPic06());
		pstmt.setString(22, disease.getSect07());
		pstmt.setString(23, disease.getText07());
		pstmt.setString(24, disease.getPic07());
		pstmt.setString(25, disease.getDiseaseAltNm());
		
		pstmt.setInt(2, disease.getDiseaseNo()); // 질병번호가 이것일때! 수정해달라
		
		result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		return result;
	}

	public int deleteDisease(Connection conn, int diseaseNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from tb_disease where disease_no = ? " ;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, diseaseNo);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Disease> selectSearchTitle(Connection conn, String DiseaseNm){
		ArrayList<Disease> list = new ArrayList<Disease>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from(select rownum rnum, disease_no, disease_nm, pic01, disease_alt_nm from " +
						 		" (select * from tb_disease where (disease_no<900  and disease_alt_nm like ? ) order by disease_nm asc)) "
						 		+ " where rnum >=? and rnum<= ?";
				
		int currentPage = 1;
		int limit = 10;
		int startRow = (currentPage - 1) * limit + 1; // 3 page 이면 시작행은 21
		int endRow = startRow + limit - 1; // 3page 이면 끝행은 30
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + DiseaseNm + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				Disease disease = new Disease();
				
				disease.setDiseaseNo(rset.getInt("DISEASE_NO"));
				disease.setDiseaseNm(rset.getString("DISEASE_NM"));
				disease.setPic01(rset.getString("PIC01"));
				disease.setDiseaseAltNm(rset.getString("disease_alt_nm"));
				
				list.add(disease);				

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public int getListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;

		String query = "select count(*) from tb_disease";

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

	public int getSearchContentListCount(Connection conn, String diseaseNm) {
		int listCount = 0;
		PreparedStatement stmt = null;
		ResultSet rset = null;

		String query = "select count(*) from tb_disease where disease_alt_nm like ?";

		try {
			stmt = conn.prepareStatement(query);
			stmt.setString(1,  "%" + diseaseNm + "%");
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

	
}
