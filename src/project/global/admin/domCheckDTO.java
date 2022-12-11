package project.global.admin;
//입실 테이블 이름: enter
//domCheckForm, domCheckPro 에서 데이터 사용
//기숙사 입실 승인 페이지 데이터
public class domCheckDTO {
	private int no; //시퀀스번호
	private String stnum; //학번
	private String part; //학과
	private String name;  //성명
	private String dreamroom; //생활관
	private int allow; //승인버튼
	private String gender; //성별
	private String ho; //호실
	
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
	public String getDreamroom() {
		return dreamroom;
	}
	public void setDreamroom(String dreamroom) {
		this.dreamroom = dreamroom;
	}
	public int getAllow() {
		return allow;
	}
	public void setAllow(int allow) {
		this.allow = allow;
	}

	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getHo() {
		return ho;
	}
	public void setHo(String ho) {
		this.ho = ho;
	}



	
}
