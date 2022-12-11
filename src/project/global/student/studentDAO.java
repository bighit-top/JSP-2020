package project.global.student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import project.global.student.stuLostDTO;
import project.global.student.infoDTO;
import project.global.student.modifyDTO;

public class studentDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private Connection getConnection() { // 1단계
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@nullmaster.iptime.org:1521:orcl";
			String user = "class09";
			String password = "class09";
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	

	// 개인정보 조회 (infoDTO / infoForm.jsp)
	public infoDTO printInfo(String stnum) {
		infoDTO dto = null;

		try {
			conn = getConnection();
			String sql = "select * from student where stnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, stnum);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new infoDTO();
				dto.setStname(rs.getString("stname"));
				dto.setYear1(rs.getInt("year1"));
				dto.setMon(rs.getInt("mon"));
				dto.setDay1(rs.getInt("day1"));
				dto.setStnum(rs.getString("stnum"));
				dto.setPart(rs.getString("part"));
				dto.setPhone(rs.getString("phone"));
				dto.setZon(rs.getString("zon"));
				dto.setStreet(rs.getString("street"));
				dto.setAddr(rs.getString("addr"));
				dto.setBank(rs.getString("bank"));
				dto.setAcnt(rs.getString("acnt"));
				dto.setGrade(rs.getInt("grade"));
				dto.setImage(rs.getString("image"));
				dto.setFloor(rs.getString("floor"));
				dto.setSex(rs.getString("sex"));
				dto.setPw(rs.getString("pw"));
				dto.setDomiuse(rs.getString("domiuse"));
				dto.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException s) {
				}
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException s) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException s) {
				}
		}

		return dto;
	}

	// 개인정보 수정 (modifyDTO / modifyForm.jsp)
	public modifyDTO printInfo2(String stnum) {
		modifyDTO dto = null;

		try {
			conn = getConnection();
			String sql = "select * from student where stnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, stnum);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new modifyDTO();
				dto.setStname(rs.getString("stname"));
				dto.setYear1(rs.getInt("year1"));
				dto.setMon(rs.getInt("mon"));
				dto.setDay1(rs.getInt("day1"));
				dto.setStnum(rs.getString("stnum"));
				dto.setPart(rs.getString("part"));
				dto.setPhone(rs.getString("phone"));
				dto.setZon(rs.getString("zon"));
				dto.setStreet(rs.getString("street"));
				dto.setAddr(rs.getString("addr"));
				dto.setBank(rs.getString("bank"));
				dto.setAcnt(rs.getString("acnt"));
				dto.setGrade(rs.getInt("grade"));
				dto.setImage(rs.getString("image"));
				dto.setFloor(rs.getString("floor"));
				dto.setSex(rs.getString("sex"));
				dto.setPw(rs.getString("pw"));
				dto.setDomiuse(rs.getString("domiuse"));
				dto.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException s) {
				}
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException s) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException s) {
				}
		}

		return dto;
	}

	// 학생정보 수정
	public String stuinfo_modify(modifyDTO dto) {
		String msg = "아지이이이익";
		try {
			conn = getConnection();

			String sql = "select * from student where stnum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getStnum());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				sql = "update student set image=?, stname=?, year1=?, mon = ?, "
						+ "day1 = ?, grade = ?, part = ?, zon = ?, street=?"
						+ ", addr=?, bank=?, acnt = ?, floor=?, acsday= sysdate,"
						+ "domiuse=?, pw = ?, phone=? where stnum=?";
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, dto.getImage());
				pstmt.setString(2, dto.getStname());
				pstmt.setInt(3, dto.getYear1());
				pstmt.setInt(4, dto.getMon());

				pstmt.setInt(5, dto.getDay1());
				pstmt.setInt(6, dto.getGrade());
				pstmt.setString(7, dto.getPart());
				pstmt.setString(8, dto.getZon());
				pstmt.setString(9, dto.getStreet());

				pstmt.setString(10, dto.getAddr());
				pstmt.setString(11, dto.getBank());
				pstmt.setString(12, dto.getAcnt());
				pstmt.setString(13, dto.getFloor());

				pstmt.setString(14, dto.getDomiuse());
				pstmt.setString(15, dto.getPw());
				pstmt.setString(16, dto.getPhone());
				pstmt.setString(17, dto.getStnum());

				pstmt.executeUpdate();
				msg = "수정성공*^^*!";
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException s) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException s) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException s) {
				}
		}
		return msg;
	}

	// 휴학 신청폼 (timeoffDTO / timeoffForm.jsp)
	public timeoffDTO printInfo3(String stnum) {
		timeoffDTO dto = null;

		try {
			conn = getConnection();
			String sql = "select * from student where stnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, stnum);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new timeoffDTO();
				dto.setName(rs.getString("stname"));
				dto.setStnum(rs.getString("stnum"));
				dto.setZon(rs.getString("zon"));
				dto.setStreet(rs.getString("street"));
				dto.setAddr(rs.getString("addr"));
				dto.setDay();
				dto.setYear();

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException s) {
				}
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException s) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException s) {
				}
		}

		return dto;
	}
	
	// 휴학신청 조회
	public List<timeoffDTO> timeofflookup(String stnum) {
		timeoffDTO dto = null;
		List<timeoffDTO> list = null;
		try {
			conn = getConnection();
			String sql = "select * from status where stnum=? order by day desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, stnum);
			rs = pstmt.executeQuery();
			list = new ArrayList<timeoffDTO>();
			while(rs.next()) {
				dto = new timeoffDTO();
				dto.setName(rs.getString("name"));
				dto.setDay(rs.getString("day"));
				dto.setCouse(rs.getString("couse"));
				dto.setYear(rs.getString("year"));
				dto.setSemester(rs.getString("semester"));
				dto.setApproval(rs.getInt("approval"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) try{ conn.close();} catch(SQLException s) { }
			if(rs != null) try{ rs.close();} catch(SQLException s) { }
			if(pstmt != null) try{ pstmt.close();} catch(SQLException s) { }
		}
		
		return list;
		
	}

	// 휴학 신청Pro (timeoffDTO / timeoffPro.jsp)
	public String timeoff(timeoffDTO dto) {
		String msg = "신청안됐다";

		try {
			msg = "진행중1";
			conn = getConnection();
			String sql = "Insert into status(name, couse, day, year, semester, stnum, zon, street, addr) values (?,?,?,?,?,?,?,?,?)";
			msg = "진행중2";
			pstmt = conn.prepareStatement(sql);
			msg = "진행중3";

			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getCouse());
			pstmt.setString(3, dto.getDay());
			pstmt.setString(4, dto.getYear());
			pstmt.setString(5, dto.getSemester());
			pstmt.setString(6, dto.getStnum());
			pstmt.setString(7, dto.getZon());
			pstmt.setString(8, dto.getStreet());
			pstmt.setString(9, dto.getAddr());
			pstmt.executeUpdate();
			msg = "신청됐움!ㅎㅎ";
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException s) {
				}
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException s) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException s) {
				}
		}

		return msg;
	}
	
	// 복학 신청폼 (timeonDTO / timeonForm.jsp)
	public timeonDTO printInfo4(String stnum) {
		timeonDTO dto = null;
		
		try {
			conn = getConnection();
			String sql = "select * from status where stnum=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, stnum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new timeonDTO();
				dto.setName(rs.getString("name"));
				dto.setStnum(rs.getString("stnum"));
				dto.setYear(rs.getString("year"));
				dto.setSemester(rs.getString("semester"));
				dto.setDay();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) try { conn.close(); } catch(SQLException s) { }
			if(rs != null) try { rs.close(); } catch(SQLException s) { }
			if(pstmt != null) try { pstmt.close(); } catch(SQLException s) { }
		}
		
		return dto;
		
	}
	
	// 복학신청 조회 list
	public List<timeonDTO> timeonlookup(String stnum){
		timeonDTO dto = null;
		List<timeonDTO> list = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from timeon where stnum=? order by day desc");
			pstmt.setString(1, stnum);
			rs = pstmt.executeQuery();
			list = new ArrayList<timeonDTO>();
			while(rs.next()) {
				dto = new timeonDTO();
				dto.setStnum(rs.getString("stnum"));
				dto.setName(rs.getString("name"));
				dto.setDay(rs.getString("day"));
				dto.setApproval(rs.getInt("approval"));
				list.add(dto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) try { conn.close(); } catch(SQLException s) { }
			if(rs != null) try { rs.close(); } catch(SQLException s) { }
			if(pstmt != null) try { rs.close(); } catch(SQLException s) { }
		}
		return list;
	}
	
	// 복학 신청Pro (timeonDTO / timeonPro.jsp)
	public String timeon(timeonDTO dto) {
		String msg = "아직!";
		
		try {
			conn = getConnection();
			String sql = "insert into timeon(name, day, stnum, year, semester) values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			msg = "아ㅏㅏ직!";
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getDay());
			pstmt.setString(3, dto.getStnum());
			pstmt.setString(4, dto.getYear());
			pstmt.setString(5, dto.getSemester());
			pstmt.executeUpdate();
			msg = "신청했움 승인 대기!";
		}catch(Exception e) {
			
		}finally {
			if(conn != null) try { conn.close(); } catch(SQLException s) { }
			if(rs != null) try { rs.close(); } catch(SQLException s) { }
			if(pstmt != null) try { pstmt.close(); } catch(SQLException s) { }
		}
		return msg;
	}
	
	// 
	public List<tableDTO> myList(String stnum, String date1, String semester){ //학번, 년도, 학기가 맞으면 강의 리스트를 불러옴
		List<tableDTO> list = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from signup where stnum=? and date1 =? and semester=?");//학번, 년도, 학기가 맞는가?
			pstmt.setString(1, stnum);
			pstmt.setString(2, date1);
			pstmt.setString(3, semester);
			rs = pstmt.executeQuery();
			list = new ArrayList<tableDTO>();
			while(rs.next()) {
				tableDTO mylistdto = new tableDTO();
				mylistdto.setClassname(rs.getString("classname")); //강의명
				mylistdto.setHomeroompro(rs.getString("homeroompro")); //담당교수
				mylistdto.setScore(rs.getInt("score"));//학점
				mylistdto.setClassroom(rs.getString("classroom")); //강의실
				mylistdto.setClasstime(rs.getString("classtime")); //강의시간
				mylistdto.setDate1(rs.getString("date1")); //년도
				mylistdto.setSemester(rs.getString("semester")); //학기
				mylistdto.setBuilding(rs.getString("building")); //건물명
				mylistdto.setDay(rs.getString("day"));//요일

				list.add(mylistdto);
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException s) {}
			if(rs != null) try {rs.close();} catch(SQLException s) {}
			if(rs != null) try {rs.close();} catch(SQLException s) {}
		}
		return list;
	}
	
	public gradeDTO studentInfo(String stnum) { //성적조회의 학생 정보조회
		gradeDTO stuinfo = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from results where stnum=?"); //학번조건 넣기
			pstmt.setString(1, stnum); //학번 pro 통해서 넘겨 받아야 할듯
			rs = pstmt.executeQuery();
			stuinfo = new gradeDTO();
			if(rs.next()) {
				stuinfo.setStnum(rs.getString("stnum"));
				stuinfo.setStname(rs.getString("name"));
				stuinfo.setRecord(rs.getInt("record"));
				stuinfo.setClassname(rs.getString("classname"));
				stuinfo.setGrade(rs.getString("grade"));
				stuinfo.setScore(rs.getInt("score"));
				stuinfo.setPart(rs.getString("part"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException s) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
			if(conn != null) try {conn.close();} catch(SQLException s) {}
		}
		return stuinfo;
	}	
	
	
	public List<gradeDTO> resultChecking(String stnum){ //성적 리스트
		List<gradeDTO> list = null;		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from (select stnum, name, lecturecode, "
					+ "classname, record, grade, score, part from(select * from results "
					+ "order by grade desc, classname asc)order by grade desc, classname asc)"
					+ " where stnum=?"); //
			pstmt.setString(1, stnum);
			rs = pstmt.executeQuery();
			list = new ArrayList<gradeDTO>();
			while(rs.next()) {
				gradeDTO dto = new gradeDTO();
				dto.setStnum(rs.getString("stnum"));
				dto.setStname(rs.getString("name"));
				dto.setLecturecode(rs.getString("lecturecode"));
				dto.setClassname(rs.getString("classname"));
				dto.setRecord(rs.getInt("record"));
				dto.setGrade(rs.getString("grade"));
				dto.setScore(rs.getInt("score"));
				list.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException s) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
			if(conn != null) try {conn.close();} catch(SQLException s) {}
		}		
		return list;		
	}	
	public List<gradeDTO> gradeSelect(String grade, String stnum){
		List<gradeDTO> select = null;
		try {
			conn = getConnection();
			if(grade.equals("1학년") || grade.equals("2학년") || grade.equals("3학년") || grade.equals("4학년") ) {
				pstmt = conn.prepareStatement("select * from results where grade = ? and stnum = ?");
				pstmt.setString(1, grade);
				pstmt.setString(2, stnum);
				rs = pstmt.executeQuery();
				select = new ArrayList<gradeDTO>();
				while(rs.next()) {
					gradeDTO selectlist = new gradeDTO();
					selectlist.setStnum(rs.getString("stnum"));
					selectlist.setStname(rs.getString("name"));
					selectlist.setLecturecode(rs.getString("lecturecode"));
					selectlist.setClassname(rs.getString("classname"));
					selectlist.setRecord(rs.getInt("record"));
					selectlist.setGrade(rs.getString("grade"));
					selectlist.setScore(rs.getInt("score"));
					select.add(selectlist);
				}
			}else if(grade.equals("전부")) {
				pstmt = conn.prepareStatement("select * from results where stnum = ? order by grade desc");
				pstmt.setString(1, stnum);
				rs = pstmt.executeQuery();
				select = new ArrayList<gradeDTO>();
				while(rs.next()) {
					gradeDTO selectlist = new gradeDTO();
					selectlist.setStnum(rs.getString("stnum"));
					selectlist.setStname(rs.getString("name"));
					selectlist.setLecturecode(rs.getString("lecturecode"));
					selectlist.setClassname(rs.getString("classname"));
					selectlist.setRecord(rs.getInt("record"));
					selectlist.setGrade(rs.getString("grade"));
					selectlist.setScore(rs.getInt("score"));
					select.add(selectlist);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException s) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
			if(conn != null) try {conn.close();} catch(SQLException s) {}
		}		
		return select;
	}

	//석주 다오
		public  sleepoutAppDTO2 sleepoutApp(String stnum){ //학생정보를 고정값으로  셀렉트하는내용
			sleepoutAppDTO2 dto = null;
			String dbstnum="";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement("select * from student where stnum= ? ");
				pstmt.setString(1, stnum);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					dto = new sleepoutAppDTO2();
					dbstnum = rs.getString("stnum");
					if(dbstnum.equals(stnum)) {
						dto.setStname(rs.getString("stname"));
						dto.setStnum(rs.getString("stnum"));
						dto.setPart(rs.getString("part"));

					}
					
				}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException s) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException s) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException s) {
				}
		}
		 	return dto;

		}

		public void sleepoutAppinsert(sleepoutAppDTO dto) {
			try {
				conn = getConnection();
				String sql = "insert into sexnight(no,stnum,outsleep,startday,comeback,secret,name,dreamroom,ho,part,reg_date)"
						+ " values(sn_seq.nextval,?,?,?,?,?,?,?,?,?,?)";// 사용자가 입력하는 외박내용을 insert하는 쿼리문
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getStnum());
				pstmt.setString(2, dto.getOutsleep());
				pstmt.setString(3, dto.getStartday());
				pstmt.setString(4, dto.getComeback());
				pstmt.setString(5, dto.getSecret());
				pstmt.setString(6, dto.getName());
				pstmt.setString(7, dto.getDreamroom());
				pstmt.setString(8, dto.getHo());
				pstmt.setString(9, dto.getPart());
				pstmt.setTimestamp(10, dto.getSend());
				pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException s) {
					}
				if (conn != null)
					try {
						conn.close();
					} catch (SQLException s) {
					}
			}
		}
	public  inDTO2 extraadd(String stnum){ //학생정보를 고정값으로  셀렉트하는내용
		inDTO2 dto = null;
		String dbstnum="";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from student where stnum= ? ");
			pstmt.setString(1, stnum);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new inDTO2();
				dbstnum = rs.getString("stnum");
				if(dbstnum.equals(stnum)) {
					dto.setStname(rs.getString("stname"));
					dto.setStnum(rs.getString("stnum"));
					dto.setGrade(rs.getString("grade"));
					dto.setPart(rs.getString("part"));
					dto.setZon(rs.getString("zon"));
					dto.setStreet(rs.getString("street"));
					dto.setAddr(rs.getString("addr"));
					dto.setSex(rs.getString("sex"));
					dto.setPhone(rs.getString("phone"));
		
				}
				
			}
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException s) {
			}
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException s) {
			}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException s) {
			}
	}
	 	return dto;

	}

		public void ininsert(inDTO dto) {//셀렉트 내용과 함께 인서트한다
			try {
				conn = getConnection();
				String sql = "insert into enter(no,stnum,gender,dreamroom,phone,post,street,addr,name,part,grade,email) "
						+ "values(enter_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";
				System.out.println(dto.getGender());
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getStnum());
				pstmt.setString(2, dto.getGender());
				pstmt.setString(3, dto.getDreamroom());
				pstmt.setString(4, dto.getPhone());
				pstmt.setString(5, dto.getPost());
				pstmt.setString(6, dto.getStreet());
				pstmt.setString(7, dto.getAddr());
				pstmt.setString(8, dto.getName());
				pstmt.setString(9, dto.getPart());
				pstmt.setString(10, dto.getGrade());
				pstmt.setString(11, dto.getEmail());
				pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException s) {
					}
				if (conn != null)
					try {
						pstmt.close();
					} catch (SQLException s) {

					}
			}
		}
		public  outDTO2 extraadd2(String stnum){ //학생정보를 고정값으로  셀렉트하는내용
			outDTO2 dto = null;
			String dbstnum="";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement("select * from student where stnum= ? ");
				pstmt.setString(1, stnum);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					dto = new outDTO2();
					dbstnum = rs.getString("stnum");
					if(dbstnum.equals(stnum)) {
						dto.setStname(rs.getString("stname"));
						dto.setStnum(rs.getString("stnum"));
						dto.setGrade(rs.getString("grade"));
						dto.setPart(rs.getString("part"));
						dto.setZon(rs.getString("zon"));
						dto.setStreet(rs.getString("street"));
						dto.setAddr(rs.getString("addr"));
						dto.setSex(rs.getString("sex"));
						dto.setPhone(rs.getString("phone"));
			
					}
					
				}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException s) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException s) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException s) {
				}
		}
		 	return dto;

		}


		public void outinsert(outDTO dto) {//셀렉트 내용과 함께 인서트한다
			try {
				conn = getConnection();
				String sql = "insert into leaving (no,stnum,gender,dormitory,phone,acount,reason,dday,bankname,part,depositer,ho,name,semester,"
						+ "grade,outdate,other,post,street,addr,email)"
						+ "values(leaving_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getStnum());
				pstmt.setString(2, dto.getGender());
				pstmt.setString(3, dto.getDormitory());
				pstmt.setString(4, dto.getPhone());
				pstmt.setString(5, dto.getAcount());
				pstmt.setString(6, dto.getReason());
				pstmt.setString(7, dto.getDday());
				pstmt.setString(8, dto.getBankname());
				pstmt.setString(9, dto.getPart());
				pstmt.setString(10, dto.getDepositer());
				pstmt.setString(11, dto.getHo());
				pstmt.setString(12, dto.getName());
				pstmt.setString(13, dto.getSemester());
				pstmt.setString(14, dto.getGrade());
				pstmt.setString(15, dto.getOutdate());
				pstmt.setString(16, dto.getOther());
				pstmt.setString(17, dto.getPost());
				pstmt.setString(18, dto.getStreet());
				pstmt.setString(19, dto.getAddr());
				pstmt.setString(20, dto.getEmail());

				pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException s) {
					}
				if (conn != null)
					try {
						pstmt.close();
					} catch (SQLException s) {
								
					}
			}
		}

		public List<passDTO> list(String stnum) {       //합격자조회  승인값은 1
			List<passDTO> list = null;
			int dbok = 0;
			//String dbstnum="";
			try {
				conn = getConnection();
				
				pstmt = conn.prepareStatement("select * from enter where stnum=?");
				pstmt.setString(1, stnum);
				rs = pstmt.executeQuery();
				list = new ArrayList<passDTO>();
				while (rs.next()) {
					dbok= rs.getInt("ok");
					if(dbok > 0) {
						passDTO dto = new passDTO();
						dto.setStnum(rs.getString("Stnum"));
						dto.setGender(rs.getString("gender"));
						dto.setDreamroom(rs.getString("dreamroom"));
						dto.setPhone(rs.getString("phone"));
						dto.setName(rs.getString("name"));
						dto.setPart(rs.getString("part"));
						dto.setHo(rs.getString("ho"));
						list.add(dto);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null)
					try {
						rs.close();
					} catch (SQLException s) {
					}
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException s) {
					}
				if (conn != null)
					try {
						conn.close();
					} catch (SQLException s) {
					}
			}
			return list;
		}

	public List<sleepoutcheckDTO> sleepoutlist(String stnum){ //외박승인조회 메서드
		List<sleepoutcheckDTO> list = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from sexnight where stnum=?");
			pstmt.setString(1, stnum);

			rs = pstmt.executeQuery();
			list = new ArrayList<sleepoutcheckDTO>();
			while (rs.next()) {

					sleepoutcheckDTO dto = new sleepoutcheckDTO();
					dto.setStnum(rs.getString("stnum"));
					dto.setName(rs.getString("name"));
					dto.setPart(rs.getString("part"));
					dto.setStartday(rs.getString("startday"));
					dto.setAllow(rs.getInt("allow"));
					list.add(dto);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException s) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException s) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException s) {
				}
		}
		return list;
	}
	//학생 분실물 내용 인서트
	public void insertArticle1(stuLostDTO article) throws Exception {
		int num=article.getNum(); //공지사항의 내용들을 인서트하는 내용
	
		int number=0;
		String sql="";
		try {
			conn = getConnection(); 
			pstmt = conn.prepareStatement("select max(num) from adminlost");//num으로 설정한 시퀀스중 제일 큰 숫자를 셀렉트
			rs = pstmt.executeQuery();
			if (rs.next()) 
				number=rs.getInt(1)+1;//시퀀스가 1이라면 1+1해서 2로 밑에있는 내용들을 DB에 인서트한다	
			else
				number=1; //만약 위에 값에서 1이 나온다면(게시물에 아무것도 없다면) 넘버 1로 밑에 있는 내용들을 DB에 인서트한다

 
			sql = "insert into adminlost(num,writer,subject,reg_date,";
			sql+="content) values(adminlost_seq.NEXTVAL,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getSubject());
			pstmt.setTimestamp(3, article.getReg_date());
			pstmt.setString(4, article.getContent());
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	public int getArticleCount1() throws Exception {//해당 테이블 게시물의 수를 나타내는 메서드
		int x=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from adminlost");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x= rs.getInt(1); //카운터에 나타내는건 인트타입이기에 갯인트로받는다
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x; //그 카운터를 출력
	}
	public int getArticleCount1(String writer) throws Exception {//왜  writer로 메서드 만든지 모르겠음 
		int x=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from adminlost where writer=?");//작성자의 게시물 갯수를 나타내라
			pstmt.setString(1, writer);//
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x= rs.getInt(1); 
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x; //그 카운터를 출력
	}
	
	public List getArticles1(int start, int end) throws Exception {
		List articleList=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from (select num,writer,subject,reg_date,content,readcount,rownum r from "
					+ "(select *  from adminlost order by num desc) order by num desc ) where r >= ? and r <= ? ");
					pstmt.setInt(1, start); //adminlist에 
					pstmt.setInt(2, end); 

					rs = pstmt.executeQuery();
					if (rs.next()) {
						articleList = new ArrayList(end); 
						do{ 
							stuLostDTO article= new stuLostDTO();
							article.setNum(rs.getInt("num"));
							article.setWriter(rs.getString("writer"));
							article.setSubject(rs.getString("subject"));
							article.setReg_date(rs.getTimestamp("reg_date"));
							article.setReadcount(rs.getInt("readcount"));
							article.setContent(rs.getString("content"));
							articleList.add(article); 
						}while(rs.next());
					}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}

		
		return articleList;
	}
	public stuLostDTO getArticle1(int num) throws Exception {
		stuLostDTO article=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
			"update adminlost set readcount=readcount+1 where num = ?");//조회수를 업데이트하는 메서드
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement(
			"select * from adminlost where num = ?"); //시퀀스 Num을 셀렉트하기
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new stuLostDTO();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setSubject(rs.getString("subject"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setContent(rs.getString("content"));
				
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return article;
	}
	public String testDelete1(int num) {//삭제
		String msg="삭제하시겠습니까?";
		try {
			conn = getConnection();	
			String sql = "delete from adminlost where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();
			msg= "삭제되었습니다.";

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();}catch(SQLException s) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException s) {}
			if(conn != null)try {conn.close();}catch(SQLException s) {}
		}
		return msg;
	}
	public stuLostDTO updateGetArticle1(int num) throws Exception {//수정 시 기본내용 셀렉트해서 내용 갖고오기
		stuLostDTO article=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
			"select * from adminlost where num = ?"); 
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new stuLostDTO();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setSubject(rs.getString("subject"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setContent(rs.getString("content"));

			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}

		return article;
	}
	public int updateArticle1(stuLostDTO article) throws Exception {// 수정 시 업데이트
		String writer="";
		String sql="";
		int x=-1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
			"select * from adminlost where num = ?");
			pstmt.setInt(1, article.getNum());
			rs = pstmt.executeQuery();
			if(rs.next()){
				writer= rs.getString("writer"); 
				if(writer.equals(article.getWriter())){
					sql="update adminlost set writer=?,subject=?";
					sql+=",content=? where num=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, article.getWriter());
					pstmt.setString(2, article.getSubject());
					pstmt.setString(3, article.getContent());
					pstmt.setInt(4, article.getNum());
					pstmt.executeUpdate();
					x= 1;
				}else{
					x= 0;
				}
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x;
	}
}





























