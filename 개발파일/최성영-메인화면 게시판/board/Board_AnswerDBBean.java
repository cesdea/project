package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import myUtil.HanConv;
import oracle.net.aso.p;

public class Board_AnswerDBBean {
	private static Board_AnswerDBBean instance=new Board_AnswerDBBean(); 
	
	public static Board_AnswerDBBean getInstance() {
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
	
	public ArrayList<Board_AnswerBean> listBoard_Answer(int b_id){
		ArrayList<Board_AnswerBean> bal=new ArrayList<Board_AnswerBean>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from board_answer where b_a_id=? order by b_a_ref desc";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, b_id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Board_AnswerBean ba=new Board_AnswerBean();
				ba.setB_a_id(rs.getInt("b_a_id"));
				ba.setB_a_name(rs.getString("b_a_name"));
				ba.setB_a_name_hidden(rs.getString("b_a_name_hidden"));
				ba.setB_a_content(rs.getString("b_a_content"));
				ba.setB_a_ref(rs.getInt("b_a_ref"));
				ba.setB_a_hidden(rs.getString("b_a_hidden"));
				ba.setB_a_level(rs.getInt("b_a_level"));
				bal.add(ba);
			}
		}catch (Exception e) {
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
		return bal;
	}
	
	public int insertBoard_Answer(Board_AnswerBean bab) {
		int re=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql1="select max(b_a_ref) from board_answer where b_a_id=?";
		String sql2="insert into board_answer (b_a_id,b_a_name,b_a_content,b_a_hidden,b_a_name_hidden,b_a_ref,b_a_level) values(?,?,?,?,?,?,?)";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql1);
			pstmt.setInt(1, bab.getB_a_id());
			rs=pstmt.executeQuery();
			int b_a_ref=1;
			if(rs.next()) {
				b_a_ref=rs.getInt(1)+1;
			}
			pstmt=conn.prepareStatement(sql2);
			pstmt.setInt(1, bab.getB_a_id());
			pstmt.setString(2, HanConv.toKor(bab.getB_a_name()));
			pstmt.setString(3, HanConv.toKor(bab.getB_a_content()));
			pstmt.setString(4, bab.getB_a_hidden());
			pstmt.setString(5, bab.getB_a_name_hidden());
			pstmt.setInt(6, b_a_ref);
			pstmt.setInt(7, 0);
			re=pstmt.executeUpdate();
		}catch (Exception e) {
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
	
	public int editBoard_Answer(int b_a_ref,String b_a_content) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="update board_answer set b_a_content=? where b_a_ref=?";
		int re=0;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, b_a_content);
			pstmt.setInt(2, b_a_ref);
			re=pstmt.executeUpdate();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) conn.close();
				//if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return re;
	}
	
	public int deleteBoard_Answer(int b_a_ref,int b_id) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="delete from board_answer where b_a_ref=? and b_a_id=?";
		int re=0;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, b_a_ref);
			pstmt.setInt(2, b_id);
			re=pstmt.executeUpdate();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) conn.close();
				//if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return re;
	}
	
	public Board_AnswerBean getBoard_Answer(int b_a_ref,int b_id) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from board_answer where b_a_ref=? and b_a_id=?";
		Board_AnswerBean ba=new Board_AnswerBean();
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, b_a_ref);
			pstmt.setInt(2,b_id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				ba.setB_a_id(rs.getInt("b_a_id"));
				ba.setB_a_name(rs.getString("b_a_name"));
				ba.setB_a_name_hidden(rs.getString("b_a_name_hidden"));
				ba.setB_a_content(rs.getString("b_a_content"));
				ba.setB_a_hidden(rs.getString("b_a_hidden"));
				ba.setB_a_ref(b_a_ref);
				ba.setB_a_level(rs.getInt("b_a_level"));
			}else {
				ba=null;
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) conn.close();
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		
		return ba;
	}
}
