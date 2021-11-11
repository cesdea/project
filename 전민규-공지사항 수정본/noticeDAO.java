package notice;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;

import myUtil.HanConv;
import oracle.net.aso.p;


import notice.noticeBean;

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
            // 예외가 발생하것 같은 구문
            // 1단계 드라이버로더          // 2단계 디비연결
            con=getConnection();
            
            // 3단계 sql board테이블 모든글 가져오기(최근글이 맨처음에 나오게 정렬)
            String sql="select n_id, n_name, n_title, n_content, n_regdt from (select n_id, n_name, n_title, n_content, n_regdt, row_number() over(order by n_id desc) as rNum from notice) nb where rNum between ? and ? order by n_id desc";
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1, startRow-1);// startRow 시작행 포함하지 않아서 -1 
            pstmt.setInt(2, endRow);
            // 4단계 rs <= 실행 결과 저장
            rs=pstmt.executeQuery();
            // 5단계   nb < =  rs    nb => 배열한칸에 저장
            while(rs.next()) {
               noticeBean nb=new noticeBean();
               nb.setN_id(rs.getInt("n_id"));
               nb.setN_name(rs.getString("n_name"));
               nb.setN_title(rs.getString("n_title"));
               nb.setN_content(rs.getString("n_content"));
               nb.setN_regDt(rs.getTimestamp("n_regdt"));
               boardList.add(nb);
            }
         } catch (Exception e) {
            // 예외가 발생하면 처리하는 구문
            e.printStackTrace();
         }finally {
            // 예외상관없이 마무리작업 구문=> 기억장소 해제
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
            // 예외가 발생하것 같은 구문
            // 1단계 드라이버로더          // 2단계 디비연결
            con=getConnection();
            // 3단계 sql board테이블 
            String sql="select count(*) from notice";
            pstmt=con.prepareStatement(sql);
            // 4단계 rs <= 실행 결과 저장
            rs=pstmt.executeQuery();
            // 5단계     
            if(rs.next()) {
                  count=rs.getInt("count(*)");
            }
         } catch (Exception e) {
            // 예외가 발생하면 처리하는 구문
            e.printStackTrace();
         }finally {
            // 예외상관없이 마무리작업 구문=> 기억장소 해제
            if(rs!=null) try {rs.close();}catch(SQLException ex) {}
            if(pstmt!=null) try {pstmt.close();}catch(SQLException ex) {}
            if(con!=null) try{con.close();} catch(SQLException ex) {}
         }
         return count;
      }
      public int update(int n_id, String n_title, String n_content, String n_name) {
    	  String sql = "UPDATE NOTICE SET N_TITLE=?, N_CONTENT=?, N_NAME=?, WHERE N_ID=?";
    	  Connection conn = null;
    	  try {
    		  PreparedStatement pstmt = conn.prepareStatement(sql);
    		  pstmt.setString(1, n_title);
    		  pstmt.setString(2, n_content);
    		  pstmt.setString(3, n_name);
    		  pstmt.setInt(4, n_id);
    		  return pstmt.executeUpdate();
    	  }catch(Exception e) {
    		  e.printStackTrace();
    	  }
    	  return -1;
      }
      public int delete(int n_id) {
    	    String SQL = "UPDATE NOTICE SET N_Available=0 WHERE N_ID=?";
    	    Connection conn = null;
    	    try {
    		PreparedStatement pstmt = conn.prepareStatement(SQL); 
    		pstmt.setInt(1, n_id); //게시글 제목
    		return pstmt.executeUpdate();
    	    }catch(Exception e) {
    		e.printStackTrace();
    	    }
    	    return -1; //데이터베이스 오류발생
    	}
      public int insertNotice(noticeBean nb) {
  		Connection conn = null;
  		PreparedStatement pstmt = null;
  		PreparedStatement pstmt2 = null;
  		ResultSet rs = null;		
  		int re = -1;
  		int n_id = 1;
  		
  		try {
  			conn = getConnection();
  			
  			String sql2 = "select max(n_id) from notice";
  			pstmt = conn.prepareStatement(sql2);
  			rs = pstmt.executeQuery();
  			
  			if(rs.next()) {
  				n_id = rs.getInt(1) + 1;
  			}
  			
  			System.out.println("nb.getN_title()::::::"+nb.getN_title());
  			System.out.println("nb.getN_content()::::::::"+nb.getN_content());
  			System.out.println("nb.getN_name()::::::::::::"+nb.getN_name());
  			
  			String sql = "INSERT INTO NOTICE(n_id,n_title,n_content,n_name,n_regdt) VALUES ((SELECT NVL(MAX(N_ID),0)+1 FROM NOTICE),?,?,?,SYSDATE)";
  			pstmt2 = conn.prepareStatement(sql);
  			pstmt2.setString(1, HanConv.toKor(nb.getN_title()));
  			pstmt2.setString(2, HanConv.toKor(nb.getN_content()));
  			pstmt2.setString(3, HanConv.toKor(nb.getN_name()));
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
}