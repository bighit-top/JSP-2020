package project.global.admin;

//퇴실 테이블 이름: leaving
//domoutForm, domoutPro / domOkForm 에서 데이터 사용
//퇴실 승인 페이지 데이터
public class domoutDTO {
	private int no; //시퀀스번호
	private String stnum; //학번
	private String part; //학과
	private String name; //성명
	private String dormitory; //생활관
	private String ho; //호
	private String reason; //퇴실사유
	private String dday; //퇴실예정일
	private int allow; //승인버튼

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getStnum() {
		return stnum;
	}
	public void setStnum(String stnum) {
		this.stnum = stnum;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getDday() {
		return dday;
	}
	public void setDday(String dday) {
		this.dday = dday;
	}
	public int getAllow() {
		return allow;
	}
	public void ssetAllow(int allow) {
		this.allow = allow;
	}
	public String getHo() {
		return ho;
	}
	public void setHo(String ho) {
		this.ho = ho;
	}
	public String getDormitory() {
		return dormitory;
	}
	public void setDormitory(String dormitory) {
		this.dormitory = dormitory;
	}
	
}
