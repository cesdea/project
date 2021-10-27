package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import customer.CustomerDBBean;
import myUtil.HanConv;

public class BoardDBBean {
	private static BoardDBBean instance = new BoardDBBean();
	
	public static BoardDBBean getInstance() {
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
	
	public int insertBoard(BoardBean board) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int re=0;
		String sql1="insert into board (b_name,b_name_hidden,b_title,b_content,b_hashtag,b_id) values(?,?,?,?,?,?)";
		String sql2="select max(b_id) from board";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql2);
			rs=pstmt.executeQuery();
			int b_id=1;
			if(rs.next()) {
				b_id=rs.getInt(1)+1;
			}
			pstmt=conn.prepareStatement(sql1);
			pstmt.setString(1, HanConv.toKor(board.getB_name()));
			pstmt.setString(2, board.getB_name_hidden());
			pstmt.setString(3, HanConv.toKor(board.getB_title()));
			pstmt.setString(4, HanConv.toKor(board.getB_content()));
			pstmt.setString(5, HanConv.toKor(board.getB_hashtag()));
			pstmt.setInt(6, b_id);
			re=pstmt.executeUpdate();
			if(re==1) {
				System.out.println("등록에 성공했습니다.");
			}else {
				System.out.println("등록에 실패했습니다.");
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
		return re;
	}
	
	public ArrayList<BoardBean> listBoard() {
		ArrayList<BoardBean> lb=new ArrayList<BoardBean>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from board order by b_id";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BoardBean boardBean=new BoardBean();
				boardBean.setB_ID(rs.getInt("b_id"));
				boardBean.setB_name(rs.getString("b_name"));
				boardBean.setB_name_hidden(rs.getString("b_name_hidden"));
				boardBean.setB_title(rs.getString("b_title"));
				boardBean.setB_content(rs.getString("b_content"));
				boardBean.setB_hashtag(rs.getString("b_hashtag"));
				boardBean.setB_suggest(rs.getInt("b_suggest"));
				lb.add(boardBean);
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
		return lb;
	}
	
	public BoardBean getBoard(int b_id)  {
		BoardBean boardBean=new BoardBean();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from board where b_id="+b_id;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				boardBean.setB_name(rs.getString("b_name"));
				boardBean.setB_name_hidden(rs.getString("b_name_hidden"));
				boardBean.setB_title(rs.getString("b_title"));
				boardBean.setB_content(rs.getString("b_content"));
				boardBean.setB_hashtag(rs.getString("b_hashtag"));
				boardBean.setB_suggest(rs.getInt("b_suggest"));
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
		return boardBean;
	}
	
	public int BoardDelete(int b_id,String cus_pwd) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql1="select b_name from board where b_id="+b_id;
		String sql2="select cus_pwd from customer where cus_id=?";
		String sql3="delete from board where b_id="+b_id;
		String sql4="delete from board_answer where b_id"+b_id;
		int re=0;
		int re2=0;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql1);
			rs=pstmt.executeQuery();
			String b_name="";
			if(rs.next()) {
				b_name=rs.getString("b_name");
			}
			pstmt=conn.prepareStatement(sql2);
			pstmt.setString(1, b_name);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(cus_pwd.equals(rs.getString("cus_pwd"))) {
					pstmt=conn.prepareStatement(sql3);
					re=pstmt.executeUpdate();
					pstmt=conn.prepareStatement(sql4);
					re2=pstmt.executeUpdate();				}
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
		
		return re*re2;
	}
	
	public int editBoard(BoardBean board) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="update board set b_title=?,b_content=?,b_name_hidden=?,b_hashtag=? where b_id="+board.getB_id();
		int re=0;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, HanConv.toKor(board.getB_title()));
			pstmt.setString(2, HanConv.toKor(board.getB_content()));
			pstmt.setString(3, board.getB_name_hidden());
			pstmt.setString(4, HanConv.toKor(board.getB_hashtag()));
			re=pstmt.executeUpdate();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) conn.close();
				if(pstmt!=null)pstmt.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}	
		return re;
	}
	public ArrayList<BoardBean> serchBoard(String category,String serch) {
		ArrayList<BoardBean> serchboard=new ArrayList<BoardBean>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from board where "+category+" like '%"+serch+"%'";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BoardBean boardBean=new BoardBean();
				boardBean.setB_ID(rs.getInt("b_id"));
				boardBean.setB_name(rs.getString("b_name"));
				boardBean.setB_name_hidden(rs.getString("b_name_hidden"));
				boardBean.setB_title(rs.getString("b_title"));
				boardBean.setB_content(rs.getString("b_content"));
				boardBean.setB_hashtag(rs.getString("b_hashtag"));
				boardBean.setB_suggest(rs.getInt("b_suggest"));
				serchboard.add(boardBean);
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
		return serchboard;
	}
}
