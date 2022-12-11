package project.global.admin;

// table:status / 휴복학신청 조회/승인 페이지

public class timeoffappDTO {
	private String stnum;		//학번
	private String name;		//이름
	private String couse;		//휴학사유
	private String day;		//신청일자
	private String year;		//적용년도
	private String semester;	//적용학기
	private int approval;			//승인
	
	public void setStnum(String stnum) {
		this.stnum = stnum;
	}
	
	public String getStnum() {
		return stnum;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	
	public void setCouse(String couse) {
		this.couse = couse;
	}
	
	public String getCouse() {
		return couse;
	}
	
	public void setDay(String day) {
		this.day = day;
	}
	
	public String getDay() {
		return day;
	}
	
	public void setYear(String year) {
		this.year = year;
	}
	
	public String getYear() {
		return year;
	}
	
	public void setSemester(String semester) {
		this.semester = semester;
	}
	
	public String getSemester() {
		return semester;
	}
	
	public void setApproval(int approval) {
		this.approval = approval;
	}
	
	public int getApproval() {
		return approval;
	}
}
