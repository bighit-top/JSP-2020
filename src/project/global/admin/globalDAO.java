package project.global.admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class globalDAO {
	private static globalDAO instance = new globalDAO();

	public static globalDAO getInstance() {
		return instance;
	}

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private Connection getConnection() { 
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
	//what-레벨 : 학생 1, 교수 2, 관리자 3 으로 설정하여 로그인
	public int globalCheck(String id, String pw)
			throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpw = ""; //로그인 비밀번호 초기화
		String dbwhat = ""; //로그인 신분 초기화
		int x = 0;

		try {
			conn = getConnection();
			//로그인 시 student 테이블 시간 업데이트
			pstmt = conn.prepareStatement("update student set acsday=sysdate where stnum=? and pw=?");
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.executeUpdate();
			//학번과 비밀번호 일치한 경우만 로그인
			pstmt = conn.prepareStatement("select * from global where id = ? and pw=?");
			pstmt.setString(1, id);
			pstmt.setString(2, pw);

			rs = pstmt.executeQuery();
			//일치한 학번, 비밀번호가 있는 튜플있을 때
			if (rs.next()) {
				//global 테이블의 what 컬럼값을 변수 dbwhat에 대입
				dbwhat = rs.getString("what");
				if (dbwhat.equals("1")) { //학생(1)
					x = 1; 
				} else if (dbwhat.equals("2")) { //교수(2)
					x = 2;
				} else {
					x = 3; //관리자(3)
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally { 
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x; //신분 구분값 리턴
	}
	

	//비밀번호 찾기 
	public void getPw(pwDTO dto) {
		//String sql="";
		try {
			conn = getConnection();
			//student 테이블에서 이름, 학번, 학과, 이메일 일치 확인
			pstmt = conn.prepareStatement("select * from student where stname=? and stnum=? and part=? and email=?");
			pstmt.setString(1, dto.getStname());
			pstmt.setString(2, dto.getStnum());
			pstmt.setString(3, dto.getPart());
			pstmt.setString(5, dto.getEmail());
			rs = pstmt.executeQuery();
			//일치한 값이 있다면 pwDTO에 저장
			if(rs.next()) {
				dto.setStname(rs.getString("stname"));
				dto.setStnum(rs.getString("stnum"));
				dto.setPart(rs.getString("part"));
				dto.setPw(rs.getString("pw"));
				dto.setEmail(rs.getString("email"));
			}		
		
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	//이메일로 임시 비밀번호 전송 시 임시 비밀번호로 업데이트
	public void updatePw(String pw, String id) {
		try {
			conn = getConnection();
			//임시 비밀번호 받은 학생의 student 테이블의 비밀번호 업데이트
			pstmt = conn.prepareStatement("update student set pw=? where stnum=?");
			pstmt.setString(1, pw);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			
			System.out.println(pw);
			System.out.println(id);
			//로그인에 대한 global 테이블 비밀번호 업데이트
			pstmt = conn.prepareStatement("update global set pw=? where id=?");
			pstmt.setString(1, pw);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	//교수  비밀번호 찾기 
	public void getProPw(pwProDTO dto) {
		try {
			conn = getConnection();
			//교수 테이블에서 이름, 학과 ,이메일 ,학번 일치한 경우
			pstmt = conn.prepareStatement("select * from professor where proname=? and propart=? and proemail=? and id=?");
			pstmt.setString(1, dto.getProname());
			pstmt.setString(2, dto.getPropart());
			pstmt.setString(3, dto.getProemail());
			pstmt.setString(4, dto.getId());
			rs = pstmt.executeQuery();
			//일치한 데이터가 있다면 pwProDTO 에 저장
			if(rs.next()) {
				dto.setProname(rs.getString("proname"));
				dto.setPropart(rs.getString("propart"));
				dto.setProemail(rs.getString("proemail"));
				dto.setPw(rs.getString("pw"));
				dto.setId(rs.getString("id"));
			}

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	//교수 임시비밀번호로 업데이트
	public void updatepwPro(String pw, String id) {
		try {
			conn = getConnection();
			//교수 테이블에서 학번 일치한 교수 비밀번호 업데이트
			pstmt = conn.prepareStatement("update professor set pw=? where id=?");
			pstmt.setString(1, pw);
			pstmt.setString(2,id);
			pstmt.executeUpdate();
			//로그인에 대한 global 테이블 비밀번호 업데이트
			pstmt = conn.prepareStatement("update global set pw=? where id=?");
			pstmt.setString(1, pw);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
}
