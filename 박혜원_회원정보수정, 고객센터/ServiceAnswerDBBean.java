package portfolio.serviceAnswer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;


public class ServiceAnswerDBBean {
	public static ServiceAnswerDBBean instance = new ServiceAnswerDBBean();
	
	public static ServiceAnswerDBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	/*특정 글번호의 고객센터 답변 글 불러오기*/
	public ServiceAnswerBean getServiceAnswer(int s_a_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		ServiceAnswerBean service_answer = new ServiceAnswerBean();
		
		try {
			conn = getConnection();
			sql = "SELECT * FROM service_answer WHERE s_a_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, s_a_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				service_answer.setS_a_id(rs.getInt("s_a_id"));
				service_answer.setS_a_ref(rs.getInt("s_a_ref"));
				service_answer.setS_a_name(rs.getString("s_a_name"));
				service_answer.setS_a_content(rs.getString("s_a_content"));
				
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
		return service_answer;
	}
	
	/*고객센터 답변 글 목록*/	
	public ArrayList<ServiceAnswerBean> listServiceAnswer(String pageNumber){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		ArrayList<ServiceAnswerBean> serviceAnswerList = new ArrayList<ServiceAnswerBean>();
		try {
			conn = getConnection();
			
			String sql="select * from service_answer order by s_a_id asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ServiceAnswerBean service_answer = new ServiceAnswerBean();
				
				service_answer.setS_a_id(rs.getInt("s_a_id"));
				service_answer.setS_a_ref(rs.getInt("s_a_ref"));
				service_answer.setS_a_name(rs.getString("s_a_name"));
				service_answer.setS_a_content(rs.getString("s_a_content"));
				serviceAnswerList.add(service_answer);
					
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
		
		return serviceAnswerList;
	}
	
	/*고객센터 답변 글 등록*/
	public int insertServiceAnswer(ServiceAnswerBean serviceAnswer) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;		
		int re = -1;
		int number = 1;
		
		try {
			conn = getConnection();
			
			String sql = "select max(s_a_ref) from service_answer";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				number = rs.getInt(1) + 1;
			}
			
			String sql2 = "INSERT INTO service_answer VALUES (?,?,?,?)";
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, serviceAnswer.getS_a_id());
			pstmt2.setInt(2, number);
			pstmt2.setString(3, HanConv.toKor(serviceAnswer.getS_a_name()));
			pstmt2.setString(4, HanConv.toKor(serviceAnswer.getS_a_content()));
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
	
	/*고객센터 답변 글 수정*/
	public int editServiceAnswer(ServiceAnswerBean service_answer) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;
		
		try {
			conn = getConnection();
			sql="update service_answer set s_a_name=?, s_a_content=? where s_a_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, HanConv.toKor(service_answer.getS_a_name()));
			pstmt.setString(2, HanConv.toKor(service_answer.getS_a_content()));
			pstmt.setInt(3, service_answer.getS_a_id());
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
	
	/*고객센터 답변 글 삭제*/
	public int deleteServiceAnswer(int s_a_id, String man_pwd) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt3=null;
		ResultSet rs=null;
		ResultSet rs2=null;
		String sql="";
		int re=-1;
		
		try {
			conn = getConnection();
			sql="select man_pwd from manager where man_pwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, man_pwd);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
					sql="delete Service_answer where s_a_id=?";
					pstmt2 = conn.prepareStatement(sql);
					pstmt2.setInt(1, s_a_id);
					pstmt2.executeUpdate();
					re=1;
			}else {
				sql="select cus_pwd from customer where cus_pwd=?";
				pstmt3 = conn.prepareStatement(sql);
				pstmt3.setString(1, man_pwd);
				rs2 = pstmt3.executeQuery();
				
				if (rs2.next()) {
						sql="delete Service_answer where s_a_id=?";
						pstmt2 = conn.prepareStatement(sql);
						pstmt2.setInt(1, s_a_id);
						pstmt2.executeUpdate();
						re=1;
				}
			}
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
}
