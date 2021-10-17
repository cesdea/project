package portfolio.customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import myUtil.*;

public class CustomerDBBean {
	
	private static CustomerDBBean instance = new CustomerDBBean();
	
	public static CustomerDBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	

	public int userCheck(String id, String pwd) throws Exception{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql = "SELECT cus_pwd FROM customer where cus_id =?";
		int re=-1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			String db_mem_pwd;
			
			if (rs.next()) {
				db_mem_pwd = rs.getString("cus_pwd");
				if (db_mem_pwd.equals(pwd)) {
					re = 1;
				} else {
					re = 0;
				}
			} else {
				re=-1;
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return re;
	}
	
	public CustomerBean getCustomer(String id) throws Exception {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql = "SELECT * FROM customer where cus_id =?";

		CustomerBean customer=null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				customer=new CustomerBean();
				customer.setCus_id(rs.getString("cus_id"));
				customer.setCus_pwd(rs.getString("cus_pwd"));
				customer.setCus_nickname(rs.getString("cus_nickname"));
				customer.setCus_email(rs.getString("cus_email"));
				customer.setCus_registration_date(rs.getTimestamp("cus_registration_date"));
				customer.setCus_num(rs.getInt("cus_num"));			
			} 

		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return customer;
	}
	
	public int updateCustomer(CustomerBean customer) throws Exception {
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="UPDATE customer set cus_pwd =?, cus_nickname =?, cus_email =? WHERE cus_id =?";
		int re=-1;
		
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, customer.getCus_pwd());
			pstmt.setString(2, HanConv.toKor(customer.getCus_nickname()));
			pstmt.setString(3, customer.getCus_email());
			pstmt.setString(4, customer.getCus_id());
			re = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("변경실패");
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return re;
		
	}
	
}
