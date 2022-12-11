package project.global.professor;

public class proevalDTO {
	private String homeroompro;//성명 class1        //private String a;
	private String id;//교수아이디(교수학번) class1
	private String part;//교수학과 class1
	private String classname;//담당과목 evaluation , ==강의명
	private String date1;//년도 evaluation
	private String semester;//학기 evaluation
	private String topro;//기타사항(하고싶은말) evaluation
	private int total;//총점 evaluation
	private String stnum;//학번
	
	
	private int num1; //문항~
	private int num2;
	private int num3;
	private int num4;
	private int num5;
	private int num6;
	private int num7;
	private int num8;
	private int num9;
	private int num10;

	public void setStnum(String stnum) {
		this.stnum=stnum;
	}
	
	
	public void setHomeroompro(String homeroompro) {  //public void setA(String b)
		this.homeroompro=homeroompro;					// this.a=b;
	}
	public void setId(String id) {
		this.id=id;
	}
	public void setPart(String part) {
		this.part=part;
	}
	public void setClassname(String classname) {
		this.classname=classname;
	}
	public void setDate1(String date1) {
		this.date1=date1;
	}
	public void setSemester(String semester) {
		this.semester=semester;
	}
	public void setTopro(String topro) {
		this.topro=topro;
	}
	public void setTotal(int total) {
		this.total= total;
	}
	public void setNum1(int num1) {
		this.num1 = num1;
	}
	public void setNum2(int num2) {
		this.num2 = num2;
	}
	public void setNum3(int num3) {
		this.num3 = num3;
	}
	public void setNum4(int num4) {
		this.num4 = num4;
	}
	public void setNum5(int num5) {
		this.num5 = num5;
	}
	public void setNum6(int num6) {
		this.num6 = num6;
	}
	public void setNum7(int num7) {
		this.num7 = num7;
	}
	public void setNum8(int num8) {
		this.num8 = num8;
	}
	public void setNum9(int num9) {
		this.num9 = num9;
	}
	public void setNum10(int num10) {
		this.num10 = num10;
	}
	
	

	public String getStnum() {
		return stnum;
	}
	
	public String getHomeroompro() {
		return homeroompro;
	}
	public String getId() {
		return id;
	}
	public String getPart() {
		return part;
	}
	public String getClassname() {
		return classname;
	}
	public String getDate1() {
		return date1;
	}
	public String getSemester() {
		return semester;
	}
	public String getTopro() {
		return topro;
	}
	public int getTotal() {
		return total;
	}
	public int getNum1 () {
        return num1;
    }
	public int getNum2 () {
        return num2;
    }
	public int getNum3 () {
        return num3;
    }
	public int getNum4 () {
        return num4;
    }
	public int getNum5 () {
        return num5;
    }
	public int getNum6 () {
        return num6;
    }
	public int getNum7 () {
        return num7;
    }
	public int getNum8 () {
        return num8;
    }
	public int getNum9 () {
        return num9;
    }
	public int getNum10 () {
        return num10;
    }
	
}
