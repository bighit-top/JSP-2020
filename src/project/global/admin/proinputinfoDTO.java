package project.global.admin;

// table : professor / 교수정보입력 dto

public class proinputinfoDTO {
	private String image;		//이미지
	private String proname;		//교수이름
	private String proborn;		// 생일
	private String propart;		//담당학과
	private String tel1;		//핸드폰번호
	private String proemail;	//이메일
	private String zone;		//우편주소
	private String street;		//도로명주소
	private String addr;		//상세주소
	private String bank;		//은행
	private String acount;		//계좌
	private String id;			// 교수학번
	private String pw;			// 교수 비번
	private String propartcode;	// 담당학과 코드
	
	public void setPropartcode(String propartcode) {
		this.propartcode = propartcode;
	}
	
	public String getPropartcode() {
		return propartcode;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getId() {
		return id;
	}
	
	public void setPw(String pw) {
		this.pw =  pw;
	}
	
	public String getPw() {
		return pw;
	}
		
	public void setImage(String image) {
		this.image = image;
	}
	
	public String getImage() {
		return image;
	}
	
	public void setProname(String proname) {
		this.proname = proname;
	}
	
	public String getProname() {
		return proname;
	}
	
	public void setProborn(String proborn) {
		this.proborn = proborn;
	}
	
	public String getProborn() {
		return proborn;
	}
	
	public void setPropart(String propart) {
		this.propart = propart;
	}
	
	public String getPropart() {
		return propart;
	}
	
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	
	public String getTel1() {
		return tel1;
	}
	
	public void setProemail(String proemail) {
		this.proemail = proemail;
	}
	
	public String getProemail() {
		return proemail;
	}
	
	public void setZone(String zone) {
		this.zone = zone;
	}
	
	public String getZone() {
		return zone;
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
	
	public String getAddr() {
		return addr;
	}
	
	public void setBank(String bank) {
		this.bank = bank;
	}
	
	public String getBank() {
		return bank;
	}
	
	public void setAcount(String acount) {
		this.acount = acount;
	}
	
	public String getAcount() {
		return acount;
	}
	
}
