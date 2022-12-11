package project.global.admin;

import java.sql.Timestamp;

//테이블 이름 : sexnight 

public class sleepoutDTO {
	//외박 승인 페이지 데이터
	private int no; //시퀀스
	private String part; //학과
	private String stnum; //학번
	private String name; //성명
	private int allow; //승인
	//외박 승인 페이지에서 성명 클릭시 sleeplistPro.jsp에서 보이는 데이터
	private String outsleep; //외박사유
	private Timestamp startday; //외박 시작일
	private Timestamp comeback; //외박 귀가일
	private String secret; //외박 내용
	
	
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
	public int getAllow() {
		return allow;
	}
	public void setAllow(int allow) {
		this.allow = allow;
	}
	public String getOutsleep() {
		return outsleep;
	}
	public void setOutsleep(String outsleep) {
		this.outsleep = outsleep;
	}
	public Timestamp getStartday() {
		return startday;
	}
	public void setStartday(Timestamp startday) {
		this.startday = startday;
	}
	public Timestamp getComeback() {
		return comeback;
	}
	public void setComeback(Timestamp comeback) {
		this.comeback = comeback;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
}
