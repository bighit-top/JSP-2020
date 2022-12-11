package project.global.admin;

public class calendar2DTO { //학사일정 - 일정관리테이블
	private String day; //일정 날짜
	private String contents; //일정내용
	
	public void setDay(String day) {
		this.day = day;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public String getDay() {
		return day;
	}
	public String getContents() {
		return contents;
	}
}
