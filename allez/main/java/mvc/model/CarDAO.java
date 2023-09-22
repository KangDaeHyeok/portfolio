package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class CarDAO {

	
	
	/**
	 * 모델 등록
	 * @param carModel
	 * @param carName
	 * @param price
	 * @param carImage
	 */
	public void AddCar(String carModel, String carName, String price, String carImage) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO car (carModel, carname, price, car_image) VALUES(?, ?, ?, ?)";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, carModel);
			pstmt.setString(2, carName);
			pstmt.setString(3, price);
			pstmt.setString(4, carImage);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("AddCar() 에러 : " +e);
		} finally {
			try {
				if (conn != null) conn.close();
				if (pstmt != null) pstmt.close();
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} //AddCar()
	
	
	/**
	 * 모델 수정 데이터 조회
	 * @param carName
	 * @return
	 */
	public CarDTO getInfo(String carName) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		CarDTO dto = new CarDTO();
		
		String sql = "select * from car where carname=?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, carName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setCarModel(rs.getString("carModel"));
				dto.setCarname(rs.getString("carName"));
				dto.setPrice(rs.getInt("price"));
			}
			
		} catch (SQLException e) {
			System.out.println("getInfo() 에러 : " +e);
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
	 * 회원 수정
	 * @param carModel
	 * @param carName
	 * @param price
	 * @param carImage
	 */
	public void UpdateCar(String carModel, String carName, String price, String carImage, String carNameOrigin) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		
		try {
			if(carImage != null) {
				String sql = "update car set carModel=? , carname=?, price=?, car_image=? where carname=?";
				
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, carModel);
				pstmt.setString(2, carName);
				pstmt.setString(3, price);
				pstmt.setString(4, carImage);
				pstmt.setString(5, carNameOrigin);
				pstmt.executeUpdate();
			}
			else {
				String sql = "update car set carModel=? , carname=?, price=? where carname=?";
				
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, carModel);
				pstmt.setString(2, carName);
				pstmt.setString(3, price);
				pstmt.setString(4, carNameOrigin);
				pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			System.out.println("UpdateCar() 에러 : " +e);
		} finally {
			try {
				if (conn != null) conn.close();
				if (pstmt != null) pstmt.close();
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} // UpdateCar()
	
	
	
	/**
	 * 모델 삭제
	 * @param carName
	 */
	public void DeleteCar(String carName) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "delete from car where carname=?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, carName);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("DeleteCar() 에러 : " +e);
		} finally {
			try {
				if (conn != null) conn.close();
				if (pstmt != null) pstmt.close();
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}	
	} //DeleteCar
}
