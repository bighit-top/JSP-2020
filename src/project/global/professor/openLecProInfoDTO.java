package project.global.professor;

public class openLecProInfoDTO {
	private String proname; //교수명
	private String propart; //담당학과
	private String id; //교수의 학번
	
	public void setProname(String proname) {
		this.proname = proname;
	}
	public void setPropart(String propart) {
		this.propart = propart;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getProname() {
		return proname;
	}
	public String getPropart() {
		return propart;
	}
	public String getId() {
		return id;
	}
}
