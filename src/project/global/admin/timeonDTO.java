package project.global.admin;

public class timeonDTO {
	private String name;
	private String day;
	private String stnum;
	private String year;
	private String semester;
	private String backschool;
	private int approval;
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	
	public void setDay(String day) {
		this.day = day;
	}
	
	public String getDay() {
		return day;
	}
	
	public void setStnum(String stnum) {
		this.stnum = stnum;
	}
	
	public String getStnum() {
		return stnum;
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

	public String getBackschool() {
		return backschool;
	}

	public void setBackschool(String backschool) {
		this.backschool = backschool;
	}

	public int getApproval() {
		return approval;
	}

	public void setApproval(int approval) {
		this.approval = approval;
	}

}
