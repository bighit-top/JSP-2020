package project.global.student;
import java.sql.Timestamp;


public class sleepoutAppDTO {
	private String stnum;
	private String name;
	private String startday;
	private String comeback;
	private String dreamroom;
	private String ho;
	private String outsleep;
	private String secret;
	private String part;
	private Timestamp send;
	
	
	
	
	public Timestamp getSend() {
		return send;
	}
	public void setSend(Timestamp send) {
		this.send = send;
	}
	public void setStnum(String stnum){
		this.stnum=stnum;
	}
	public String getStnum() {
		return stnum;
	}
	public void setName(String name) {
		this.name= name;
	}
	public String getName() {
		return name;
	}
	public void setStartday(String startday) {
		this.startday= startday;
	}
	public String getStartday() {
		return startday;
	}
	public void setComeback(String comeback) {
		this.comeback= comeback;
	}
	public String getComeback() {
		return comeback;
	}
	public void setDreamroom(String dreamroom) {
		this.dreamroom= dreamroom;
	}
	public String getDreamroom() {
		return dreamroom;
	}
	public void setHo(String ho) {
		this.ho = ho;
	}
	public String getHo() {
		return ho;
	}
	public void setOutsleep(String outsleep) {
		this.outsleep = outsleep;
	}
	public String getOutsleep() {
		return outsleep;
	}
	public void setSecret(String secret) {
		this.secret= secret;
	}
	public String getSecret() {
		return secret;
	}
	public void setPart(String part) {
		this.part= part;
	}
	public String getPart() {
		return part;
	}
	
	
	
	

}
