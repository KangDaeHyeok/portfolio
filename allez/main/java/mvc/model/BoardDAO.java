package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import mvc.database.DBConnection;


public class BoardDAO {
	// 커넥션풀 설정, 가장 중요한 class
	// 싱글톤 패턴디자인-자기 자신의 객체 생성 static
	private static BoardDAO instance = new BoardDAO();
	
	// 자기 자신의 객체 리턴 static
	public static BoardDAO getInstance() {
		return instance;
	}
	
	// 생성자 접근 막아주기
	private BoardDAO() {}


	// 사용자 입력 정보를 DB에 저장해주는 메소드
	public void write(String subject, String content, String id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.getConnection();
			String sql = "insert into allez_board (num, subject, content, reF, id) values (allez_board_seq.nextval, ?, ?, allez_board_seq.currval, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, id);
			
			// executeUpdate : insert문에 씀 / 테이블에 작업한 데이터의 수 반환(int)
			int su = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	
	
    // DB에서 게시판 리스트를 불러오는 메소드
	public List<BoardDTO> list(String items, String text){
		
		// Board DTO list 객체
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql;
		
		if(items == null && text == null) {
			sql="select allez_board.num, allez_board.subject, allez_board.content, allez_board.regist_day, allez_board.hit, allez_board.reF, allez_board.reStep, allez_board.reLevel, allez_board.id, allez_member.name FROM allez_board inner join allez_member on allez_board.id = allez_member.id order by ref desc, restep asc";
		}
		else sql = "select allez_board.num, allez_board.subject, allez_board.content, allez_board.regist_day, allez_board.hit, allez_board.reF, allez_board.reStep, allez_board.reLevel, allez_board.id, allez_member.name from allez_board inner join allez_member on allez_board.id = allez_member.id where " + items + " like '%" + text + "%' order by ref desc";
		
		try {
			conn= DBConnection.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("id");
				int num = rs.getInt("num");
				String writer = rs.getString("name");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				Timestamp regist_day = rs.getTimestamp("regist_day");
				int hit = rs.getInt("hit");
				int reF = rs.getInt("reF");
				int reStep = rs.getInt("reStep");
				int reLevel = rs.getInt("reLevel");
				
				BoardDTO dto = new BoardDTO(num, writer, subject, content, regist_day, hit, reF, reStep, reLevel, id);
				
				list.add(dto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally{
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}
	
	
	
	// 선택한 게시물의 내용보기 -> 선택한 게시물 '번호'가 나와야함
	// 리턴값 Board -> 전체 정보 넘겨야함, 사용자로부터 아이디값 받기
	public BoardDTO contentView(String num) {
		
		// 조회수 작업 메소드 호 -> 반드시 함수 맨위에 해주기
		readCount(num);
		
		BoardDTO board=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null; // DB에서 정보를 읽어오기 때문에 필요
		
		try {
			conn=DBConnection.getConnection();
			String query="select allez_board.num, allez_board.subject, allez_board.content, allez_board.regist_day, allez_board.hit, allez_board.reF, allez_board.reStep, allez_board.reLevel, allez_board.id, allez_member.name from allez_board inner join allez_member on allez_board.id = allez_member.id where num=?";
			pstmt=conn.prepareStatement(query);
			// BIDX : NUMBER이기때문에 사용자로부터 받은 String bIdx 변환해주기 
			pstmt.setInt(1, Integer.parseInt(num));
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				// 정보를 받아오는 것이기때문에 지역변수 선언해서 변수 안에 받아주기
				String id=rs.getString("id");
				int num1=rs.getInt("num");
				String writer=rs.getString("name");
				String subject=rs.getString("subject");
				String content=rs.getString("content");
				Timestamp regist_day=rs.getTimestamp("regist_day");
				int hit=rs.getInt("hit");
				
				// reF : 글을 그룹화하기 위한 필드, 제목글과 그에 딸린 답변글이 그룹화 
				// reStep : 제목글과 답변글의 순서를 정리하기 위한 필드 / 부모와자식이순차적으로보이게할수있음
				// reLevel : 글의 레벨을 저장하는 필드 (질문글 레벨0 -> 답변글 레벨1) 
				
				int reF=rs.getInt("reF");
				int reStep=rs.getInt("reStep");
				int reLevel=rs.getInt("reLevel");
				
				// BoardVO DTO클래스의 객체에 받아온 데이터 저장
				board = new BoardDTO(num1, writer, subject, content, regist_day, hit, reF, reStep, reLevel, id);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
				
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		System.out.println(board.toString()); 
		// --> 어디서? 문제가 일어났는지 확인 용도 :  1) DB / 2) db가져오는 method / 3) 페이지를 보여주는 jsp
		return board;
	}
	
	
	// 조회수 작업 메소드
	private void readCount(String num) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=DBConnection.getConnection();
			
			// bReadCount = bReadCount + 1 --> 기본 값 0
			String query="UPDATE allez_board SET hit=hit+1 WHERE num=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, num);
			
			int su =pstmt.executeUpdate();
			
			if(su != 0) System.out.println("조회수 작업완료");
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
				
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	
	// 게시글을 수정하는 메소드
	public void modify(String num, String subject, String content) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=DBConnection.getConnection();
			
			String query="update allez_board set subject=?, content=? where num=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, Integer.parseInt(num));
			
			int su = pstmt.executeUpdate();
			
			if(su != 0) System.out.println("수정된 항목"+su+"개"); // 콘솔로 수정 확인
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception ex) {
				ex.printStackTrace();
			}
		}
	}
	
	
	// 게시물 삭제 메소드
	public void delete(String num) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=DBConnection.getConnection();
			
			String query="delete from allez_board where num=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(num)); //
			
			int su = pstmt.executeUpdate();
			if(su != 0) System.out.println("삭제된 행의 갯수 : "+su);
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	
	// 답변 쓰기 전, 원글 데이터를 가져오는 메소드
	public BoardDTO replyView(String num) {
		
		BoardDTO board = null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null; // 데이터 받아와서 출력
		
		try {
			conn=DBConnection.getConnection();
			
			String query="select allez_board.num, allez_board.subject, allez_board.content, allez_board.regist_day, allez_board.hit, allez_board.reF, allez_board.reStep, allez_board.reLevel, allez_board.id, allez_member.name from allez_board inner join allez_member on allez_board.id = allez_member.id where num=?";
			pstmt=conn.prepareStatement(query);
			
			pstmt.setInt(1, Integer.parseInt(num));
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				int num1=rs.getInt("num");
				String writer=rs.getString("name");
				String subject=rs.getString("subject");
				String content=rs.getString("content");
				Timestamp regist_day=rs.getTimestamp("regist_day");
				int hit=rs.getInt("hit");
				int reF=rs.getInt("reF");
				int reStep=rs.getInt("reStep");
				int reLevel=rs.getInt("reLevel"); 
				String id=rs.getString("id");
				
				board = new BoardDTO(num1, writer, subject, content, regist_day, hit, reF, reStep, reLevel, id);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				if (rs != null) rs.close();
				if (pstmt!= null) pstmt.close();
				if (conn!= null) conn.close();
				
			}catch(Exception ex) {
				ex.printStackTrace();
			}
		}
		return board;
	}
	
	
	// 사용자가 답변한 내용 연동 : update, insert 2가지 기능 넣기
	public void reply(String num, String subject, String content, String reF, String reStep, String reLevel, String id) {
		
		// 업데이트 메소드 호출(계층형 게시판) -> update후에 insert진행
		// 메소드 시작할 때, 가장 최상위에 메소드 호출 해주기
		replyUpdate(reF, reStep);
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=DBConnection.getConnection();
			String query="insert into allez_board (num, subject, content, hit, reF, reStep, reLevel, id) values (allez_board_seq.NEXTVAL, ?, ?, 0, ?, ?, ?, ?)";
			
			pstmt=conn.prepareStatement(query);
			
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, reF);
			pstmt.setInt(4, Integer.parseInt(reStep)+1);
			pstmt.setInt(5, Integer.parseInt(reLevel)+1);
			pstmt.setString(6, id);
			
			// insert문에 씀 / 테이블에 작업한 데이터의 수 반환 (int형)
			int su = pstmt.executeUpdate();
			if (su != 0) System.out.println("부모글로 추가한 갯수 : "+su);
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
				
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	
	
	// 계층형 게시판 update method
	private void replyUpdate(String reF, String reStep) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=DBConnection.getConnection();
			
			String query="update allez_board set reStep=reStep+1 where reF=? and reStep > ?";
			pstmt=conn.prepareStatement(query);
			
			pstmt.setInt(1,Integer.parseInt(reF));
			pstmt.setInt(2,Integer.parseInt(reStep));
			
			int su = pstmt.executeUpdate();
			if (su != 0) System.out.println("부모글로 수정한 갯수 :"+su);
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
				
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	
	
	

}
 