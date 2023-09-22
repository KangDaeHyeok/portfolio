package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mvc.database.DBConnection;

public class BuildDAO {

	// 커넥션풀 설정, 가장 중요한 class
	// 싱글톤 패턴디자인-자기 자신의 객체 생성 static
	private static BuildDAO instance = new BuildDAO();
	
	// 자기 자신의 객체 리턴 static
	public static BuildDAO getInstance() {
		return instance;
	}
	
	// 생성자 접근 막아주기
	private BuildDAO() {}

	
	public void InsertBuild(BuildDTO build){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO buildList VALUES (?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,listNum.nextval)";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, build.getUesr_id());
			pstmt.setString(2, build.getCarname());
			pstmt.setString(3, build.getEngine());
			pstmt.setString(4, build.getTrim());
			pstmt.setString(5, build.getTransmission());
			pstmt.setString(6, build.getCarPrice());
			pstmt.setString(7, build.getIn_color());
			pstmt.setString(8, build.getInColor_image());
			pstmt.setString(9, build.getOut_color());
			pstmt.setString(10, build.getOutColor_image());
			pstmt.setString(11, build.getCar_image());
			pstmt.setString(12, build.getRegion());
			pstmt.setString(13, build.getWarehouse());
			pstmt.setString(14, build.getOptionName());
			pstmt.setString(15, build.getOptionPrice());
			pstmt.setString(16, build.getConsignment());
			pstmt.setString(17, build.getCashWay());
			pstmt.setString(18, build.getPrepayment());
			pstmt.setString(19, build.getInstallmentPrincipal());
			pstmt.setString(20, build.getMonthPeriod());
			pstmt.setString(21, build.getPayInstallments());
			pstmt.setString(22, build.getLogtime());
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("InsertBuild() 에러 : " +e);
		} finally {
			try {
				if (conn != null) conn.close();
				if (pstmt != null) pstmt.close();
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}//InsertBuild
	

	
	
	public ArrayList<BuildDTO> getBuildList(String id, String num){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql;
		
		if(num != null) sql="select * from buildList where id = '"+id+"' and listNum = "+num+" order by listNum desc";
		else sql="select * from buildList where id = '"+id+"' order by listNum desc";
		
		ArrayList<BuildDTO> list = new ArrayList<BuildDTO>();
		
		try {
			conn = DBConnection.getConnection();
			/* pstmt = conn.prepareStatement(sql); */
			pstmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BuildDTO dto = new BuildDTO();
				if(num != null) {
					dto.setUesr_id(rs.getString("id"));
					dto.setCarname(rs.getString("carname"));
					dto.setEngine(rs.getString("engine"));
					dto.setTrim(rs.getString("trim"));
					dto.setTransmission(rs.getString("transmission"));
					dto.setCarPrice(rs.getString("carPrice"));
					dto.setIn_color(rs.getString("inColor"));
					dto.setInColor_image(rs.getString("inColorImgFile"));
					dto.setOut_color(rs.getString("outColor"));
					dto.setOutColor_image(rs.getString("outColorImgFile"));
					dto.setCar_image(rs.getString("carImgFile"));
					dto.setRegion(rs.getString("region"));
					dto.setWarehouse(rs.getString("warehouse"));
					dto.setOptionName(rs.getString("optionName"));
					dto.setOptionPrice(rs.getString("optionPrice"));
					dto.setConsignment(rs.getString("consignment"));
					dto.setCashWay(rs.getString("cashWay"));
					dto.setPrepayment(rs.getString("prepayment"));
					dto.setInstallmentPrincipal(rs.getString("installmentPrincipal"));
					dto.setMonthPeriod(rs.getString("monthPeriod"));
					dto.setPayInstallments(rs.getString("payInstallments"));
					dto.setLogtime(rs.getString("logtime"));
					dto.setListNum(rs.getInt("listNum"));
					
				}else {
					dto.setLogtime(rs.getString("logtime"));
					dto.setCarname(rs.getString("carname"));
					dto.setEngine(rs.getString("engine"));
					dto.setTrim(rs.getString("trim"));
					dto.setTransmission(rs.getString("transmission"));
					dto.setIn_color(rs.getString("inColor"));
					dto.setOut_color(rs.getString("outColor"));
					dto.setCarPrice(rs.getString("carPrice"));
					dto.setCar_image(rs.getString("carImgFile"));
					dto.setOptionName(rs.getString("optionName"));
					dto.setOptionPrice(rs.getString("optionPrice"));
					dto.setCashWay(rs.getString("cashWay"));
					dto.setListNum(rs.getInt("listNum"));
				}
				
				list.add(dto);
			}
			
			return list;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// 저장되지 않을때 null 리턴
		return null;
	}
	
	public void deleteListInfo(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.getConnection();
			String sql = "delete from buildList where listNum = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("deleteBoard() 에러 : "+e);
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	 
		public boolean checkBuild(String id) {

			String sql = "select count(*) from buildList where id = '"+id+"'";
			

			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			int count = 0;

			try {
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if (rs.next()) count = rs.getInt(1);
				System.out.println("rs.getInt(1) 갯수 : "+rs.getInt(1));
				System.out.println("count 갯수 : "+count);
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
			return count < 2 ? true : false;
		}
	
	
}
