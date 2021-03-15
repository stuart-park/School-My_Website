package mybean;

import java.sql.*;
import javax.naming.NamingException;
import mybean.DsCon;


public class Content_Info_DB {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public Content_Info_DB() throws SQLException, NamingException {
		con = DsCon.getConnection();
	}

    public void makePost(Content_Info ci) throws SQLException{
	    String sql="INSERT INTO post(id, title, postDate, type, content, fileName, readNum, likeNum) VALUES(?,?,?,?,?,?,?,?)";
	    
	    pstmt=con.prepareStatement(sql);
	    
	    pstmt.setString(1, ci.getId());
	    pstmt.setString(2, ci.getTitle());
	    pstmt.setString(3, ci.getDate());
	    pstmt.setString(4, ci.getType());
	    pstmt.setString(5, ci.getContent());
	    pstmt.setString(6, ci.getFileName());
	    pstmt.setInt(7,  ci.getReadNum());
	    pstmt.setInt(8, ci.getLikeNum());
	     
	    pstmt.executeUpdate();
    }
    
     public void updatePost(Content_Info ci) throws SQLException{
    	String sql="UPDATE post SET title=?, postDate=?, type=?, content=? WHERE idx=?";
    	 
    	pstmt=con.prepareStatement(sql);
    	 
    	pstmt.setString(1, ci.getTitle());
 	    pstmt.setString(2, ci.getDate());
 	    pstmt.setString(3, ci.getType());
 	    pstmt.setString(4, ci.getContent());
 	    pstmt.setInt(5, ci.getIdx());
    	 
    	 pstmt.executeUpdate();
     }
     
     public Content_Info getPost(int idx) throws SQLException{
    	 String sql="SELECT id, title, postDate, type, content, fileName, readNum, likeNum FROM post WHERE idx=?";
    	 
    	 pstmt=con.prepareStatement(sql);
    	 pstmt.setInt(1, idx);
    	 
    	 rs=pstmt.executeQuery();
    	 rs.next();
    	 
    	 Content_Info ci=new Content_Info();
    	 ci.setId(rs.getString("id"));
    	 ci.setTitle(rs.getString("title"));
    	 ci.setDate(rs.getString("postDate"));
    	 ci.setType(rs.getString("type"));
    	 ci.setContent(rs.getString("content"));
    	 ci.setFileName(rs.getString("fileName"));
    	 ci.setReadNum(rs.getInt("readNum"));
    	 ci.setLikeNum(rs.getInt("likeNum"));
    	  
    	 return ci;
     }
     
     public void deletePost(int idx) throws SQLException{
    	 String sql="DELETE FROM post WHERE idx=?";
    	 
    	 pstmt=con.prepareStatement(sql);
    	 pstmt.setInt(1, idx);
    	 
    	 pstmt.executeUpdate();
     }
     
     public void close() throws SQLException{
    	 if(rs!=null) rs.close();
    	 if(pstmt!=null) pstmt.close();
    	 if(con!=null) con.close();
     }
}
