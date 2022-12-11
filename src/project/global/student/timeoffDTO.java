package project.global.student;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;

// table : status / 휴복학 신청 dto
public class timeoffDTO {
	private String name;		// 이름
	private String stnum;		// 학번
	private String couse;		// 휴학사유
	private String day;			// 신청일자
	private String year;		// 적용년도
	private String semester;	// 적용학기
	private String zon;			// 우편번호
	private String street;		// 도로명주소
	private String addr;		// 상세주소
	private int approval;	// 승인여부

	public void setZon(String zon) {
		this.zon = zon;
	}
	
	public String getZon() {
		return zon;
	}
	
	public void setStreet(String street) {
		this.street = street;
	}
	
	public String getStreet() {
		return street;
	}
	
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	public 	String getAddr() {
		return addr;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	
	public void setStnum(String stnum) {
		this.stnum = stnum;
	}
	
	public String getStnum() {
		return stnum;
	}
	
	public void setCouse(String couse) {
		this.couse =couse;
	}
	
	public String getCouse() {
		return couse;
	}
	
	public void setDay() {
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		int nYear = calendar.get(Calendar.YEAR);
		int nMonth = calendar.get(Calendar.MONTH) + 1;
		int nDay = calendar.get(Calendar.DAY_OF_MONTH);
		
		String year = Integer.toString(nYear);
		String mon = Integer.toString(nMonth);
		String day = String.format("%02d", nDay);

		this.day = year+"-0"+mon+"-"+day;
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
	
	public void setYear() {
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		int nYear = calendar.get(Calendar.YEAR);
		int nMonth = calendar.get(Calendar.MONTH) + 1;
		
		int num = nYear;	// 올해년도
		if(nMonth > 7) {	// 현재 월이 7보다 크면 올해 년도 1 추가 
			num++;			// : 8~12 월에 휴학 신청시 내년 1학기 휴학 신청 가능. 
		}
		String year = Integer.toString(num);
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
	
	public void setApproval(int approval){
		this.approval = approval;
	}
	
	public int getApproval() {
		return approval;
	}

}
