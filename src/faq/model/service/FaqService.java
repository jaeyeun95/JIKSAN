package faq.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static common.JDBCTemp.*;
import faq.model.dao.FaqDao;
import faq.model.vo.Faq;

public class FaqService {
	
	private FaqDao fdao = new FaqDao();
	
	public FaqService() {}
	
	public ArrayList<Faq> selectList(){
		Connection conn = getConnection();
		ArrayList<Faq> list = fdao.selectList(conn);
		close(conn);
		return list;
	}

	public Faq selectFaq(int faqNo) {
		Connection conn = getConnection();
		Faq faq = fdao.selectFaq(conn, faqNo);
		close(conn);
		return faq;
		
	}

	public int deleteFaq(int faqNo) {
		Connection conn = getConnection();
		int result = fdao.deleteFaq(conn, faqNo);
		if(result > 0) 
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public int updateFaq(Faq faq) {
		Connection conn = getConnection();
		int result = fdao.updateFaq(conn, faq);
		if(result > 0) 
			commit(conn);
		else
			rollback(conn);
			close(conn);
		return result;
	}

	public int insertFaq(Faq faq) {
		Connection conn = getConnection();
		int result = fdao.insertFaq(conn, faq);
		if(result > 0) 
			commit(conn);
		else
			rollback(conn);
			close(conn);
		return result;
	}
}
