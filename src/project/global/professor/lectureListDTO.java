package project.global.professor;

public class lectureListDTO {
	private String building; //건물명
	private String roomnum; //강의실
	private String day; //요일
	private int time; //교시
	private int can; //정원
	private String classcode; //강의실코드
	private String part; //학과
	private String classname; //강의명
	private String score; //학점
	
	
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
	public void setClasscode(String classcode) {
		this.classcode = classcode;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public void setClassname(String classname) {
		
		this.classname = classname;
	}
	public void setScore(String score) {
		this.score = score;
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
	public String getClasscode() {
		return classcode;
	}
	public String getPart() {
		
		return part;
	}
	public String getClassname() {
		
		return classname;
	}
	public String getScore() {
		return score;
	}

}
