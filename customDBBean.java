 package magicwepapp;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.NamingException;

public class customDBBean {

private static customDBBean instance;
    
    
    private customDBBean(){}
    public static customDBBean getInstance(){
        if(instance==null)
            instance=new customDBBean();
        return instance;
    }
    public Date stringToDate(customBean custom)
    {
        String year = custom.getBirthyy();
        String month = custom.getBirthmm();
        String day = custom.getBirthdd();
        
        Date birthday = Date.valueOf(year+"-"+month+"-"+day);
        
        return birthday;
        
    } 
    
    
    public void insertMember(customBean custom) throws SQLException
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            
            conn = DBconnection.getConnection();
            
            
            conn.setAutoCommit(false);
            
            StringBuffer sql = new StringBuffer();
            sql.append("insert into JSP_MEMBER values");
            sql.append("(?, ?, ?, ?, ?, ?, ?, ?, sysdate)");        
            stringToDate(custom);
            
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, custom.getId());
            pstmt.setString(2, custom.getPw());
            pstmt.setString(3, custom.getName());
            pstmt.setString(4, custom.getNickname());
            pstmt.setDate(5, stringToDate(custom));
            pstmt.setString(6, custom.getMail1()+"@"+custom.getMail2());
            pstmt.setString(7, custom.getPhone());
            pstmt.setString(8, custom.getAddress());
            
            
            pstmt.executeUpdate();
            
            conn.commit(); 
            
        } catch (ClassNotFoundException | NamingException | SQLException sqle) {
            
            conn.rollback(); 
            
            throw new RuntimeException(sqle.getMessage());
        } finally {
            
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }  
    } 
}



