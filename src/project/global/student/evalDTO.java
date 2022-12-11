package project.global.student;

public class evalDTO { //강의평가
	private String subject; //학과
	private String date1; //년도
	private String semester; //학기
	private int lecturecode; //강의코드
	private String classname; //강의명
	private String proname; //교수명
	
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
	private String topro;
	private int total; //평가 총점
	private String stnum; //학번
	
	
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setDate1 (String date1) {
        this.date1 = date1;
    }
	public void setSemester (String semester) {
        this.semester = semester;
    }
	public void setLecturecode (int lecturecode) {
        this.lecturecode = lecturecode;
    }
	public void setClassname (String classname) {
        this.classname = classname;
    }
	public void setProname (String proname) {
        this.proname = proname;
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
	public void setTopro(String topro) {
		this.topro = topro;
	}
	public void setTotal (int total) {
        this.total = total;
    }
	public void setStnum(String stnum) {
		this.stnum = stnum;
	}
	
	
	public String getSubject() {
		return subject;
	}
	public String getDate1 () {
        return date1;
    }
	public String getSemester () {
        return semester;
    }
	public int getLecturecode () {
        return lecturecode;
    }
	public String getClassname () {
        return classname;
    }
	public String getProname () {
        return proname;
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
	public String getTopro() {
		return topro;
	}
	public int getTotal () {
        return total;
    }	
	public String getStnum() {
		return stnum;
	}
}
