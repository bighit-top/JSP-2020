package project.global.professor;

public class SuccLecturListDTO {
	
	private String date;
	private String classnum;
	private String classname;
	private int score;
	private String semester;
	private String roomcode;
	private String timecode;
	private String classplan;
	

	public void setDate(String date) {
		
		this.date = date;
	}
	public void setClassnum(String classnum) {
		
		this.classnum = classnum; 
	}
	public void setClassname(String classname) {
		
		this.classname = classname;
	}
	public void setScore(int score) {
		
		this.score = score;
	}
	public void setSemester(String semester) {
		
		this.semester = semester;
	}
	public void setRoomcode(String roomcode) {
		
		this.roomcode = roomcode;
	}
	public void setTimecode(String timecode) {
		
		this.timecode = timecode;
	}
	public void setClassplan(String classplan) {
		
		this.classplan = classplan;
	}

	public String getDate() {
		return date;
	}
	public String getClassnum() {
		return classnum;
	}
	public String getClassname() {
		
		return classname;
	}
	public int getScore() {
		
		return score;
	}
	public String getSemester() {
		
		return semester;
	}
	public String getRoomcode() {
		
		return roomcode;
	}
	public String getTimecode() {
		
		return timecode;
	}
	public String getClassplan() {
		
		return classplan;
	}
	
}
