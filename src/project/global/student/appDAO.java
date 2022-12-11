package project.global.student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class appDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private Connection getConnection() throws Exception {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@nullmaster.iptime.org:1521:orcl";
			String user = "class09", pass = "class09";
			conn = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public List<appDTO> appChecking(int num) { // 교수의 강의 테이블에서 강의리스트 가져오기
		List<appDTO> applist = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from class1 where allow= ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			applist = new ArrayList<appDTO>();

			while (rs.next()) {
				appDTO listdto = new appDTO();
				listdto.setBuilding(rs.getString("building")); // 건물명
				listdto.setRoomnum(rs.getString("roomnum")); // 강의실
				listdto.setDay(rs.getString("day")); // 요일
				listdto.setTime(rs.getInt("time"));// 강의시간
				listdto.setCan(rs.getString("can")); // 인원
				listdto.setClassnum(rs.getString("classnum")); // 강의코드
				listdto.setClassname(rs.getString("classname")); // 강의명
				listdto.setHomeroompro(rs.getString("homeroompro")); // 담당교수
				listdto.setPart(rs.getString("part")); // 학과
				listdto.setWho(rs.getString("who"));// 인원
				listdto.setDate1(rs.getString("date1")); // 년도
				listdto.setSemester(rs.getString("semester")); // 학기
				listdto.setScore(rs.getInt("score")); // 학점
				applist.add(listdto);
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
		return applist;
	}

	// 수강신청 테이블에 값 저장하기
	public void appInsert(appDTO apply, String stnum, String stname, String grade) {
		try {
			conn = getConnection();
			String sql = "insert into signup(part, classname, homeroompro, score, classroom,classtime,date1,semester,"
					+ "stnum,stname,building,day,classnum,grade) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, apply.getPart()); // 학과
			pstmt.setString(2, apply.getClassname()); // 강의명
			pstmt.setString(3, apply.getHomeroompro()); // 교수명
			pstmt.setInt(4, apply.getScore()); // 학점
			pstmt.setString(5, apply.getRoomnum()); // 강의실
			pstmt.setInt(6, apply.getTime()); // 교시
			pstmt.setString(7, apply.getDate1()); // 년도
			pstmt.setString(8, apply.getSemester()); // 학기
			pstmt.setString(9, stnum); // 학번
			pstmt.setString(10, stname); // 이름
			pstmt.setString(11, apply.getBuilding()); // 건물명
			pstmt.setString(12, apply.getDay()); // 요일
			pstmt.setString(13, apply.getClassnum()); // 강의코드
			pstmt.setString(14, grade);// 학년
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

	public appDTO studentInfo(String stnum) { // 수강신청에서 학생 정보 조회
		appDTO stuinfo = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from student where stnum=?"); // 학번조건 넣기
			pstmt.setString(1, stnum);
			rs = pstmt.executeQuery();
			stuinfo = new appDTO();
			if (rs.next()) {
				stuinfo.setStnum(rs.getString("stnum")); // 학번
				stuinfo.setStname(rs.getString("stname")); // 이름
				stuinfo.setGrade(rs.getInt("grade") + ""); // 학년
				stuinfo.setPart(rs.getString("part")); //학과
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
		return stuinfo;
	}

	 //선택한 강의의 정보를 가져옴
	public appDTO selectLecture(String classnum) { 
		appDTO select = null; 
		try { 
			conn = getConnection(); 
			pstmt = conn.prepareStatement("select * from class1 where classnum=? and allow=1");
			pstmt.setString(1, classnum); 
			rs = pstmt.executeQuery(); 
			select = new appDTO(); 
			if(rs.next()) { 
				select.setPart(rs.getString("part")); //학과
				select.setClassname(rs.getString("classname")); //강의명
				select.setHomeroompro(rs.getString("homeroompro")); //교수명
				select.setScore(rs.getInt("score")); //학번
				select.setRoomnum(rs.getString("roomnum")); //강의실
				select.setTime(rs.getInt("time")); //시간
				select.setDate1(rs.getString("date1")); //년도
				select.setSemester(rs.getString("semester")); //학기
				select.setBuilding(rs.getString("building")); //건물
				select.setDay(rs.getString("day")); //요일
				select.setClassnum(rs.getString("classnum")); //강의코드 
				select.setCan(rs.getInt("can")+"");//정원
			}

		}catch(Exception e) { 
			e.printStackTrace(); 
		}finally { 
			if(rs != null) try {rs.close();} catch(SQLException s) {} 
			if(pstmt != null) try {pstmt.close();} catch(SQLException s) {} 
			if(conn != null) try {conn.close();} catch(SQLException s) {} } return select; 
		}

	// 수강신청시 정원과 이미 수강한 과목 여부 체크 - signup에서 강의코드(classnum)로 카운트하여 class1의 인원(can)과
	// 비교해 제약을 둠
	// 강의의 대상과와 학생의 과가 다를 경우 신청할 수 없도록 제약을 둠
	public int canCheck(String stnum, String classnum) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		appDTO stu = studentInfo(stnum); //학생의 정보를 가져옴
		appDTO lec = selectLecture(classnum); //선택한 강의의 정보를 가져옴

		String sql = "";
		int countclass = 0; // 수강신청한 갯수를 담을 변수
		int can = Integer.parseInt(lec.getCan()); // 수강 정원
		int check = -1; // 반환해줄 변수
		String stpart = stu.getPart(); // 학생의 학과
		String lecpart = lec.getPart(); //선택한 강의의 학과
		String status = ""; // 학생의 학적상태를 담을 변수

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from signup where classnum=?");// 강의코드당 수강신청한 갯수를 셈
			pstmt.setString(1, classnum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				countclass = rs.getInt(1); // 수강신청 갯수를 담음
			}
			//정원을 넘으면 신청할 수 없음
			if(can < countclass) {
				check = 1;
			}
			// 수강신청테이블에서 학번과 강의코드로 이미 신청한 과목인지 체크함
			sql = "select * from signup where classnum=? and stnum=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, classnum); // 강의코드
			pstmt.setString(2, stnum); // 학번
			rs = pstmt.executeQuery();
			if (rs.next()) {
				check = 2; // 있을 경우 중복신청으로 수강신청 거부
			}
			//다른과 강의는 신청할 수 없음.
			if(!stpart.equals(lecpart)) {
				check = 3;
			}
			// 학생의 학적상태가 재학일 경우에만 수강신청이 가능함.
			sql = "select * from student where stnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, stnum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				status = rs.getString("floor");
				if(!status.equals("재학")||!status.equals("편입")) {
					check = 4;
				}
			}
			// 이미 강의가 있는 시간에는 수강신청 할 수 없음.
			// 수강신청 테이블에서 학번,년도,학기를 조건으로 강의코드를 조회하고, 강의코드 끝 두자리가 같은 경우 같은 시간이므로 신청할 수 없음.	
			sql = "select * from signup where stnum=? and date1=? and semester=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, stnum);
			pstmt.setString(2, lec.getDate1());
			pstmt.setString(3, lec.getSemester());
			rs = pstmt.executeQuery();
 
			if (rs.next()) {
				String num = classnum; // 받아온 강의코드
				String numresult = num.substring(num.length() -2, num.length());
				String code = rs.getString("classnum");
				String coderesult = code.substring(code.length() -2, code.length());
				if (numresult.equals(coderesult)) { // 강의코드의 끝자리가 같다면 신청시간이 같으므로 신청할 수 없음.
					check = 5;
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
		return check;
	}
}