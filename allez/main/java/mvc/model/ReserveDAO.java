package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import mvc.database.DBConnection;

public class ReserveDAO {
	// 커넥션풀 설정, 가장 중요한 class
	// 싱글톤 패턴디자인-자기 자신의 객체 생성 static
	private static ReserveDAO instance = new ReserveDAO();
	
	// 자기 자신의 객체 리턴 static
	public static ReserveDAO getInstance() {
		return instance;
	}
	
	// 생성자 접근 막아주기
	private ReserveDAO() {}
	
	
	//예약 유무를 판단해주는 메소드 => 예약이 이미 있으면 true 예약이 없으면 false 
	public boolean checkReserve(String place, String drive_date, String drive_time) {

		String sql = "select sum(use) FROM allez_reserve where place = ? and drive_date = ? and drive_time = ?";

		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		int count = 0;

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, place);
			pstmt.setString(2, drive_date);
			pstmt.setString(3, drive_time);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) count = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
				
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return count > 0 ? true : false;
	}

	
	//예약이 됐다면 use를 1로 업데이트해서 같은 예약을 막아줌
	public void updateReserve(String place, String drive_date, String drive_time) {
		String sql = "update allez_reserve set use = 1 where place = ? and drive_date = ? and drive_time = ?";
				
		Connection conn=null;
		PreparedStatement pstmt=null;
		

		try {
			conn = DBConnection.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, place);
			pstmt.setString(2, drive_date);
			pstmt.setString(3, drive_time);

			pstmt.executeUpdate();
			
			System.out.println("use를 1로 수정완료");
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
				
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	
	// DB에 예약 정보 추가하는 메소드
	public void addReserve(String id, String car_name, String place, String drive_date, String drive_time, String image_url) {
		String sql = "insert into allez_reserve (num, id, car_name, place, drive_date, drive_time, image_url) values (seq_reserve.nextVal, ?, ?, ?, ?, ?, ?)";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, car_name);
			pstmt.setString(3, place);
			pstmt.setString(4, drive_date);
			pstmt.setString(5, drive_time);
			pstmt.setString(6, image_url);
			
			pstmt.executeUpdate();
			
			System.out.println("DB에 예약정보 추가 완료");

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
	
	// DB에서 예약 내역을 불러오는 메소드
	public List<ReserveDTO> list(String id){
		
		// ReserveDTO list 객체
		List<ReserveDTO> list = new ArrayList<ReserveDTO>();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql = "select * from allez_reserve where id = ? order by num desc";
		
		try {
			conn= DBConnection.getConnection();
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				int num = rs.getInt("num");
				String id1 = rs.getString("id");
				String car_name = rs.getString("car_name");
				String place = rs.getString("place");
				String drive_date = rs.getString("drive_date");
				String drive_time = rs.getString("drive_time");
				String image_url = rs.getString("image_url");
				
				ReserveDTO dto = new ReserveDTO(num, id1, car_name, place, drive_date, drive_time, image_url);
				
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
	
	
	//예약 내역 삭제 메소드
	public void delete(String num) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=DBConnection.getConnection();
			
			String query="delete from allez_reserve where num=?";
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

	
}
