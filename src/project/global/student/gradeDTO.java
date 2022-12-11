package project.global.student;

public class gradeDTO { //성적조회 - 성적테이블
	private String stnum; //학번
	private String stname; //학생이름
	private String lecturecode; //강의코드
	private String classname; //강의명
	private int record; //성적
	private String grade; //학년
	private int score; //학점
	private String part; //학과

	public void setStnum(String stnum){
		this.stnum = stnum;
	}
	public void setStname(String stname) {
		this.stname = stname;
	}
	public void setLecturecode(String lecturecode) {
		this.lecturecode = lecturecode;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}
	public void setRecord(int record) {
		this.record = record;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public void setPart(String part) {
		this.part = part;
	}
	
	public String getStnum() {
		return stnum;
	}
	public String getStame() {
		return stname;
	}
	public String getLecturecode() {
		return lecturecode;
	}
	public String getClassname() {
		return classname;
	}
	public int getRecord() {
		return record;
	}
	public String getGrade() {
		return grade;
	}
	public int getScore() {
		return score;
	}
	public String getPart() {
		return part;
	}
}
