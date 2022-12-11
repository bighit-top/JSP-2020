package project.global.student;

import java.sql.Timestamp;

public class stuLostDTO{

	private int num; 
    private String writer;
    private String subject;
    private String content;
 	private Timestamp reg_date;
    private int readcount;
  
 

	public void setNum(int num){
    	this.num=num;
    }
    public void setWriter (String writer) {
        this.writer = writer;
    }
    public void setSubject (String subject) {
        this.subject = subject;
    }
    
    public void setContent (String content) {
        this.content = content;
    }
    
    public void setReg_date (Timestamp reg_date) {
        this.reg_date = reg_date;
    }
	public void setReadcount(int readcount){
	  	this.readcount=readcount;
	}
 

    
    public int getNum(){
    	return num;
    }
    public int getReadcount(){
   	    return readcount;
    }
    public String getWriter () {
        return writer;
    }
    public String getSubject () {
        return subject;
    }
  
    public String getContent () {
        return content;
    }
   
    public Timestamp getReg_date () {
        return reg_date;
    }


}