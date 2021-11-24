package customer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import manager.ManagerDBBean;
import myUtil.*;

public class CustomerDBBean {

	public Timestamp ts = new Timestamp(System.currentTimeMillis());
	
	private static CustomerDBBean instance = new CustomerDBBean();
	
	public static CustomerDBBean getInstance() {
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
	/*회원등록*/
	public int insertMember(CustomerBean member) throws Exception{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="insert into customer values(?,?,?,?,?,?,?)";
		
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
			pstmt.setTimestamp(7, ts);
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
	
	/*회원 여부 확인*/
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
	/*아이디로 회원 정보 가져오기*/
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
	/*회원정보 수정*/
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
	
	private int code;
	public int sendEmailCode(String email) {
		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		String host = "smtp.google.com"; 
		String user = "aprkvnem"; 
		String password = "ikvqomkobhsoaujq";  
		code=(int)(Math.random()*1000000);
		Properties prop = new Properties(); 
		prop.put("mail.smtp.host", "smtp.gmail.com"); 
		prop.put("mail.smtp.port", 465); 
		prop.put("mail.smtp.auth", "true"); 
		prop.put("mail.smtp.ssl.enable", "true"); 
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		try{
		    Session session = Session.getDefaultInstance(prop, 
		    new Authenticator() {
		    protected PasswordAuthentication getPasswordAuthentication() {
		    return new PasswordAuthentication(user, password);
		}});
		  Message msg = new MimeMessage(session);

		  //보내는사람 받는사람 설정
		  msg.setFrom(new InternetAddress(user+"@gamil.com"));
		  msg.setRecipients(Message.RecipientType.TO,InternetAddress.parse(email,false));
		  msg.setSubject("테스트");
		  msg.setText(String.valueOf(code));
		  msg.setSentDate(new Date());
		  Transport.send(msg);
		  System.out.println("발신성공!");
		}catch (MessagingException error){ 
			System.out.println("에러가 발생했습니다: " + error);
		}
		return code;
	}
	
	
	public ArrayList<String> nicknameToId(String nickname) {
		ArrayList<String> idarr=new ArrayList<String>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select cus_id from customer where cus_nickname=?";
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				idarr.add(rs.getString(1));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
				if(rs!= null) rs.close();				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return idarr;
	}
	
	public String idToNickname(String id) {
		String nickname="";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select cus_nickname from customer where cus_id=?";
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				nickname=rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
				if(rs!= null) rs.close();				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return nickname;
	}
	
	public int deleteCustomer(String id) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int re=-1;
		ManagerDBBean md=ManagerDBBean.getInstance();
		if(md.checkManager(id)) {
			return re=0;
		}
		
		String sql="delete from customer where cus_id=?";
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			re=pstmt.executeUpdate();
		}catch (Exception e) {
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
	public ArrayList<CustomerBean> allCustom() {
		ArrayList<CustomerBean> all=new ArrayList<CustomerBean>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from customer order by cus_registration_data";
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				CustomerBean customer=new CustomerBean();
				customer.setCus_id(rs.getString("cus_id"));
				customer.setCus_pwd(rs.getString("cus_pwd"));
				customer.setCus_nickname(rs.getString("cus_nickname"));
				customer.setCus_email(rs.getString("cus_email"));
				customer.setCus_registration_date(rs.getTimestamp("cus_registration_data"));
				customer.setCus_num(rs.getInt("cus_num"));
				customer.setCus_stop_date(rs.getTimestamp("cus_stop_date"));
				all.add(customer);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
				if(rs!= null) rs.close();				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return all;
	}
	

	public int updateStop(String stop_id,Timestamp stop) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int re=-1;
		
		String sql="update customer set cus_stop_date=? where cus_id=?";
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setTimestamp(1, stop);
			pstmt.setString(2, stop_id);
			re=pstmt.executeUpdate();
		}catch (Exception e) {
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
	
	public boolean customerStop(String id) {
		boolean result=true;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select cus_stop_date from customer where cus_id=?";
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(new Timestamp(System.currentTimeMillis()).before(rs.getTimestamp("cus_stop_date"))) {
					result=false;
				}else {
					result=true;
				}
			}else {
				result=true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();				
				if(rs!= null) rs.close();				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}
	public String findId(String nickname, String email) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String id="";
		String sql="SELECT RPAD(SUBSTR(cus_id,1 , 3),Length(cus_id), '*') FROM customer WHERE cus_nickname = ? AND cus_email = ?";
		
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, nickname);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				id = rs.getString(1);
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
		
		return id;
	}
	
	public String findPw(String id, String nickname, String email) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;

		String pw="";
		String sql="SELECT cus_pwd FROM customer WHERE cus_id =? AND cus_nickname = ? AND cus_email = ?";
		
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2,nickname);
			pstmt.setString(3, email);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pw = rs.getString("cus_pwd");
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
		
		return pw;
	}
}
