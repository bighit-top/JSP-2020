package project.global.professor;

import java.sql.Timestamp;

public class qaDTO {
	private int num; //시퀀스
	private String writer; //작성자
	private String subject; //제목
	private String content; //내용
	private Timestamp reg_date; //작성날짜
	private int readcount; //조회수
	private String classname; //강의명
	private String homeroompro; //교수명
	private String classnum; //강의코드
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getLecture() {
		return classnum;
	}
	public void setLecture(String lecture) {
		this.classnum = lecture;
	}
	public String getClassnum() {
		return classnum;
	}
	public void setClassnum(String classnum) {
		this.classnum = classnum;
	}
	public String getClassname() {
		return classname;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}
	public String getHomeroompro() {
		return homeroompro;
	}
	public void setHomeroompro(String homeroompro) {
		this.homeroompro = homeroompro;
	}

}
