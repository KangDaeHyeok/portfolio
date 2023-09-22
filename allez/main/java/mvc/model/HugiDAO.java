package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class HugiDAO {
	
	/**
	 * Hugi_WriteForm.jsp의 글작성시
	 * 모델 이름을 DB에서 가져오는 기능
	 * @return
	 */
	public ArrayList<CarDTO> SelectBox(){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from car";
		//car 테이블에 있는 값들을 불러오는 쿼리문
		
		ArrayList<CarDTO> list = new ArrayList<CarDTO>();
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CarDTO car = new CarDTO();
				car.setCarname(rs.getString("carname"));
				
				list.add(car);
				//while문을 이용하여 carDTO에 있는 carname을 list에 담는다.
			}
		} catch (SQLException e) {
			System.out.println("SelectBox() 에러 : " + e);
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return list;
		//list에 담긴 carname을 리턴
	}
	
	
	/**
	 * 게시판 글작성
	 * @param id
	 * @param carname
	 * @param title
	 * @param content
	 * @param star
	 */
	public void write(String id, String carname, String title, String content, int star) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into hugi(num, id, carname, title, content, count, star, u_day) values(num.nextval, ?, ?, "
				+ "?, ?, 0, ?,  sysdate)";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, carname);
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			pstmt.setInt(5, star);
			
			pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			System.out.println("write() 에러 : " +e);
		} finally {
			try {
				if (conn != null) conn.close();
				if (pstmt != null) pstmt.close();
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} //write()
	
	
	/**
	 * 게시판 게시글 총 개수를 가져오는 기능
	 * @param items
	 * @param text
	 * @return
	 */
	public int getListCount(String search_item, String search_text) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = 0; // 선택된 총 게시글의 갯수

		String sql;

		if (search_item == null || search_text == null || search_item == "" || search_text == "")
			sql = "select count(*) from hugi"
					+ " inner join allez_member"
					+ " on hugi.id = allez_member.id"
					+ " inner join car"
					+ " on hugi.carname = car.carname";
		else
			sql = "select count(*) from hugi "
					+ " inner join allez_member"
					+ " on hugi.id = allez_member.id"
					+ " inner join car"
					+ " on hugi.carname = car.carname"
					+ " where "+ search_item + " like '%" + search_text + "%'";
		//count(*) : 조회되는 행의 갯수를 가져온다.
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next())
				x = rs.getInt(1); // rs의 첫번째 결과값을 가지고 와서 정수타입의 x(선택된 총 게시글의 갯수)에 저장

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("getListCount() 에러 : " + e);
		} finally {
			if (rs != null)
				try {
					rs.close();
					if (conn != null)
						conn.close();
					if (pstmt != null)
						pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return x;
		//게시판 검색할때 키워드 입력시 키워드에 맞는 게시글 수 불러오기
	}
	
	
	/**
	 * 게시판 리스트
	 * @return
	 */
	public ArrayList<HugiDTO> list(int pageNum, int limit, String search_item, String search_text){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int start = (pageNum - 1) * limit;
		// 0,5,10,... 행을 가져올 시작 위치를 지정
		int index = start + 1;
		// 1,6,11,... 
		int rows = start + limit;
		
		ArrayList<HugiDTO> list = new ArrayList<HugiDTO>();
		
		String sql;
		
			if(search_item == null || search_text == null || search_item == "" || search_text == "") {
				sql = "select b.* from (select ROWNUM AS \"rows\", a.* from (select hugi.num, "
						+ " hugi.id, hugi.carname, hugi.title, hugi.content, hugi.count,"
						+ " hugi.star, hugi.u_day, allez_member.name, car.carModel, car.car_image"
						+ " from hugi"
						+ " inner join allez_member"
						+ " on hugi.id = allez_member.id"
						+ " inner join car"
						+ " on hugi.carname = car.carname"
						+ " order by hugi.num desc) a)"
						+ " b where \"rows\" between " + index + " and " + rows;
			}else {
				sql = "select b.* from (select ROWNUM AS \"rows\", a.* from (select hugi.num, "
						+ " hugi.id, hugi.carname, hugi.title, hugi.content, hugi.count,"
						+ " hugi.star, hugi.u_day, allez_member.name, car.carModel, car.car_image"
						+ " from hugi"
						+ " inner join allez_member"
						+ " on hugi.id = allez_member.id"
						+ " inner join car"
						+ " on hugi.carname = car.carname"
						+ " where "+search_item+" like '%"+search_text+"%' "
						+ " order by hugi.num desc) a)"
						+ " b where \"rows\" between " + index + " and " + rows;
			}

		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HugiDTO dto = new HugiDTO();
				dto.setNum(rs.getInt("num"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setCar_image(rs.getString("car_image"));
				dto.setCarModel(rs.getString("carModel"));
				dto.setCarname(rs.getString("carname"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setCount(rs.getInt("count"));
				dto.setStar(rs.getInt("star"));
				dto.setU_day(rs.getString("u_day"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("list() 에러 : " + e);
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return list;
	} //list()
	
	
	
	/**
	 * 게시판 상세보기 실행시 저장된 데이터 조회
	 * @param title
	 * @return
	 */
	public HugiDTO getWriteInfo(int num) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		HugiDTO dto = new HugiDTO();
		
		String sql = "select * from hugi where num=?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setCarname(rs.getString("carname"));
				dto.setContent(rs.getString("content"));
				dto.setStar(rs.getInt("star"));
				
			}
			
		} catch (SQLException e) {
			System.out.println("getWriteInfo() 에러 : " +e);
		} finally {
			try {
				if (rs != null) rs.close();
				if (conn != null) conn.close();
				if (pstmt != null) pstmt.close();
				
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return dto;
	}
	
	
	/**
	 * 조회수 증가 메소드
	 * @param num
	 */
	public void count(int num) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select count from hugi where num = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			int count = 0;
			
			if(rs.next()) {
				count = rs.getInt("count")+1;
			}
			
			sql = "update hugi set count = ? where num = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("count() 에러 : " +e);
		} finally {
			try {
				if (rs != null) rs.close();
				if (conn != null) conn.close();
				if (pstmt != null) pstmt.close();
				
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		
	}
	
	
	/**
	 * 게시판 글 수정
	 * @param title
	 * @param content
	 * @param star
	 * @param origin_title
	 */
	public void update(String title, String content, String star, int num) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "update hugi set title=?, content=?, star=? where num=?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, star);
			pstmt.setInt(4, num);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("update() 에러 : " +e);
		} finally {
			try {
				if (conn != null) conn.close();
				if (pstmt != null) pstmt.close();
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} //update()
	
	
	public void delete(int num) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "delete from hugi where num=?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("delete() 에러 : " +e);
		} finally {
			try {
				if (conn != null) conn.close();
				if (pstmt != null) pstmt.close();
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} //delete()
}
