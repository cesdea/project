package qna;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.BoardBean;
import customer.CustomerBean;
import customer.CustomerDBBean;
import myUtil.*;

public class QnADBBean {
	private static QnADBBean instance=new QnADBBean();
	
	public static QnADBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Connection conn=null;
		String url="jdbc:oracle:thin:@localhost:1521:xe";	
		String user="stock";
		String password="1234";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn=DriverManager.getConnection(url, user, password);
		return conn;
	}
	///////// 글등록 메소드
	public int insertBoard(QnABean board) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		String sql="";
		String sql2="";
		int number=1;
		int re=-1;
		
		int id = board.getQ_id();
		int ref = board.getQ_ref();
		int step = board.getQ_step();
		int level = board.getQ_level();
		
		try {
			conn = getConnection();
			
			//현재 레코드 중에서 가장 큰 글 번호를 얻어낸다.(번호+1)
			sql = "select max(q_id) from qna";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				number = rs.getInt(1) + 1;
			}
			
			/*System.out.println("@@@### id ===>"+id);*/
			
			if (id != 0) {
				sql="update qna set q_step=q_step+1 where q_ref=? and q_step > ?";
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
			
			sql="insert into qna(Q_ID, Q_NAME, Q_TITLE, Q_CONTENT, Q_PWD, Q_DATE, Q_IP, Q_REF, Q_STEP, Q_LEVEL,Q_UID) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, HanConv.toKor(board.getQ_name()));
			pstmt.setString(3, HanConv.toKor(board.getQ_title()));
			pstmt.setString(4, HanConv.toKor(board.getQ_content()));
			pstmt.setString(5, board.getQ_pwd());
			pstmt.setTimestamp(6, board.getQ_date());
			pstmt.setString(7, board.getQ_ip());
			pstmt.setInt(8, ref);
			pstmt.setInt(9, step);
			pstmt.setInt(10, level);
			pstmt.setString(11, HanConv.toKor(board.getQ_uid()));
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
			/*	System.out.println("@@@### pageNumber ===>"+pageNumber);*/
				
				QnABean.pageNum = Integer.parseInt(pageNumber);
				absolutePage = (QnABean.pageNum-1) * QnABean.pageSize+1;
			}

			String sql="select * from qna order by q_ref desc, q_step asc";
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				rs.absolute(absolutePage);
				int count=0;
				
				while (count < QnABean.pageSize) {
					QnABean board=new QnABean();
					board.setQ_id(rs.getInt(1));
					board.setQ_name(rs.getString(2));
					board.setQ_title(rs.getString(3));
					board.setQ_content(rs.getString(4));
					board.setQ_pwd(rs.getString(5));
					board.setQ_date(rs.getTimestamp(6));
					board.setQ_hit(rs.getInt(7));
					board.setQ_ip(rs.getString(8));
					board.setQ_ref(rs.getInt(9));
					board.setQ_step(rs.getInt(10));
					board.setQ_level(rs.getInt(11));
					board.setQ_uid(rs.getString(12));
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
				sql="update qna set q_hit=q_hit+1 where q_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bid);
				pstmt.executeUpdate();
				pstmt.close();
			}
			
			sql="select * from qna where q_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				board = new QnABean();
				board.setQ_id(rs.getInt(1));
				board.setQ_name(rs.getString(2));
				board.setQ_title(rs.getString(3));
				board.setQ_content(rs.getString(4));
				board.setQ_pwd(rs.getString(5));
				board.setQ_date(rs.getTimestamp(6));
				board.setQ_hit(rs.getInt(7));
				board.setQ_ip(rs.getString(8));
				board.setQ_ref(rs.getInt(9));
				board.setQ_step(rs.getInt(10));
				board.setQ_level(rs.getInt(11));
				board.setQ_uid(rs.getString(12));
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
	

	///////// 글 삭제 메소드
	public int deleteBoard(int q_id, String q_pwd, String cus_id) throws SQLException {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;
		String pwd="";
		
		if(!manidCheck(cus_id).equals(cus_id)) {
			// 삭제하는 당사자가 관리자가 아니면 올바른 비밀번호 입력해야 삭제가능 
		try {
			conn = getConnection();
 
			sql="select q_pwd from qna where q_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, q_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pwd = rs.getString(1);
				
				if (!pwd.equals(q_pwd)) {
					re=0;
				}else {
					                                       //원래 게시글을 삭제하면 답글들도 같이 삭제됨 
					sql="delete from qna where q_id in (select q_id from qna start with q_id=? connect by NOCYCLE prior q_id = q_ref)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, q_id);
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
		    // 관리자가 삭제시 무작위번호 입력해도 삭제가능
		}  else  {
			try {
				conn = getConnection();
	 
				sql="select q_pwd from qna where q_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, q_id);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					pwd = rs.getString(1);
					
					if (!pwd.equals(q_pwd)) {
						sql="delete from qna where q_id in (select q_id from qna start with q_id=? connect by NOCYCLE prior q_id = q_ref)";
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, q_id);
						pstmt.executeUpdate();
						re=1;
					}else {
						                                    
						re=0;
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
	
	
	//////// 글 수정 메소드
	public int editBoard(QnABean board) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;
		String pwd="";
		
		try {
			conn = getConnection();
			sql="select q_pwd from qna where q_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getQ_id());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pwd = rs.getString(1);
				
				if (!pwd.equals(board.getQ_pwd())) {
					re=0;
				}else {
				
					sql="update qna set q_name=?, q_title=?, q_content=? where q_id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, HanConv.toKor(board.getQ_name()));
					pstmt.setString(2, HanConv.toKor(board.getQ_title()));
					pstmt.setString(3, HanConv.toKor(board.getQ_content()));
					pstmt.setInt(4, board.getQ_id());
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
	
	/*관리자 계정 여부 확인*/
	public String manidCheck(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT man_id FROM manager where man_id =?";
		String man_id="";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				man_id = rs.getString(1);
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
		
		return man_id;
	}
	
	/*사용자 계정 동일 여부 확인*/
	public String cusidCheck(String q_name) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT cus_id FROM customer where cus_nickname =?";
		String cus_id="";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q_name);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				cus_id = rs.getString(1);
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
		
		return cus_id;
	}
	
	//검색
		public ArrayList<QnABean> serchQna(String serch, boolean answer) throws Exception {
			ArrayList<QnABean> serchqna=new ArrayList<QnABean>();
			CustomerDBBean customer=CustomerDBBean.getInstance();
			CustomerBean c=customer.getCustomer(serch);
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="";
			if(!answer) {
				sql="select * from qna where q_name=? and q_level=0";
			}else {
				sql="select * from qna where q_name=? and q_level>0";
			}
			
			try {
				conn=getConnection();
				ArrayList<String> arrid=null;
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, c.getCus_nickname());
				rs=pstmt.executeQuery();
				while(rs.next()) {
					QnABean qnABean=new QnABean();
					qnABean.setQ_id(rs.getInt("q_id"));
					qnABean.setQ_ref(rs.getInt("q_ref"));
					qnABean.setQ_name(rs.getString("q_name"));
					qnABean.setQ_title(rs.getString("q_title"));
					qnABean.setQ_content(rs.getString("q_content"));
					qnABean.setQ_date(rs.getTimestamp("q_date"));
					serchqna.add(qnABean);
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
			return serchqna;
		}
		
}



















