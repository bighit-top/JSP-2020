package project.global.admin;

import java.sql.Timestamp;

//table : student / 학생정보입력 dto

public class stumodifyDTO {
		
	private String stname;	// 이름
	private int year1;		// 년
	private int mon;		// 월
	private int day1;		// 일
	private String stnum;	// 학번
	private String part;	// 학과
	private String phone;	// 핸드폰번호
	private String zon;		// 우편번호
	private String street;	// 도로명주소
	private String addr;	// 상세주소
	private String bank;	// 개설은행
	private String acnt;	// 계좌
	private int grade;		// 학년
	private String image;	// 이미지
	private String floor;	// 신분
	private Timestamp acsday;	// 접속날짜
	private String sex;		// 성별
	private String domiuse;	// 기숙사 사용여부
	private String pw; 		// 비밀번호
	private String email;
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getEmail() {
		return email;
	}
	
		
	public Timestamp getAcsday() {
		return acsday;
	}

	public void setAcsday(Timestamp acsday) {
		this.acsday = acsday;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getDomiuse() {
		return domiuse;
	}

	public void setDomiuse(String domiuse) {
		this.domiuse = domiuse;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public void setFloor(String floor) {
		this.floor = floor;
	}
	
	public String getFloor() {
		return floor;
	}	
	
	public void setImage(String image) {
		this.image = image;
	}
	
	public String getImage() {
		return image;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	public int getGrade() {
		return grade;
	}
	
	public void setStname(String stname) {
		this.stname = stname;
	}
	
	public String getStname() {
		return stname;
	}
	
	public void setYear1(int year1) {
		this.year1 = year1;
	}
	
	public int getYear1() {
		return year1;
	}
	
	public void setMon(int mon) {
		this.mon = mon;
	}
	
	public int getMon() {
		return mon;
	}
	
	public void setDay1(int day1) {
		this.day1 = day1;
	}
	
	public int getDay1() {
		return day1;
	}
	
	public void setStnum(String stnum) {
		this.stnum = stnum;
	}
	
	public String getStnum() {
		return stnum;
	}
	
	public void setPart(String part) {
		this.part = part;
	}
	
	public String getPart() {
		return part;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setZon(String zon) {
		this.zon = zon;
	}
	
	public String getZon() {
		return zon;
	}
	
	public void setStreet(String street) {
		this.street = street;
	}
	
	public String getStreet() {
		return street;
	}
	
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	public String getAddr() {
		return addr;
	}
	
	public void setBank(String bank) {
		this.bank = bank;
	}
	
	public String getBank() {
		return bank;
	}
	
	public void setAcnt (String acount){
		this.acnt = acount;
	}
	
	public String getAcnt() {
		return acnt;
	}
}
