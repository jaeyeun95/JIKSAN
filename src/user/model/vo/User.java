package user.model.vo;

import java.sql.Date;

//vo(value object) == do(domain object) == dto(data transfer object)
public class User implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	
	private int userNo;		//회원 번호
	private String userId;		//회원 아이디
	private String userPw;	//회원 비밀번호
	private String userNm;		//회원 이름
	private java.sql.Date birthday; //회원 생년월일
	private String gender;	//회원 성별
	private String phone;	//회원 번호
	private String address;	//회원 주소
	private String nickNm;		//회원 닉네임
	private int userLv;  //USER 테이블의 user_lv(접속보안등급) 컬럼값 저장용
	private String loginOk;  //로그인 제한 여부
	private java.sql.Date enrollDate;	//회원 가입 날짜
	private java.sql.Date lastModified;	//회원정보 마지막 수정날짜
	
	public User() {}

	public User(int userNo, String userId, String userPw, String userNm, Date birthday, String gender, String phone,
			String address, String nickNm, int userLv, String loginOk, Date enrollDate, Date lastModified) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPw = userPw;
		this.userNm = userNm;
		this.birthday = birthday;
		this.gender = gender;
		this.phone = phone;
		this.address = address;
		this.nickNm = nickNm;
		this.userLv = userLv;
		this.loginOk = loginOk;
		this.enrollDate = enrollDate;
		this.lastModified = lastModified;
	}



	public int getUserNo() {
		return userNo;
	}



	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getUserPw() {
		return userPw;
	}



	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}



	public String getUserNm() {
		return userNm;
	}



	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}



	public java.sql.Date getBirthday() {
		return birthday;
	}



	public void setBirthday(java.sql.Date birthday) {
		this.birthday = birthday;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getNickNm() {
		return nickNm;
	}



	public void setNickNm(String nickNm) {
		this.nickNm = nickNm;
	}



	public int getUserLv() {
		return userLv;
	}



	public void setUserLv(int userLv) {
		this.userLv = userLv;
	}



	public String getLoginOk() {
		return loginOk;
	}



	public void setLoginOk(String loginOk) {
		this.loginOk = loginOk;
	}



	public java.sql.Date getEnrollDate() {
		return enrollDate;
	}



	public void setEnrollDate(java.sql.Date enrollDate) {
		this.enrollDate = enrollDate;
	}



	public java.sql.Date getLastModified() {
		return lastModified;
	}



	public void setLastModified(java.sql.Date lastModified) {
		this.lastModified = lastModified;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userId=" + userId + ", userPw=" + userPw + ", userNm=" + userNm
				+ ", birthday=" + birthday + ", gender=" + gender + ", phone=" + phone + ", address=" + address
				+ ", nickNm=" + nickNm + ", userLv=" + userLv + ", loginOk=" + loginOk + ", enrollDate=" + enrollDate
				+ ", lastModified=" + lastModified + "]";
	}

}

