package mvc.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// DB를 연결하는 코드 생성
public class DBConnection {
	public static Connection getConnection() throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "c##test";
			String password ="1234";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 등록 성공");
			
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("접속 성공");
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 등록 실패");
			e.printStackTrace();
			System.out.println("접속 실패");
			System.out.println(e.getMessage());
		}
		return conn;
	}
}

