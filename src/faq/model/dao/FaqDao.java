package faq.model.dao;

import static common.JDBCTemp.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import faq.model.vo.Faq;

public class FaqDao {

	public ArrayList<Faq> selectList(Connection conn) {
		ArrayList<Faq> list = new ArrayList<Faq>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from tb_faq order by faq_no desc";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Faq faq = new Faq();
				
				faq.setFaqNo(rset.getInt("faq_no"));
				faq.setFaqWriter(rset.getInt("faq_writer"));
				faq.setFaqTitle(rset.getString("faq_title"));
				faq.setFaqText(rset.getString("faq_text"));
				faq.setFaqDate(rset.getDate("faq_date"));
				
				
				list.add(faq);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public Faq selectFaq(Connection conn, int faqNo) {
		Faq faq = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from tb_faq where faq_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, faqNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				faq = new Faq();
				
				faq.setFaqNo(faqNo);
				faq.setFaqTitle(rset.getString("faq_title"));
				faq.setFaqText(rset.getString("faq_text"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return faq;
	}

	public int deleteFaq(Connection conn, int faqNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from tb_faq where faq_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, faqNo);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateFaq(Connection conn, Faq faq) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update tb_faq set faq_title = ? , faq_text= ? where faq_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, faq.getFaqTitle());
			pstmt.setString(2, faq.getFaqText());
			pstmt.setInt(3, faq.getFaqNo());
			
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertFaq(Connection conn, Faq faq) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "INSERT INTO TB_FAQ " + 
				"VALUES ((SELECT MAX(FAQ_NO) + 1 FROM TB_FAQ ), default, ?, ?, default)";
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, faq.getFaqTitle());
			pstmt.setString(2, faq.getFaqText());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}
