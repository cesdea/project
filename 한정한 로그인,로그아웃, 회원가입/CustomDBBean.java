package magic.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import myUtil.*;

public class CustomDBBean {
	Timestamp ts = new Timestamp(System.currentTimeMillis());
	
	private static CustomDBBean instance=new CustomDBBean();

	public static CustomDBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/stock");
		return ds.getConnection();
	}
	
	public int insertMember(CustomBean member) throws Exception{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="insert into customer values(?,?,?,?,?,?)";
		
		
		
		
		int re=-1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getCus_id());
			pstmt.setString(2, member.getCus_pwd());
			pstmt.setString(3, HanConv.toKor(member.getCus_nickname()));
			pstmt.setString(4, member.getCus_email());
			pstmt.setTimestamp(5, ts);
			pstmt.setInt(6, member.getCus_num());
			pstmt.executeUpdate();
			
			re = 1;
			pstmt.close();
			conn.close();
			System.out.println("추가 성공");
		} catch (Exception e) {
			System.out.println("추가 실패");
			e.printStackTrace();
		}
		
		return re;
	}
	
	public int confirmID(String id) throws Exception{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select cus_id from CUSTOMER where cus_id=?";
		int re=-1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				re = 1;
			} else {
				re = -1;
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return re;
	}
	
	public int userCheck(String id, String pwd) throws Exception{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select cus_pwd from customer where cus_id=?";
		int re=-1;
		String db_cus_pwd;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				db_cus_pwd = rs.getString("cus_pwd");
				
				if (db_cus_pwd.equals(pwd)) {
					re=1;
				} else {
					re=0;
				}
			}else {
				re=-1;
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return re;
	}
	
	public CustomBean getMember(String id) throws Exception{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from CUSTOMER where cus_id=?";
		CustomBean member=null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				member = new CustomBean();
				member.setCus_id(rs.getString("cus_id"));
				member.setCus_pwd(rs.getString("cus_pwd"));
				member.setCus_nickname(rs.getString("cus_nickname"));
				member.setCus_email(rs.getString("cus_email"));
				member.setCus_registration_date(rs.getTimestamp("Cus_registration_date"));
				member.setCus_num(rs.getInt("cus_num"));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return member;
	}
}