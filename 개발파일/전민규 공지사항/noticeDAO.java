package notice;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import customer.CustomerBean;
import myUtil.HanConv;

public class noticeDAO {
	private static noticeDAO instance=new noticeDAO(); 
	
	public static noticeDAO getInstance() {
		return instance;
	}
	private String n_name;
	
	public Connection getConnection() throws Exception {
		Connection conn=null;
		String url="jdbc:oracle:thin:@localhost:1521:xe";	
		String user="c##stock";
		String password="1234";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn=DriverManager.getConnection(url, user, password);
		return conn;
	}
      
      public List getNoticeList(int startRow,int endRow) {
         Connection con=null;
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         List boardList=new ArrayList();
         try {
            
            con=getConnection();
            
            
            String sql="select n_id, n_title, n_name, n_content, n_regdt from (select n_id, n_title, n_name, n_content, n_regdt, row_number() over(order by n_id desc) as rNum from notice) nb where rNum between ? and ? order by n_id desc";
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1, startRow-1); 
            pstmt.setInt(2, endRow);
            
            rs=pstmt.executeQuery();
            
            while(rs.next()) {
               noticeBean nb=new noticeBean();
               nb.setN_id(rs.getInt("n_id"));
               nb.setN_title(rs.getString("n_title"));
               nb.setN_name(rs.getString("n_name"));
               nb.setN_content(rs.getString("n_content"));
               nb.setN_regDt(rs.getTimestamp("n_regdt"));
              
               boardList.add(nb);
            }
         } catch (Exception e) {
            
            e.printStackTrace();
         }finally {
            
            if(rs!=null) try {rs.close();}catch(SQLException ex) {}
            if(pstmt!=null) try {pstmt.close();}catch(SQLException ex) {}
            if(con!=null) try{con.close();} catch(SQLException ex) {}
         }
         return boardList;
      }
      
      
      public int getNoticeCount() {
         Connection con=null;
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         int count=0;
         try {
            con=getConnection();
            String sql="select count(*) from notice";
            pstmt=con.prepareStatement(sql);
            rs=pstmt.executeQuery();
            if(rs.next()) {
                  count=rs.getInt("count(*)");
            }
         } catch (Exception e) {
            e.printStackTrace();
         }finally {
            if(rs!=null) try {rs.close();}catch(SQLException ex) {}
            if(pstmt!=null) try {pstmt.close();}catch(SQLException ex) {}
            if(con!=null) try{con.close();} catch(SQLException ex) {}
         }
         return count;
      }
      
      public void noticeUpdate(int n_id,String title,String content) {
  		Connection conn=null;
  		PreparedStatement pstmt=null;
  		ResultSet rs=null;
  		String sql="";
  		noticeBean nb = new noticeBean();
  		
  		
  		try {
  			conn = getConnection();
  			
  			System.out.println("title:: "+ title);
  			System.out.println("content:: "+content);
  			
  			sql="update notice set n_title=?, n_content=? where n_id=?";
  			pstmt = conn.prepareStatement(sql);
  			pstmt.setString(1, HanConv.toKor(title));
  			pstmt.setString(2, HanConv.toKor(content));
  			pstmt.setInt(3, n_id);
  			pstmt.executeUpdate();
  			
  			
  		} catch (Exception e) {
  			e.printStackTrace();
  		}finally {
  			try {
  				if(rs != null) rs.close();
  				if(pstmt != null) pstmt.close();
  				if(conn != null) conn.close();
  			} catch (Exception e) {
  				e.printStackTrace();
  			}
  		}
  		
  	
  	}
  

  	
      public void deleteBoard(int n_id) {
  		Connection conn=null;
  		PreparedStatement pstmt=null;
  		ResultSet rs=null;
  		String sql="";
  		
  		try {
  			conn = getConnection();
  			
  			sql="delete notice where n_id=?";
  			pstmt = conn.prepareStatement(sql);
  			pstmt.setInt(1, n_id);
  			pstmt.executeUpdate();
  					
  				
  			
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
  	
  		
  	}
      public void insertNotice(noticeBean Nb) {
  		Connection conn = null;
  		PreparedStatement pstmt = null;
  		ResultSet rs = null;		
  		
  		try {
  			conn = getConnection();
  			
  	
  			
  			String sql = "INSERT INTO NOTICE(n_id,n_title,n_content,n_name,n_regDt) VALUES ((SELECT NVL(MAX(N_ID),0)+1 FROM NOTICE),?,?,?,SYSDATE)";
  			pstmt = conn.prepareStatement(sql);
  			pstmt.setString(1, HanConv.toKor(Nb.getN_title()));
  			pstmt.setString(2, HanConv.toKor(Nb.getN_content()));
  			pstmt.setString(3, HanConv.toKor(Nb.getN_name()));
  			pstmt.executeUpdate();
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
  		
  	}

      public noticeBean getNotice(int n_id) {
  		Connection conn=null;
  		PreparedStatement pstmt=null;
  		ResultSet rs=null;
  		String sql="";
  		noticeBean notice =null;
  		
  		try {
  			conn = getConnection();
  			
  				
  			sql="select * from notice where n_id=?";
  			pstmt = conn.prepareStatement(sql);
  			pstmt.setInt(1, n_id);
  			rs = pstmt.executeQuery();
  			
  			if (rs.next()) {
  				notice = new noticeBean();
  				notice.setN_id(rs.getInt(1));
  				notice.setN_name((rs.getString(2)));
  				notice.setN_title((rs.getString(3)));
  				notice.setN_content((rs.getString(4)));
  				notice.setN_regDt(rs.getTimestamp(5));
  				
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
  		
  		return notice;
  	}
      public int manCheck(String id, String pwd) throws Exception{
  		Connection conn=null;
  		PreparedStatement pstmt=null;
  		ResultSet rs=null;
  		
  		String sql = "SELECT MAN_PWD FROM manager where MAN_ID =?";
  		int re=-1;
  		
  		try {
  			conn = getConnection();
  			pstmt = conn.prepareStatement(sql);
  			pstmt.setString(1, id);
  			rs = pstmt.executeQuery();
  			String db_man_pwd;
  			
  			if (rs.next()) {
  				db_man_pwd = rs.getString("man_pwd");
  				if (db_man_pwd.equals(pwd)) {
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
  	
  	public CustomerBean getMember(String id) throws Exception{
  		Connection conn=null;
  		PreparedStatement pstmt=null;
  		ResultSet rs=null;
  		String sql="select * from CUSTOMER where cus_id=?";
  		CustomerBean member=null;
  		
  		try {
  			conn = getConnection();
  			pstmt = conn.prepareStatement(sql);
  			pstmt.setString(1, id);
  			rs = pstmt.executeQuery();
  			
  			if (rs.next()) {
  				member = new CustomerBean();
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
  	
  	public int customerCheck(String id, String pwd) throws Exception{
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
  				customer.setCus_registration_date(rs.getTimestamp("CUS_REGISTRATION_DATA"));
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
	
	
	public String cusidCheck(String s_name) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT cus_id FROM customer where cus_nickname =?";
		String cus_id="";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s_name);
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
      
      }

