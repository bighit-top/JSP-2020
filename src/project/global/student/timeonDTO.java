package project.global.student;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;

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
	
	public void setDay() {
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		int nYear = calendar.get(Calendar.YEAR);
		int nMonth = calendar.get(Calendar.MONTH) + 1;
		int nDay = calendar.get(Calendar.DAY_OF_MONTH);
		
		String year = Integer.toString(nYear);
		String mon = Integer.toString(nMonth);
		String day1 = String.format("%02d", nDay);

		this.day = year+"-0"+mon+"-"+day1;
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
	
	public void setBackschool(String backschool) {
		this.backschool = backschool;
	}
	
	public String getBackschool() {
		return backschool;
	}
	
	public void setApproval(int approval) {
		this.approval = approval;
	}
	
	public int getApproval() {
		return approval;
	}

}
