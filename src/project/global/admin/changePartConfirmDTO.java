package project.global.admin;

public class changePartConfirmDTO {

	private String date1; //년도
	private String semester;//학기
	private String stname;//이름
	private String stnum;//학번
	private String grade;//학년
	private String bfname;//기존학과
	private String afname;//변경학과
	private String couse;//전과신청이유
	private String appdate;//신청일
	private int proapp;//1차교수승인
	private int adapp;//2차관리자승인
	private int finalapp;//최종승인
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
	public void setAfname(String afname) {
		this.afname = afname;
	}
	public void setCouse(String couse) {
		this.couse = couse;
	}
	public void setAppdate(String appdate) {
		this.appdate = appdate;
	}
	public void setProapp(int proapp) {
		this.proapp = proapp;
	}
	public void setAdapp(int adapp) {
		this.adapp = adapp;
	}
	public void setFinalapp(int finalapp) {
		this.finalapp = finalapp;
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
	public String getAfname() {
		return afname;
	}
	public String getCouse() {
		return couse;
	}
	public String getAppdate() {
		return appdate;
	}
	public int getProapp() {
		return proapp;
	}
	public int getAdapp() {
		return adapp;
	}
	public int getFinalapp() {
		return finalapp;
	}
	public String getStemail() {
		return stemail;
	}
}
