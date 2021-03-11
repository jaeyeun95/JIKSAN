package notice.model.vo;

import java.sql.Date;

public class Notice implements java.io.Serializable {
	private static final long serialVersionUID = 4L;
	
	private int noticeNo;
	private int noticeWriter;
	private String noticeTitle;
	private String noticeContent;
	private String noticeOriginFileName;
	private String noticeRenameFileName;
	private java.sql.Date noticeDate;
	private int noticeCount;
	
	public Notice() {}

	public Notice(int noticeNo, int noticeWriter, String noticeTitle, String noticeContent, String noticeOriginFileName,
			String noticeRenameFileName, Date noticeDate, int noticeCount) {
		super();
		this.noticeNo = noticeNo;
		this.noticeWriter = noticeWriter;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeOriginFileName = noticeOriginFileName;
		this.noticeRenameFileName = noticeRenameFileName;
		this.noticeDate = noticeDate;
		this.noticeCount = noticeCount;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public int getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(int noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeOriginFileName() {
		return noticeOriginFileName;
	}

	public void setNoticeOriginFileName(String noticeOriginFileName) {
		this.noticeOriginFileName = noticeOriginFileName;
	}

	public String getNoticeRenameFileName() {
		return noticeRenameFileName;
	}

	public void setNoticeRenameFileName(String noticeRenameFileName) {
		this.noticeRenameFileName = noticeRenameFileName;
	}

	public java.sql.Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(java.sql.Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public int getNoticeCount() {
		return noticeCount;
	}

	public void setNoticeCount(int noticeCount) {
		this.noticeCount = noticeCount;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeWriter=" + noticeWriter + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", noticeOriginFileName=" + noticeOriginFileName
				+ ", noticeRenameFileName=" + noticeRenameFileName + ", noticeDate=" + noticeDate + ", noticeCount="
				+ noticeCount + "]";
	}

	public void setNoticeWriter(String parameter) {
		// TODO Auto-generated method stub
		
	}

	
}
