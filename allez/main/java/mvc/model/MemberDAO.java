package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mvc.database.DBConnection;

/*18-9)데이터를 access하는 클래스*/

public class MemberDAO {

	

	/**
	 * 로그인 기능
	 * @param id
	 * @param password
	 * @return
	 */
	public String login(String id, String password) { // 로그인 기능

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select 'y' from allez_member where id=? and password=?";
		// 아이디와 비밀번호가 일치하면 y를 반환하게된다.

		String loginResult = "n";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				loginResult = rs.getString(1);
				// select로 검색한 id pw값이 있을경우 y를 반환하여 loginResult에 저장한다.
			}
			
		} catch (SQLException e) {
			System.out.println("login() 에러 : " +e);
		} finally {
			try {
				if (rs != null) rs.close();
				if (conn != null) conn.close();
				if (pstmt != null) pstmt.close();
				
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
			
		}
		return loginResult;
	} //login()
	
	
	
	/**
	 * 회원가입 기능
	 * @param allezMember
	 */
	public void join(MemberDTO allezMember) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into allez_member(id, password, name, birth_date, email, phone)"
				+ "values( ?, ?, ?, ?, ?, ?)";

		
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, allezMember.getId());
			pstmt.setString(2, allezMember.getPassword());
			pstmt.setString(3, allezMember.getName());
			pstmt.setString(4, allezMember.getBirth_date());
			pstmt.setString(5, allezMember.getEmail());
			pstmt.setString(6, allezMember.getPhone());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("join() 에러 : " +e);
		} finally {
			try {
				if (conn != null) conn.close();
				if (pstmt != null) pstmt.close();
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} //join()
	

	
	/**
	 * 아이디 중복 검사
	 * @param id
	 * @return
	 */
	public String duplication(String id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String duplication_id = "a";
		
		String sql = "select id from allez_member where id=?";//입력받은 아이디값이 존재하는지 조회
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				duplication_id = rs.getString(1);
				// select로 검색한 id값이 있을경우 아이디를 duplication_id에 저장한다.
			}
		} catch (SQLException e) {
			System.out.println("duplication() 에러 : " +e);
		} finally {
			try {
				if (rs != null) rs.close();
				if (conn != null) conn.close();
				if (pstmt != null) pstmt.close();
				
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
			
		}
		return duplication_id;
		
	} //duplication()
	
	
	/**
	 * 비밀번호 찾기
	 * @param id
	 * @param name
	 * @param email
	 * @return
	 */
	public String pwFind(String id, String name, String email) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String result = "n";
		
		String sql = "select 'y' as temp from allez_member where id=? and name=? and email=?";
		//id, name, email을 입력하여 값이 일치하면 y를 반환
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getString(1);//반환받은 값을 result에 저장
			}
		} catch (SQLException e) {
			System.out.println("pwFind() 에러 : " +e);
		} finally {
			try {
				if (rs != null) rs.close();
				if (conn != null) conn.close();
				if (pstmt != null) pstmt.close();
				
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
			
		}
		
		return result;
		
	} //pwFind()
	
	
	/**
	 * 비밀번호 재설정
	 * @param password
	 * @param id
	 * @param name
	 * @param email
	 */
	public void UpdatePassword(String password, String id, String name, String email) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "update allez_member set password=? where id=? and name=? and email=?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, password);
			pstmt.setString(2, id);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("UpdatePassword() 에러 : " +e);
		} finally {
			try {
				if (conn != null) conn.close();
				if (pstmt != null) pstmt.close();
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} //UpdatePassword()
	
	
	/**
	 * 아이디 찾기
	 * @param name
	 * @param email
	 * @return
	 */
	public String IdFind(String name, String email) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String result = "n";
		
		String sql = "select id from allez_member where name=? and email=?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getString(1);
			}
		} catch (SQLException e) {
			System.out.println("IdFind() 에러 : " +e);
		} finally {
			try {
				if (rs != null) rs.close();
				if (conn != null) conn.close();
				if (pstmt != null) pstmt.close();
				
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
			
		}
		
		return result;
	}
}














