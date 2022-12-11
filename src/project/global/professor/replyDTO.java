package project.global.professor;

import java.sql.Timestamp;

public class replyDTO {
	private int qno;
	private String replytext;
	private String rname;
	private Timestamp replydate;
	private int step;
	private String classnum;
	private String id;
	
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public Timestamp getReplydate() {
		return replydate;
	}
	public void setReplydate(Timestamp replydate) {
		this.replydate = replydate;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public String getClassnum() {
		return classnum;
	}
	public void setClassnum(String classnum) {
		this.classnum = classnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	
}
