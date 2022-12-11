package project.global.student;

public class appDTO { //수강신청 - 수강신청테이블
	
	private String building; //건물이름
	private String roomnum; //강의실 호수
	private String day; //요일
	private int time; //교시
	private String can; //인원
	private String classnum; //강의코드
	private String classname; //강의명
	private String homeroompro; //담당교수
	private String part; //학과
	private String who; //수강대상
	private String date1; //년도
	private String semester; //학기
	private int score; //학점
	private String stname;//학생이름
	private String stnum;//학번
	private int app; //신청
	private int allow; //강의유효확인
	private String grade; //학년
	
	
	
	public void setBuilding(String building) {
		this.building = building;
	}
	public void setRoomnum(String roomnum) {
		this.roomnum = roomnum;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public void setCan(String can) {
		this.can = can;
	}
	public void setClassnum(String classnum) {
		this.classnum = classnum;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}
	public void setHomeroompro(String homeroompro) {
		this.homeroompro = homeroompro;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public void setWho(String who) {
		this.who = who;
	}
	public void setDate1(String date1) {
		this.date1 = date1;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public void setStname(String stname) {
		this.stname = stname;
	}
	public void setStnum(String stnum) {
		this.stnum = stnum;
	}
	public void setApp(int app) {
		this.app = app;
	}
	public void setAllow(int allow) {
		this.allow = allow;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}

	
	public String getBuilding() {
		return building;
	}
	public String getRoomnum() {
		return roomnum;
	}
	public String getDay() {
		return day;
	}
	public int getTime() {
		return time;
	}
	public String getCan() {
		return can;
	}
	public String getClassnum() {
		return classnum;
	}
	public String getClassname() {
		return classname;
	}
	public String getHomeroompro() {
		return homeroompro;
	}
	public String getPart() {
		return part;
	}
	public String getWho() {
		return who;
	}
	public String getDate1() {
		return date1;
	}
	public String getSemester() {
		return semester;
	}
	public int getScore() {
		return score;
	}	
	public String getStname() {
		return stname;
	}
	public String getStnum() {
		return stnum;
	}
	public int getApp() {
		return app;
	}
	public int getAllow() {
		return allow;
	}
	public String getGrade() {
		return grade;
	}
	
}
