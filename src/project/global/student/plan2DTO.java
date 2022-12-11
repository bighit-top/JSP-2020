package project.global.student;

public class plan2DTO {
	private String classnum;//강의코드
	private String classname;//강의명
	private String date1;//년도
	private String semester;//학기
	private String part;//학과
	private String homeroompro;//담당교수
	private int score;//학점
	private String building;//건물
	private String roomnum;//강의실
	private String day;//요일
	private int time;//교시
	private int can; //정원
	private int allow;//강의유효성

	public void setClassnum(String classnum) {
		this.classnum = classnum;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}
	public void setDate1(String date1) {
		this.date1 = date1;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public void setPart(String part) {
		 this.part = part;
	}
	public void setHomeroompro(String homeroompro) {
		this.homeroompro = homeroompro;
	}
	public void setScore(int score) {
		this.score = score;
	}
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
	public void setCan(int can) {
		this.can = can;
	}
	public void setAllow(int allow) {
		this.allow = allow;
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
	public int getCan() {
		return can;
	}
	public String getClassnum() {
		return classnum;
	}
	public String getClassname() {
		return classname;
	}
	public String getDate1() {
		return date1;
	}
	public String getSemester() {
		return semester;
	}
	public String getPart() {
		return part;
	}
	public String getHomeroompro() {
		return homeroompro;
	}
	public int getScore() {
		return score;
	}
	public int getallow() {
		return allow;
	}
	
}
