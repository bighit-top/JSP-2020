package project.global.admin;

import java.sql.Timestamp;

public class nightDTO {
	private int no; //시퀀스
	private String stnum; //학번
	private int allow; //승인
	private String name; //이름
	private String dreamroom; //생활관
	private String ho; //호
	private String part; //학과
	private Timestamp reg_date; //신청날짜
	private String startday; //시작일
	private String comeback; //귀가일
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getStnum() {
		return stnum;
	}
	public void setStnum(String stnum) {
		this.stnum = stnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDreamroom() {
		return dreamroom;
	}
	public void setDreamroom(String dreamroom) {
		this.dreamroom = dreamroom;
	}
	public String getHo() {
		return ho;
	}
	public void setHo(String ho) {
		this.ho = ho;
	}
	public int getAllow() {
		return allow;
	}
	public void setAllow(int allow) {
		this.allow = allow;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getStartday() {
		return startday;
	}
	public void setStartday(String startday) {
		this.startday = startday;
	}
	public String getComeback() {
		return comeback;
	}
	public void setComeback(String comeback) {
		this.comeback = comeback;
	}
	
}
