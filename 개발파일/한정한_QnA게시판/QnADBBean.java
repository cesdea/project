package magic.QnA;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import myUtil.*;

public class QnADBBean {
	private static QnADBBean instance=new QnADBBean();
	
	public static QnADBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/stock");
		return ds.getConnection();
	}
	
	public int insertBoard(QnABean board) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		String sql="";
		String sql2="";
		int number=1;
		int re=-1;
		
		int id = board.getB_id();
		int ref = board.getB_ref();
		int step = board.getB_step();
		int level = board.getB_level();
		
		try {
			conn = getConnection();
			
			//현재 레코드 중에서 가장 큰 글 번호를 얻어낸다.(번호+1)
			sql = "select max(b_id) from qna";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				number = rs.getInt(1) + 1;
			}
			
			System.out.println("@@@### id ===>"+id);
			
			if (id != 0) {
				sql="update qna set b_step=b_step+1 where b_ref=? and b_step > ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, step);
				pstmt.executeUpdate();
				step=step+1;
				level=level+1;
			} else {
				ref=number;
				step=0;
				level=0;
			}
			
			sql="insert into qna(B_ID, B_NAME, B_EMAIL, B_TITLE, B_CONTENT, B_PWD, B_DATE, B_IP, B_REF, B_STEP, B_LEVEL) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, HanConv.toKor(board.getB_name()));
			pstmt.setString(3, board.getB_email());
			pstmt.setString(4, HanConv.toKor(board.getB_title()));
			pstmt.setString(5, HanConv.toKor(board.getB_content()));
			pstmt.setString(6, board.getB_pwd());
			pstmt.setTimestamp(7, board.getB_date());
			pstmt.setString(8, board.getB_ip());
			pstmt.setInt(9, ref);
			pstmt.setInt(10, step);
			pstmt.setInt(11, level);
			pstmt.executeUpdate();
			
			re=1;
		} catch (Exception e) {
			e.printStackTrace();
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
	
	public ArrayList<QnABean> listBoard(String pageNumber){
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		ResultSet pageSet=null;
		
		ArrayList<QnABean> boardList = new ArrayList<QnABean>();
		
		int absolutePage=1;
		int dbcount=0;
		
		try {
			conn = getConnection();
			
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pageSet = stmt.executeQuery("select count(*) from qna");
			
			if (pageSet.next()) {
				dbcount = pageSet.getInt(1);
				pageSet.close();
			}
			
			if (dbcount % QnABean.pageSize == 0) {
				QnABean.pageCount = dbcount / QnABean.pageSize;
			} else {
				QnABean.pageCount = dbcount / QnABean.pageSize + 1;
			}
		
			if (pageNumber != null) {
				System.out.println("@@@### pageNumber ===>"+pageNumber);////dsadsad
				
				QnABean.pageNum = Integer.parseInt(pageNumber);
				absolutePage = (QnABean.pageNum-1) * QnABean.pageSize+1;
			}

			String sql="select * from qna order by b_ref desc, b_step asc";
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				rs.absolute(absolutePage);
				int count=0;
				
				while (count < QnABean.pageSize) {
					QnABean board=new QnABean();
					board.setB_id(rs.getInt(1));
					board.setB_name(HanConv.toKor(rs.getString(2)));
					board.setB_email(rs.getString(3));
					board.setB_title(rs.getString(4));
					board.setB_content(rs.getString(5));
					board.setB_pwd(rs.getString(6));
					board.setB_date(rs.getTimestamp(7));
					board.setB_hit(rs.getInt(8));
					board.setB_ip(rs.getString(9));
					board.setB_ref(rs.getInt(10));
					board.setB_step(rs.getInt(11));
					board.setB_level(rs.getInt(12));
					
					boardList.add(board);
					
					if (rs.isLast()) {
						break;
					}else {
						rs.next();
					}
					
					count++;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return boardList;
	}
	

	public QnABean getBoard(int bid, boolean hitadd) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		QnABean board=null;
		
		try {
			conn = getConnection();
			
			if (hitadd == true) {
				sql="update qna set b_hit=b_hit+1 where b_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bid);
				pstmt.executeUpdate();
				pstmt.close();
			}
			
			sql="select * from qna where b_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				board = new QnABean();
				board.setB_id(rs.getInt(1));
				board.setB_name(HanConv.toKor(rs.getString(2)));
				board.setB_email(rs.getString(3));
				board.setB_title(rs.getString(4));
				board.setB_content(rs.getString(5));
				board.setB_pwd(rs.getString(6));
				board.setB_date(rs.getTimestamp(7));
				board.setB_hit(rs.getInt(8));
				board.setB_ip(rs.getString(9));
				board.setB_ref(rs.getInt(10));
				board.setB_step(rs.getInt(11));
				board.setB_level(rs.getInt(12));
			}
		} catch (Exception e) {
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
		
		return board;
	}
	
	public int deleteBoard(int b_id, String b_pwd) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;
		String pwd="";
		
		try {
			conn = getConnection();
			sql="select b_pwd from qna where b_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pwd = rs.getString(1);
				
				if (!pwd.equals(b_pwd)) {
					re=0;
				}else {
					sql="delete qna where b_id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, b_id);
					pstmt.executeUpdate();
					re=1;
				}
			}
		} catch (Exception e) {
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
	
	public int editBoard(QnABean board) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;
		String pwd="";
		
		try {
			conn = getConnection();
			sql="select b_pwd from qna where b_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getB_id());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pwd = rs.getString(1);
				
				if (!pwd.equals(board.getB_pwd())) {
					re=0;
				}else {
				
					sql="update qna set b_name=?, b_email=?, b_title=?, b_content=? where b_id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, HanConv.toKor(board.getB_name()));
					pstmt.setString(2, board.getB_email());
					pstmt.setString(3, HanConv.toKor(board.getB_title()));
					pstmt.setString(4, HanConv.toKor(board.getB_content()));
					pstmt.setInt(5, board.getB_id());
					pstmt.executeUpdate();
					re=1;
				}
			}
		} catch (Exception e) {
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
	
}



















