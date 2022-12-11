package project.global.professor;

public class lecturesuccDTO {
	private String roomcode;
	private String timecode;
	private String score;
	
	public void setRoomcode(String roomcode) {
		
		this.roomcode = roomcode;
	}
	public void setTimecode(String timecode) {
		
		this.timecode = timecode;
	}
	public void setScore(String score) {
		
		this.score = score;
	}
	
	public String getRoomcode() {
		return roomcode;
	}
	public String getTimecode() {
		return timecode;
	}
	public String getScore() {
		return score;
	}
}
