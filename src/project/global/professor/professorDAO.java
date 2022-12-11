package project.global.professor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class professorDAO {
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement pstmt;
	
	private Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url="jdbc:oracle:thin:@nullmaster.iptime.org:1521:orcl";
			String user = "class09";
			String password = "class09";
			conn = DriverManager.getConnection(url,user,password);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public List<prochangepartDTO> changepartList(String id){
		List<prochangepartDTO> list = null;
		String propart = null;
		try {
			conn = getConnection();
			String sql = "select * from professor where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				propart = rs.getString("propart");
				System.out.println(propart);
			}
			
			sql = "select * from subjectchange where afname=? and proapp=0";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, propart);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<prochangepartDTO>();
			while(rs.next()) {
				prochangepartDTO dto = new prochangepartDTO();
				dto.setStnum(rs.getString("stnum"));
				dto.setStname(rs.getString("stname"));
				dto.setStphone(rs.getString("stphone"));
				dto.setStemail(rs.getString("stemail"));
				dto.setBfname(rs.getString("bfname"));
				dto.setAfname(rs.getString("afname"));
				dto.setAppdate(rs.getString("appdate"));
				dto.setProapp(rs.getInt("proapp"));
				dto.setAdapp(rs.getInt("adapp"));
				dto.setFinalapp(rs.getInt("finalapp"));
				list.add(dto);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) try { conn.close(); } catch(SQLException s) { }
			if(rs != null) try { rs.close(); } catch(SQLException s) { }
			if(pstmt != null) try {  pstmt.close(); } catch(SQLException s) { }
		}
		
		
		return list;
	}
	
	public String updateApp(String stnum, int data) {
		String msg = "업뎃ㄱㄱ";
		
		try {
			conn = getConnection();
			if(data == 1) {
				String sql = "update subjectchange set proapp=? where stnum=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, data);
				pstmt.setString(2, stnum);
				pstmt.executeUpdate();
				msg = "승인 되었당!";
			}else if(data == 2) {
				String sql = "update subjectchange set finalapp=?, proapp=? where stnum=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, data);
				pstmt.setInt(2,data);
				pstmt.setString(3,stnum);
				pstmt.executeUpdate();
				msg = "거절되었당";
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) try { conn.close(); } catch(SQLException s) { }
			if(rs != null) try { rs.close(); } catch(SQLException s) { }
			if(pstmt != null) try { pstmt.close(); } catch(SQLException s) { }
			
		}
				
		return msg;
	}
	// pro modifyForm.jsp  교수 개인정보 불러오기
			public promodifyDTO proLookup(String id) {
				promodifyDTO dto = null;
				try {
					conn = getConnection();
					pstmt = conn.prepareStatement("select * from professor where id =?");
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						dto = new promodifyDTO();
						dto.setProname(rs.getString("proname"));
						dto.setProborn(rs.getString("proborn"));
						dto.setPropart(rs.getString("propart"));
						dto.setTel1(rs.getString("tel1"));
						dto.setProemail(rs.getString("proemail"));
						dto.setZone(rs.getString("zone"));
						dto.setStreet(rs.getString("street"));
						dto.setAddr(rs.getString("addr"));
						dto.setAcount(rs.getString("acount"));
						dto.setPw(rs.getString("pw"));
						dto.setId(rs.getString("id"));
						dto.setBank(rs.getString("bank"));
						dto.setImage(rs.getString("image"));
						dto.setPropartcode(rs.getString("propartcode"));
					}
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					if(conn != null) try { conn.close(); } catch(SQLException s) { }
					if(pstmt != null) try { pstmt.close(); } catch(SQLException s) { }
					if(rs != null) try { rs.close(); } catch(SQLException s) { }
				}
				return dto;
			}
	// 교수 정보 수정
	public void proModify(promodifyDTO dto) {		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update professor set proname=?, proborn=?, propart=?,"
					+ "tel1=?, proemail=?, zone=?, street=?, addr=?, acount=?, pw=?, bank=?, image=? where id=?");
			
			pstmt.setString(1, dto.getProname());
			pstmt.setString(2, dto.getProborn());
			pstmt.setString(3, dto.getPropart());
			
			pstmt.setString(4, dto.getTel1());
			pstmt.setString(5, dto.getProemail());
			pstmt.setString(6, dto.getZone());
			
			pstmt.setString(7, dto.getStreet());
			pstmt.setString(8, dto.getAddr());
			pstmt.setString(9, dto.getAcount());
			
			pstmt.setString(10, dto.getPw());
			pstmt.setString(11, dto.getBank());
			pstmt.setString(12, dto.getImage());
			pstmt.setString(13, dto.getId());
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("update global set pw=? where id=? and what=?");
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, "2");
			pstmt.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) try { conn.close(); } catch(SQLException s) { }
			if(pstmt != null) try { pstmt.close(); } catch(SQLException s) { }
			if(rs != null ) try { rs.close(); } catch(SQLException s) { }
		}
	}
	
	// 석주 다오

	//전체 강의 리스트 / SuccLecturListForm    //보류  -소미-
	public List<SuccLectureDTO> SuccLecture(String id) {       
		List<SuccLectureDTO> SuccLecture = null;
		int dballow = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from class1 where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			SuccLecture = new ArrayList<SuccLectureDTO>();
			while (rs.next()) {
				dballow = rs.getInt("allow");
				SuccLectureDTO dto = new SuccLectureDTO();
				if(dballow == 1) {
					dto.setRoomnum(rs.getString("roomnum"));
					dto.setTime(rs.getString("time"));
					dto.setClassnum(rs.getString("classnum"));
					dto.setClassname(rs.getString("classname"));
					dto.setDate1(rs.getString("date1"));
					dto.setSemester(rs.getString("semester"));
					dto.setScore(rs.getString("score"));
					dto.setHomeroompro(rs.getString("homeroompro"));
					dto.setId(rs.getString("id"));					
					
					SuccLecture.add(dto);
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
		return SuccLecture;
	}
	// SuccLectureListForm.jsp에서 강의계획서 열람 버튼 클릭 시 planForm.jsp 페이지로 이동  / 열람
	
	
	
	// SuccLectureListForm.jsp에서 강의계획서 수정 버튼 클릭 시 updatePlanForm.jsp 페이지로 이동 /수정
	public updatePlanDTO updateGetPlan(String classnum) { 
		updatePlanDTO dto = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from class1 where classnum=?");
			pstmt.setString(1, classnum);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				dto = new updatePlanDTO();
				dto.setBuilding(rs.getString("building"));
				dto.setRoomnum(rs.getString("roomnum"));//강의실호수
				dto.setDay(rs.getString("day")); //요일
				dto.setTime(rs.getInt("time")); //교시
				dto.setCan(rs.getString("can")); //인원
				dto.setProemail(rs.getString("proemail")); //교수이메일
				dto.setClassnum(rs.getString("classnum")); //강의코드
				dto.setClassname(rs.getString("classname")); //교과목명
				dto.setHomeroompro(rs.getString("homeroompro")); //교수명
				dto.setPart(rs.getString("part")); //학과
				dto.setWho(rs.getString("who")); //수강대상
				dto.setDate1(rs.getString("date1"));//개설년도
				dto.setSemester(rs.getString("semester"));//학기
				dto.setScore(rs.getInt("score"));//학점
				dto.setGoal(rs.getString("goal"));//강의목표
				
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

	public int updatePlan(updatePlanDTO dto) {
		int x=-1;
		String sql="";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from class1 where classnum=?");
			pstmt.setString(1, dto.getClassnum());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				sql = "update class1 set classname=?, building=?,homerommpro=?,part=?,roomnum=?,who=?,date1=? ";
				sql+=",semester=?,day=?, time=?, score=?,proemail=?, goal=? where classnum=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getClassname());
				pstmt.setString(2, dto.getBuilding());
				pstmt.setString(3, dto.getHomeroompro());
				pstmt.setString(4, dto.getPart());
				pstmt.setString(5, dto.getRoomnum());
				pstmt.setString(6, dto.getWho());
				pstmt.setString(7, dto.getDate1());
				pstmt.setString(8, dto.getSemester());
				pstmt.setString(9, dto.getDay());
				pstmt.setInt(10, dto.getTime());
				pstmt.setInt(11, dto.getScore());
				pstmt.setString(12, dto.getProemail());
				pstmt.setString(13, dto.getGoal());
				pstmt.setString(14, dto.getClassnum());
				pstmt.executeUpdate();
				x=1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x;
	}
	
	public List<professorDTO> plan(String classnum) {      //수강계획서 셀렉트
		List<professorDTO> plan = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from class1 where classnum=?");
			pstmt.setString(1,classnum);
			rs = pstmt.executeQuery();
		

			plan = new ArrayList<professorDTO>();
			while (rs.next()) {
				professorDTO dto = new professorDTO();
				dto.setRoomnum(rs.getString("roomnum"));
				dto.setDay(rs.getString("day"));
				dto.setTime(rs.getString("time"));
				dto.setClassnum(rs.getString("classnum"));
				plan.add(dto);
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
		return plan;
	}
	
	
}
