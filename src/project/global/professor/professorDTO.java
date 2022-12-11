package project.global.professor;

public class professorDTO {
	private String building; //건물이름
	private String roomnum; //강의실 호수
	private String day; //요일
	private String time; //교시
	private String classnum; //강의코드

	public String getBuilding() {
		return building;
	}

	public void setBuilding(String building) {
		this.building = building;
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

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getClassnum() {
		return classnum;
	}

	public void setClassnum(String classnum) {
		this.classnum = classnum;
	}


}
