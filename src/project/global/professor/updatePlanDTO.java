package project.global.professor;

public class updatePlanDTO {
	private String building; //건물이름
	private String roomnum; //강의실호수
	private String day; //요일
	private int time; //교시
	private String can; //인원
	private String proemail; //교수이메일!
	private String classnum; //강의번호(코드)
	private String classname; //강의명
	private String homeroompro; //교수명
	private String part; //소속학과
	private String who; //수강대상
	private String date1; //년도
	private String semester; //학기
	private int score; //학점
	private String goal; //강의목표
	
	public String getDate1() {
		return date1;
	}
	public void setDate1(String date1) {
		this.date1 = date1;
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
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public String getRoomnum() {
		return roomnum;
	}
	public void setRoomnum(String roomnum) {
		this.roomnum = roomnum;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getHomeroompro() {
		return homeroompro;
	}
	public void setHomeroompro(String homeroompro) {
		this.homeroompro = homeroompro;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getWho() {
		return who;
	}
	public void setWho(String who) {
		this.who = who;
	}
	public String getGoal() {
		return goal;
	}
	public void setGoal(String goal) {
		this.goal = goal;
	}
	public String getBuilding() {
		return building;
	}
	public void setBuilding(String building) {
		this.building = building;
	}
	public String getCan() {
		return can;
	}
	public void setCan(String can) {
		this.can = can;
	}
	public String getProemail() {
		return proemail;
	}
	public void setProemail(String proemail) {
		this.proemail = proemail;
	}
}
