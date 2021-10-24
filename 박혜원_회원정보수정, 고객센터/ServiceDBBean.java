package portfolio.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;

public class ServiceDBBean {
	public static ServiceDBBean instance = new ServiceDBBean();
	
	public static ServiceDBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	/*특정 글번호의 고객센터 글 불러오기*/
	public ServiceBean getService(int s_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		ServiceBean service = new ServiceBean();
		
		try {
			conn = getConnection();
			sql = "SELECT * FROM service WHERE s_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, s_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				service.setS_id(rs.getInt("s_id"));
				service.setS_content(rs.getString("s_content"));
				service.setS_name(rs.getString("s_name"));
				
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
		return service;
	}
	/*고객센터 글 목록*/	
	public ArrayList<ServiceBean> listService(String pageNumber){
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		ResultSet pageSet=null;
		
		ArrayList<ServiceBean> serviceList = new ArrayList<ServiceBean>();
		
		int absolutePage=1;
		int dbcount=0;
		
		try {
			conn = getConnection();
			
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pageSet = stmt.executeQuery("select count(*) from service");
			
			if (pageSet.next()) {
				dbcount = pageSet.getInt(1);
				pageSet.close();
			}
			
			if (dbcount % ServiceBean.pageSize == 0) {
				ServiceBean.pageCount = dbcount / ServiceBean.pageSize;
			} else {
				ServiceBean.pageCount = dbcount / ServiceBean.pageSize + 1;
			}
		
			if (pageNumber != null) {
				System.out.println("@@@### pageNumber ===>"+pageNumber);
				
				ServiceBean.pageNum = Integer.parseInt(pageNumber);
				absolutePage = (ServiceBean.pageNum-1) * ServiceBean.pageSize+1;
			}
			
			String sql="SELECT * FROM service ORDER BY s_id DESC";
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				rs.absolute(absolutePage);
				int count=0;
				
				while (count < ServiceBean.pageSize) {
					ServiceBean service = new ServiceBean();
					service.setS_id(rs.getInt("s_id"));
					service.setS_content(rs.getString("s_content"));
					service.setS_name(rs.getString("s_name"));
					serviceList.add(service);
					
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
		
		return serviceList;
	}
	
	/*고객센터 전체 글 개수 */
	public int countService() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM service";
		int countNum=0;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				countNum = rs.getInt(1);
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
		
		return countNum;
	}
	
	/*관리자 계정 여부 확인*/
	public String manidCheck() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT man_id FROM manager";
		String man_id="";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
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
	
	/*고객센터 글 등록*/
	public int insertService(ServiceBean service) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;		
		int re = -1;
		int number = 1;
		
		try {
			conn = getConnection();
			
			String sql2 = "select max(s_id) from service";
			pstmt = conn.prepareStatement(sql2);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				number = rs.getInt(1) + 1;
			}
			
			String sql = "INSERT INTO service VALUES (?,?,?)";
			pstmt2 = conn.prepareStatement(sql);
			pstmt2.setInt(1, number);
			pstmt2.setString(2, HanConv.toKor(service.getS_content()));
			pstmt2.setString(3, HanConv.toKor(service.getS_name()));
			pstmt2.executeUpdate();
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt2 != null) pstmt2.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return re;
	}
	
	/*고객센터 글 수정*/
	public int editService(ServiceBean service) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;
		
		try {
			conn = getConnection();
			sql="update service set s_name=?, s_content=? where s_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, HanConv.toKor(service.getS_name()));
			pstmt.setString(2, HanConv.toKor(service.getS_content()));
			pstmt.setInt(3, service.getS_id());
			pstmt.executeUpdate();
			re=1;
			
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

	/*고객센터 글 삭제*/
	public int deleteService(int s_id, String man_pwd) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt3=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;
		
		try {
			conn = getConnection();
			sql="select man_pwd from manager where man_pwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, man_pwd);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
					sql="delete Service where s_id=?";
					pstmt2 = conn.prepareStatement(sql);
					pstmt2.setInt(1, s_id);
					pstmt2.executeUpdate();

					sql="delete Service_answer where s_a_ref=?";
					pstmt3 = conn.prepareStatement(sql);
					pstmt3.setInt(1, s_id);
					pstmt3.executeUpdate();
					re=1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt3 != null) pstmt3.close();
				if(pstmt2 != null) pstmt2.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return re;
	}
	
}
