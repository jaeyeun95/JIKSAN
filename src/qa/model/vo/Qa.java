package qa.model.vo;

import java.sql.Date;

public class Qa implements java.io.Serializable {
	private static final long serialVersionUID = 3L;

	private int qaNo;
	private String qaWriter;
	private String qaTitle;
	private String qaContent;
	private int qaRef;
	private int qaReplyRef;
	private int qaReplyLev;
	private int qaReplySeq;
	private int qaReadCount;
	private Date qaDate;
	
	public Qa() {}

	public Qa(int qaNo, String qaWriter, String qaTitle, String qaContent, int qaRef, int qaReplyRef, int qaReplyLev,
			int qaReplySeq, int qaReadCount, Date qaDate) {
		super();
		this.qaNo = qaNo;
		this.qaWriter = qaWriter;
		this.qaTitle = qaTitle;
		this.qaContent = qaContent;
		this.qaRef = qaRef;
		this.qaReplyRef = qaReplyRef;
		this.qaReplyLev = qaReplyLev;
		this.qaReplySeq = qaReplySeq;
		this.qaReadCount = qaReadCount;
		this.qaDate = qaDate;
	}

	public int getQaNo() {
		return qaNo;
	}

	public void setQaNo(int qaNo) {
		this.qaNo = qaNo;
	}

	public String getQaWriter() {
		return qaWriter;
	}

	public void setQaWriter(String qaWriter) {
		this.qaWriter = qaWriter;
	}

	public String getQaTitle() {
		return qaTitle;
	}

	public void setQaTitle(String qaTitle) {
		this.qaTitle = qaTitle;
	}

	public String getQaContent() {
		return qaContent;
	}

	public void setQaContent(String qaContent) {
		this.qaContent = qaContent;
	}

	public int getQaRef() {
		return qaRef;
	}

	public void setQaRef(int qaRef) {
		this.qaRef = qaRef;
	}

	public int getQaReplyRef() {
		return qaReplyRef;
	}

	public void setQaReplyRef(int qaReplyRef) {
		this.qaReplyRef = qaReplyRef;
	}

	public int getQaReplyLev() {
		return qaReplyLev;
	}

	public void setQaReplyLev(int qaReplyLev) {
		this.qaReplyLev = qaReplyLev;
	}

	public int getQaReplySeq() {
		return qaReplySeq;
	}

	public void setQaReplySeq(int qaReplySeq) {
		this.qaReplySeq = qaReplySeq;
	}

	public int getQaReadCount() {
		return qaReadCount;
	}

	public void setQaReadCount(int qaReadCount) {
		this.qaReadCount = qaReadCount;
	}

	public Date getQaDate() {
		return qaDate;
	}

	public void setQaDate(Date qaDate) {
		this.qaDate = qaDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Qa [qaNo=" + qaNo + ", qaWriter=" + qaWriter + ", qaTitle=" + qaTitle + ", qaContent=" + qaContent
				+ ", qaRef=" + qaRef + ", qaReplyRef=" + qaReplyRef + ", qaReplyLev=" + qaReplyLev + ", qaReplySeq="
				+ qaReplySeq + ", qaReadCount=" + qaReadCount + ", qaDate=" + qaDate + "]";
	}
	
	
}
