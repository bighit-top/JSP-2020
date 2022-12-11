package project.global.student;

public class tableDTO { //시간표 수강신청테이블
	
	private String classname; //강의명
	private String homeroompro; //담당교수
	private int score; //학점
	private String classroom; //강의실
	private String classtime; //강의시간
	private String date1; //년도
	private String semester; //학기
	private String building; //건물명
	private String day; //요일
	private String classnum; //강의코드
	private String part; //학과

	
	public void setClassname(String classname) {
		this.classname = classname;
	}
	public void setHomeroompro(String homeroompro) {
		this.homeroompro = homeroompro;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}
	public void setClasstime(String classtime) {
		this.classtime = classtime;
	}
	public void setDate1(String date1) {
		this.date1 = date1;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public void setBuilding(String building) {
		this.building = building;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public void setClassnum(String classnum) {
		this.classnum = classnum;
	}
	public void setPart(String part) {
		this.part = part;
	}


	
	public String getClassname(){
		return classname;
	}
	public String getHomeroompro() {
		return homeroompro;
	}
	public int getScore() {
		return score;
	}
	public String getClassroom() {
		return classroom;
	}
	public String getClasstime(){
		return classtime;
	}
	public String getDate1() {
		return date1;
	}
	public String getSemester() {
		return semester;
	}
	public String getBuilding() {
		return building;
	}
	public String getDay() {
		return day;
	}
	public String getClassnum() {
		return classnum;
	}
	public String getPart() {
		return part;
	}

}
