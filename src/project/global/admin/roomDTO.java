package project.global.admin;
//입실 테이블 사용 : enter 
//기숙사 합격자 방 배정 페이지 데이터
public class roomDTO {
	//private int no; //시퀀스 번호
	private int allow; //기숙사 입실 승인 여부
	private String stnum;//학번
	private String gender; //성별
	private String dreamroom; //생활관(동)
	private String name; //성명
	private String part; //학과
	private String ho; //호실 배정
	private int ok; //배정완료 승인버튼
	
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getStnum() {
		return stnum;
	}
	public void setStnum(String stnum) {
		this.stnum = stnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDreamroom() {
		return dreamroom;
	}
	public void setDreamroom(String dreamroom) {
		this.dreamroom = dreamroom;
	}
	public String getHo() {
		return ho;
	}
	public void setHo(String ho) {
		this.ho = ho;
	}

	public int getOk() {
		return ok;
	}
	public void setOk(int ok) {
		this.ok = ok;
	}
	public int getAllow() {
		return allow;
	}
	public void setAllow(int allow) {
		this.allow = allow;
	}


}
