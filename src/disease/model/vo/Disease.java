package disease.model.vo;

public class Disease implements java.io.Serializable {
	private static final long serialVersionUID = 6L;
	
	/*DISEASE_NO
DISEASE_NM
DEPT_NO
RESERVABLE
SECT01
TEXT01
PIC01
SECT02
TEXT02
PIC02
SECT03
TEXT03
PIC03
SECT04
TEXT04
PIC04
SECT05
TEXT05
PIC05
SECT06
TEXT06
PIC06
SECT07
TEXT07
PIC07
DISEASE_ALT_NM*/
	
	private int diseaseNo;  //질병번호
	private String diseaseNm;//	Disease Name 질병명
	private int deptNo; // 진료과 번호
	private String reservable; //예약가능
	private String sect01;
	private String text01;
	private String pic01;
	private String sect02;
	private String text02;
	private String pic02;
	private String sect03;
	private String text03;
	private String pic03;
	private String sect04;
	private String text04;
	private String pic04;
	private String sect05;
	private String text05;
	private String pic05;
	private String sect06;
	private String text06;
	private String pic06;
	private String sect07;
	private String text07;
	private String pic07;
	private String diseaseAltNm;
	
	
	public Disease() {}


	public Disease(int diseaseNo, String diseaseNm, int deptNo, String reservable, String sect01, String text01,
			String pic01, String sect02, String text02, String pic02, String sect03, String text03, String pic03,
			String sect04, String text04, String pic04, String sect05, String text05, String pic05, String sect06,
			String text06, String pic06, String sect07, String text07, String pic07, String diseaseAltNm) {
		super();
		this.diseaseNo = diseaseNo;
		this.diseaseNm = diseaseNm;
		this.deptNo = deptNo;
		this.reservable = reservable;
		this.sect01 = sect01;
		this.text01 = text01;
		this.pic01 = pic01;
		this.sect02 = sect02;
		this.text02 = text02;
		this.pic02 = pic02;
		this.sect03 = sect03;
		this.text03 = text03;
		this.pic03 = pic03;
		this.sect04 = sect04;
		this.text04 = text04;
		this.pic04 = pic04;
		this.sect05 = sect05;
		this.text05 = text05;
		this.pic05 = pic05;
		this.sect06 = sect06;
		this.text06 = text06;
		this.pic06 = pic06;
		this.sect07 = sect07;
		this.text07 = text07;
		this.pic07 = pic07;
		this.diseaseAltNm = diseaseAltNm;
	}


	public int getDiseaseNo() {
		return diseaseNo;
	}


	public void setDiseaseNo(int diseaseNo) {
		this.diseaseNo = diseaseNo;
	}


	public String getDiseaseNm() {
		return diseaseNm;
	}


	public void setDiseaseNm(String diseaseNm) {
		this.diseaseNm = diseaseNm;
	}


	public int getDeptNo() {
		return deptNo;
	}


	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}


	public String getReservable() {
		return reservable;
	}


	public void setReservable(String reservable) {
		this.reservable = reservable;
	}


	public String getSect01() {
		return sect01;
	}


	public void setSect01(String sect01) {
		this.sect01 = sect01;
	}


	public String getText01() {
		return text01;
	}


	public void setText01(String text01) {
		this.text01 = text01;
	}


	public String getPic01() {
		return pic01;
	}


	public void setPic01(String pic01) {
		this.pic01 = pic01;
	}


	public String getSect02() {
		return sect02;
	}


	public void setSect02(String sect02) {
		this.sect02 = sect02;
	}


	public String getText02() {
		return text02;
	}


	public void setText02(String text02) {
		this.text02 = text02;
	}


	public String getPic02() {
		return pic02;
	}


	public void setPic02(String pic02) {
		this.pic02 = pic02;
	}


	public String getSect03() {
		return sect03;
	}


	public void setSect03(String sect03) {
		this.sect03 = sect03;
	}


	public String getText03() {
		return text03;
	}


	public void setText03(String text03) {
		this.text03 = text03;
	}


	public String getPic03() {
		return pic03;
	}


	public void setPic03(String pic03) {
		this.pic03 = pic03;
	}


	public String getSect04() {
		return sect04;
	}


	public void setSect04(String sect04) {
		this.sect04 = sect04;
	}


	public String getText04() {
		return text04;
	}


	public void setText04(String text04) {
		this.text04 = text04;
	}


	public String getPic04() {
		return pic04;
	}


	public void setPic04(String pic04) {
		this.pic04 = pic04;
	}


	public String getSect05() {
		return sect05;
	}


	public void setSect05(String sect05) {
		this.sect05 = sect05;
	}


	public String getText05() {
		return text05;
	}


	public void setText05(String text05) {
		this.text05 = text05;
	}


	public String getPic05() {
		return pic05;
	}


	public void setPic05(String pic05) {
		this.pic05 = pic05;
	}


	public String getSect06() {
		return sect06;
	}


	public void setSect06(String sect06) {
		this.sect06 = sect06;
	}


	public String getText06() {
		return text06;
	}


	public void setText06(String text06) {
		this.text06 = text06;
	}


	public String getPic06() {
		return pic06;
	}


	public void setPic06(String pic06) {
		this.pic06 = pic06;
	}


	public String getSect07() {
		return sect07;
	}


	public void setSect07(String sect07) {
		this.sect07 = sect07;
	}


	public String getText07() {
		return text07;
	}


	public void setText07(String text07) {
		this.text07 = text07;
	}


	public String getPic07() {
		return pic07;
	}


	public void setPic07(String pic07) {
		this.pic07 = pic07;
	}


	public String getDiseaseAltNm() {
		return diseaseAltNm;
	}


	public void setDiseaseAltNm(String diseaseAltNm) {
		this.diseaseAltNm = diseaseAltNm;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "Disease [diseaseNo=" + diseaseNo + ", diseaseNm=" + diseaseNm + ", deptNo=" + deptNo + ", reservable="
				+ reservable + ", sect01=" + sect01 + ", text01=" + text01 + ", pic01=" + pic01 + ", sect02=" + sect02
				+ ", text02=" + text02 + ", pic02=" + pic02 + ", sect03=" + sect03 + ", text03=" + text03 + ", pic03="
				+ pic03 + ", sect04=" + sect04 + ", text04=" + text04 + ", pic04=" + pic04 + ", sect05=" + sect05
				+ ", text05=" + text05 + ", pic05=" + pic05 + ", sect06=" + sect06 + ", text06=" + text06 + ", pic06="
				+ pic06 + ", sect07=" + sect07 + ", text07=" + text07 + ", pic07=" + pic07 + ", diseaseAltNm="
				+ diseaseAltNm + "]";
	}

}