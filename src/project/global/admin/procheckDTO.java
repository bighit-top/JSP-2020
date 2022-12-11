package project.global.admin;

import java.sql.Timestamp;

//table : classroom (강의실 개설 테이블)/ 강의실 신청내역 / procheckForm

public class procheckDTO {
	
	private String can; // 인원
	private String classnum; //강의코드
	private int allow; // 승인/거절
	private String classname; //강의명
	private int score; //학점 
	private Timestamp reg_date; //신청 날짜 
	
	public String getCan() {
		return can;
	}
	public void setCan(String can) {
		this.can = can;
	}
	public String getClassnum() {
		return classnum;
	}
	public void setClassnum(String classnum) {
		this.classnum = classnum;
	}
	public int getAllow() {
		return allow;
	}
	public void setAllow(int allow) {
		this.allow = allow;
	}
	public String getClassname() {
		return classname;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
		
	
	
}
