package notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

public class noticeDAO {
	 private static noticeDAO instance = new noticeDAO();
	   
	   public static noticeDAO getInstance() {
	      return instance;
	   }
	   
	   public Connection getConnection() throws Exception {
	      Context ctx = new InitialContext();
	      DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
	      return ds.getConnection();
	   }
	   
	   public ArrayList<noticeBean> getBoardList(int startRow,int pageSize) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			ArrayList<noticeBean> noticeList=new ArrayList<noticeBean>();
			try {
				con=getConnection();
				
				String sql="select * from board order by num desc limit ?,?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, startRow-1);//  
				pstmt.setInt(2, pageSize);
				
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					noticeBean nb=new noticeBean();
					nb.setId(rs.getInt("id"));
					nb.setName(rs.getString("name"));
					nb.setTitle(rs.getString("title"));
					nb.setContent(rs.getString("content"));
					nb.setRegDt(rs.getString("regDt"));
					
					noticeList.add(nb);
				}
			} catch (Exception e) {
				
				e.printStackTrace();
			}finally {
				
				if(rs!=null) try {rs.close();}catch(SQLException ex) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException ex) {}
				if(con!=null) try{con.close();} catch(SQLException ex) {}
			}
			return noticeList;
		}
}