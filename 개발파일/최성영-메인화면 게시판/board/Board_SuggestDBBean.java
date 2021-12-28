package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Board_SuggestDBBean {
	private static Board_SuggestDBBean instance = new Board_SuggestDBBean();
	
	public static Board_SuggestDBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception {
		Connection conn=null;
		String url="jdbc:oracle:thin:@localhost:1521:xe";	
		String user="stock";
		String password="1234";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn=DriverManager.getConnection(url, user, password);
		return conn;
	}
	
	public int addSuggest(String cus_id,int b_id) {
		int re=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from board_suggest where b_s_id=? and b_s_name=?";
		String sql2="update board set b_suggest=b_suggest+1 where b_id="+b_id;
		String sql3="insert into board_suggest (b_s_id,b_s_name) values(?,?)";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, b_id);
			pstmt.setString(2, cus_id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return re=0;
			}else {
				pstmt=conn.prepareStatement(sql2);
				int a=pstmt.executeUpdate();
				pstmt=conn.prepareStatement(sql3);
				pstmt.setInt(1, b_id);
				pstmt.setString(2, cus_id);
				int b=pstmt.executeUpdate();
				if(a==1 && b==1) {
					re=1;
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) conn.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}	
		
		return re;
	}
	
	public int cancleSuggest(String cus_id,int b_id) {
		int re=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from board_suggest where b_s_id=? and b_s_name=?";
		String sql2="update board set b_suggest=b_suggest-1 where b_id="+b_id;
		String sql3="delete board_suggest where b_s_id=? and b_s_name=?";	
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, b_id);
			pstmt.setString(2, cus_id);
			rs=pstmt.executeQuery();
			if(!rs.next()) {
				return re=0;
			}else {
				pstmt=conn.prepareStatement(sql2);
				int a=pstmt.executeUpdate();
				pstmt=conn.prepareStatement(sql3);
				pstmt.setInt(1, b_id);
				pstmt.setString(2, cus_id);
				int b=pstmt.executeUpdate();
				if(a==1 && b==1) {
					re=1;
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) conn.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}	
		
		return re;
	}
}
