package faq.model.vo;

import java.sql.Date;

public class Faq implements java.io.Serializable{
	private static final long SerialVersionUID = 2L;

	private int faqNo;
	private int faqWriter;
	private String faqTitle;
	private String faqText;
	private int faqCount;
	private Date faqDate;
	
	public Faq() {}

	public Faq(int faqNo, int faqWriter, String faqTitle, String faqText, int faqCount, Date faqDate) {
		super();
		this.faqNo = faqNo;
		this.faqWriter = faqWriter;
		this.faqTitle = faqTitle;
		this.faqText = faqText;
		this.faqCount = faqCount;
		this.faqDate = faqDate;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public int getFaqWriter() {
		return faqWriter;
	}

	public void setFaqWriter(int faqWriter) {
		this.faqWriter = faqWriter;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqText() {
		return faqText;
	}

	public void setFaqText(String faqText) {
		this.faqText = faqText;
	}

	public int getFaqCount() {
		return faqCount;
	}

	public void setFaqCount(int faqCount) {
		this.faqCount = faqCount;
	}

	public Date getFaqDate() {
		return faqDate;
	}

	public void setFaqDate(Date faqDate) {
		this.faqDate = faqDate;
	}

	public static long getSerialversionuid() {
		return SerialVersionUID;
	}

	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", faqWriter=" + faqWriter + ", faqTitle=" + faqTitle + ", faqText=" + faqText
				+ ", faqCount=" + faqCount + ", faqDate=" + faqDate + "]";
	}

	
	
	
}