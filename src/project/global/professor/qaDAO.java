package project.global.professor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class qaDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private Connection getConnection(){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@nullmaster.iptime.org:1521:orcl";
			String user = "class09" , password = "class09";
			conn = DriverManager.getConnection(url,user,password);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	//학번 세션 구분을 위한 개인정보 가져오기
	public qainfoDTO qainfo(String id) {
		qainfoDTO dto = new  qainfoDTO();
		//System.out.println("dao id" : + id);
		try {
			conn = getConnection();
			//학번으로 개인정보  select
			pstmt = conn.prepareStatement("select * from student where stnum=?");
			pstmt.setString(1, id);
			//System.out.println("dao id2 : " + id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto.setStname(rs.getString("stname"));
				dto.setStnum(rs.getString("stnum"));
				
			}
			//학번으로 개인정보  select
			pstmt = conn.prepareStatement("select * from professor where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto.setProname(rs.getString("proname"));
				dto.setId(rs.getString("id"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return dto;
	}
	//게시판에 고정값으로 사용할 강의리스트에서 정보 가져오기
	public qaDTO selectqaboard(String classnum) {
		qaDTO dto = new qaDTO();
		String sql="";
		try {
			conn = getConnection();
			//학생이 수강하는 강의리스트 classnum으로 구분
			pstmt = conn.prepareStatement("select * from signup "
					+ "where classnum=?");
			pstmt.setString(1, classnum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setClassname(rs.getString("classname"));
				dto.setHomeroompro(rs.getString("homeroompro"));
				dto.setClassnum(rs.getString("classnum"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return dto;
	}
	
	//강의 게시판에 글쓰기
	public void insertArticle(qaDTO dto) {
		String classnum = dto.getClassnum();
		int num = dto.getNum();
		String sql="";
		try {
			conn = getConnection();
			//각 강의게시판 글 유무 확인
			pstmt = conn.prepareStatement("select count(*) from qa where classnum=?");
			pstmt.setString(1, classnum);
			rs= pstmt.executeQuery();
			
			if(rs.next())
				num = rs.getInt(1)+1; //게시판에 글이 있다면 최신 글번호+1
			else 
				num = 1; //없다면 글번호 1
			//qa DB에 게시판 데이터 insert
			sql = "insert into qa(num, writer, subject, content, reg_date,readcount,classname, homeroompro, classnum) "
					+ "values(?, ?, ?, ?, ?, ?, ?, ?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setTimestamp(5, dto.getReg_date());
			pstmt.setInt(6, dto.getReadcount());
			pstmt.setString(7, dto.getClassname());
			pstmt.setString(8, dto.getHomeroompro());
			pstmt.setString(9, dto.getClassnum());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	//게시판 글 갯수 
	public int getArticleCount(String classnum) {
		int x=0;
		try {
			conn = getConnection();
			//게시판 글번호로 글 갯수 세기
			pstmt = conn.prepareStatement("select max(num)+1 from qa where classnum=?");
			pstmt.setString(1, classnum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x= rs.getInt(1); //게시판 글 갯수 변수 x에 대입
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x; //x값 리턴
	}
	//게시판 목록 리스트 
	public List<qaDTO> getArticles(String classnum, int start, int end) {
		List<qaDTO> articleList = null;
		try {
			conn = getConnection();
			//qa DB에 있는 게시판 데이터 select
			pstmt = conn.prepareStatement("select * from (select num, writer, subject, content, reg_date, readcount, "
					+ "classname, homeroompro, classnum, rownum r "
					+ "from (select * from qa order by num desc) where classnum=?) where r>=? and r<=?");
			pstmt.setString(1, classnum);
			pstmt.setInt(2, start); 
			pstmt.setInt(3, end); 
			rs = pstmt.executeQuery();
			if(rs.next()) {
				articleList = new ArrayList<qaDTO>(end); //ArrayList객체 생성
				do {
					qaDTO dto = new qaDTO();
					dto.setNum(rs.getInt("num"));
					dto.setWriter(rs.getString("writer"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setReg_date(rs.getTimestamp("reg_date"));
					dto.setReadcount(rs.getInt("readcount"));
					dto.setClassname(rs.getString("classname"));
					dto.setClassnum(rs.getString("classnum"));
					articleList.add(dto);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return articleList;
	}
	//게시판 글 내용 보기
	public qaDTO getArticle(int num, String classnum) {
		qaDTO dto = null;
		try {
			conn = getConnection();
			//게시판 목록의 제목 클릭 시 조회수 +1 증가
			pstmt = conn.prepareStatement("update qa set readcount=readcount+1 where num=? and classnum=?");
			pstmt.setInt(1, num);
			pstmt.setString(2, classnum);
			pstmt.executeUpdate();
			//qa 테이블에서 글번호와 강의코드 일치한 데이터  select
			pstmt = conn.prepareStatement("select * from qa where num = ? and classnum=?"); 
			pstmt.setInt(1, num);
			pstmt.setString(2, classnum);
			rs = pstmt.executeQuery();
		
			if(rs.next()) {
				dto = new qaDTO(); //qaDTO 객체 생성하여 저장
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setClassname(rs.getString("classname"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return dto;
	}
	//글수정을 위한 글 내용 가져오기
	public qaDTO updateGetArticle(int num, String classnum) {
		qaDTO dto = null; //qaDTO 변수 초기화
		try {
			conn = getConnection();
			//qa 테이블에서 글번호와 강의코드 일치한 데이터  select
			pstmt = conn.prepareStatement("select * from qa where num=? and classnum=?");
			pstmt.setInt(1, num);
			pstmt.setString(2, classnum);
			rs= pstmt.executeQuery();
			//일치한 데이터가 있다면 
			if(rs.next()) {
				dto = new qaDTO(); //qaDTO 객체 생성하여 저장
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setClassname(rs.getString("classname"));
				dto.setHomeroompro(rs.getString("homeroompro"));
				dto.setClassnum(rs.getString("classnum"));
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return dto;
	}
	//수정한 글 업데이트
	public int updateArticle(int num, String classnum, String subject, String content) {
		String sql="";
		int x=-1; 
		try {
			conn = getConnection();
			//qa 테이블에서 글번호와 강의코드 일치한 데이터  select
			pstmt = conn.prepareStatement("select * from qa where num=? and classnum=?");
			pstmt.setInt(1, num);
			pstmt.setString(2, classnum);
			rs = pstmt.executeQuery();
			//일치한 데이터 있다면
			if(rs.next()) {
				//수정한 글로 업데이트
					sql="update qa set subject=?, content=?, reg_date=sysdate where num=? and classnum=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, subject);
					pstmt.setString(2, content);
					pstmt.setInt(3, num);
					pstmt.setString(4, classnum);
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
	//게시판 글 삭제
	public int deleteArticle(int num, String classnum) {
		int x=-1; //삭제 성공 여부에 대한 변수 
		try {
			conn = getConnection();
			//qa 테이블에서 글번호와 강의코드 일치한 데이터  select
			pstmt = conn.prepareStatement("select * from qa where num=? and classnum=?");
			pstmt.setInt(1, num);
			pstmt.setString(2, classnum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				//일치한 데이터가 있다면 qa 테이블에서 삭제
				pstmt = conn.prepareStatement("delete from qa where num=? and classnum=?");
				pstmt.setInt(1, num);
				pstmt.setString(2, classnum);
				pstmt.executeUpdate();
				x=1; //삭제 성공
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x; //삭제 성공 여부 리턴
	}
	
	//해당 게시판에 댓글 달기
	public void insertreply(replyDTO rdto, int qno, String classnum) {
		int step = 0; //댓글 순서
		//int number = 0 ;
		String sql="";
		try {
			conn = getConnection();
			//해당 강의 게시판 글에 댓글 달기 위해 해당 게시판 글번호, 강의코드 qa 테이블에서 select
			pstmt = conn.prepareStatement("select num, classnum from qa where num=? and classnum=?");
			pstmt.setInt(1, qno);
			pstmt.setString(2, classnum);
			rs = pstmt.executeQuery();
			//qa테이블에서 일치한 데이터 rs 에 있다면 qno, classnum 변수에 각각 값 대입
			while(rs.next()) {
				qno = rs.getInt("num");
				classnum = rs.getString("classnum");
			}
			//reply테이블에서 해당 게시판 글번호, 강의코드 일치한 게시판 댓글 갯수 세기
			pstmt = conn.prepareStatement("select count(*) from reply where qno=? and classnum=?");
			pstmt.setInt(1, qno); //qa테이블에서 가져온 qno 컬럼값 
			pstmt.setString(2, classnum);//qa테이블에서 가져온 classnum 컬럼값 
			rs = pstmt.executeQuery();
			if(rs.next()) 
				step = rs.getInt(1)+1; //댓글 있다면 최신 댓글 번호+1
			else
				step = 1; //없다면 첫번째 글 번호1
			//댓글 입력 
			pstmt = conn.prepareStatement("insert into reply(qno, replytext, rname, replydate, step, classnum, id) "
					+ "values(?,?,?,?,?,?,?)");
			pstmt.setInt(1, qno);//qa테이블에서 가져온 qno 컬럼값 
			pstmt.setString(2, rdto.getReplytext());
			pstmt.setString(3, rdto.getRname());
			pstmt.setTimestamp(4, rdto.getReplydate());
			pstmt.setInt(5, step); 
			pstmt.setString(6, classnum);
			pstmt.setString(7, rdto.getId());
			pstmt.executeUpdate();	
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	//댓글 리스트 출력
	public List<replyDTO> replylist(int qno, String classnum) {
		List<replyDTO> list = null; //List 객체 생성
		try {
			conn = getConnection();
			//reply에서 해당 댓글 
			pstmt = conn.prepareStatement("select * from reply where qno=? and classnum=?  order by step");
			pstmt.setInt(1, qno);
			pstmt.setString(2, classnum);


			rs = pstmt.executeQuery();
			list = new ArrayList<replyDTO>(); //ArrayList 객체 생성
			while(rs.next()) {
				replyDTO dto = new replyDTO();
				dto.setQno(rs.getInt("qno"));
				dto.setReplytext(rs.getString("replytext"));
				dto.setRname(rs.getString("rname"));
				dto.setReplydate(rs.getTimestamp("replydate"));
				dto.setStep(rs.getInt("step"));
				dto.setClassnum(rs.getString("classnum"));
				dto.setId(rs.getString("id"));		
				list.add(dto); //ArrayList 객체에 dto add	
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return list;
	}
	//댓글 갯수 세기
	public int replyCount(int qno, String classnum) {
		int count=0; //댓글 갯수 변수
		try {
			conn = getConnection();
			//reply 테이블에서 해당 강의 게시판의 글번호와 강의코드에 해당하는 댓글 갯수 count
			pstmt = conn.prepareStatement("select count(step) from reply where qno=? and classnum=?");
			pstmt.setInt(1, qno);
			pstmt.setString(2, classnum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1); //해당 갯수 count 변수에 대입
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return count; //댓글 갯수 리턴
	}
	
	//댓글 삭제
	public int deleteReply(int qno, int step, String id) {
		int x=-1; //댓글 삭제 성공 여부
		try {
			conn = getConnection();
			//reply 테이블에서 해당 강의 게시판의 글번호와 강의코드에 해당하는 댓글 select
			pstmt = conn.prepareStatement("select * from reply where id=?");

			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//reply 테이블에서 해당 강의 게시판의 글번호와 강의코드에 해당하는 댓글 삭제
				pstmt = conn.prepareStatement("delete from reply where qno=? and step=? and id=?");
				pstmt.setInt(1, qno);
				pstmt.setInt(2, step);
				pstmt.setString(3, id);
				pstmt.executeUpdate();
				x=1; //삭제 성공
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x; //삭제 여부 리턴
	}
}
