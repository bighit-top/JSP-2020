package project.global.student;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;

public class changePartDTO {
	private String date1; //년도
	private String semester;//학기
	private String stname;//이름
	private String stnum;//학번
	private String grade;//학년
	private String bfname;//기존학과
	private String bfnum;//기존학과코드
	private String afname;//변경학과
	private String afnum;//변경학과코드
	private String appdate;//신청일
	private String subjectfile;//첨부파일
	private int proapp;//1차교수승인
	private int adapp;//2차관리자승인
	private String couse;//전과신청이유
	private int finalapp;//최종승인
	private String stphone;//학생전화번호
	private String stemail;//학생이메일
	
	public void setDate1(String date1) {
		this.date1 = date1;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public void setStname(String stname) {
		this.stname = stname;
	}
	public void setStnum(String stnum) {
		this.stnum = stnum;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public void setBfname(String bfname) {
		this.bfname = bfname;
	}
	public void setBfnum(String bfnum) {
		this.bfnum = bfnum;
	}
	public void setAfname(String afname) {
		this.afname = afname;
	}
	public void setAfnum(String afnum) {
		this.afnum = afnum;
	}
	public void setAppdate(String appdate) {
		this.appdate = appdate;
	}
	
	public void setAppdate() {
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		int nYear = calendar.get(Calendar.YEAR);
		int nMonth = calendar.get(Calendar.MONTH) + 1;
		int nDay = calendar.get(Calendar.DAY_OF_MONTH);
		
		String year = Integer.toString(nYear);
		String mon = Integer.toString(nMonth);
		String day = Integer.toString(nDay);
		this.appdate = year+"-0"+mon+"-"+day;
	}
	public void setSubjectfile(String subjectfile) {
		this.subjectfile = subjectfile;
	}
	public void setProapp(int proapp) {
		this.proapp = proapp;
	}
	public void setAdapp(int adapp) {
		this.adapp = adapp;
	}
	public void setCouse(String couse) {
		this.couse = couse;
	}
	public void setFinalapp(int finalapp) {
		this.finalapp = finalapp;
	}
	public void setStphone(String stphone) {
		this.stphone = stphone;
	}
	public void setStemail(String stemail) {
		this.stemail = stemail;
	}
	
	
	
	public String getDate1() {
		return date1;
	}
	public String getSemester() {
		return semester;
	}
	public String getStname() {
		return stname;
	}
	public String getStnum() {
		return stnum;
	}
	public String getGrade() {
		return grade;
	}
	public String getBfname() {
		return bfname;
	}
	public String getBfnum() {
		return bfnum;
	}
	public String getAfname() {
		return afname;
	}
	public String getAfnum() {
		return afnum;
	}
	public String getAppdate() {
		return appdate;
	}
	public String getSubjectfile() {
		return subjectfile;
	}
	public int getProapp() {
		return proapp;
	}
	public int getAdapp() {
		return adapp;
	}
	public String getCouse() {
		return couse;
	}
	public int getFinalapp() {
		return finalapp;
	}
	public String getStphone() {
		return stphone;
	}
	public String getStemail() {
		return stemail;
	}
	

}
