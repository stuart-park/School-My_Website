package mybean;

import java.sql.*;
import javax.naming.NamingException;
import mybean.DsCon;

public class Comment_Info_DB {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public Comment_Info_DB() throws SQLException, NamingException{
		con=DsCon.getConnection();
	}
	
	public void addComment(Comment_Info ci) throws SQLException{
		String sql="INSERT INTO comment(postIdx, id, date, comment) VALUES (?,?,?,?)";
		
		pstmt=con.prepareStatement(sql);
		
		pstmt.setInt(1, ci.getPostIdx());
		pstmt.setString(2, ci.getId());
		pstmt.setString(3, ci.getDate());
		pstmt.setString(4, ci.getComment());
		
		pstmt.executeUpdate();
	}
	
	public void updateComment(Comment_Info ci) throws SQLException{
		String sql="UPDATE comment SET date=?, comment=? WHERE idx=?";
		
		pstmt=con.prepareStatement(sql);
		
		pstmt.setString(1,  ci.getDate());
		pstmt.setString(2, ci.getComment());
		pstmt.setInt(3,  ci.getIdx());
		
		pstmt.executeUpdate();
	}
	
	public Comment_Info getComment(int idx) throws SQLException{
		String sql="SELECT postIdx, id, date, comment FROM comment WHERE idx=?";
		
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, idx);
		
		rs=pstmt.executeQuery();
		rs.next();
		
		Comment_Info ci=new Comment_Info();
		
		ci.setPostIdx(rs.getInt("postIdx"));
		ci.setId(rs.getString("id"));
		ci.setDate(rs.getString("date"));
		ci.setComment(rs.getString("comment"));
		
		return ci;
	}
	
	public void deleteComment(int idx) throws SQLException{
		String sql="DELETE FROM comment WHERE idx=?";
		
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, idx);
		
		pstmt.executeUpdate();
	}
	
	public void deletePostWithComment(int postIdx) throws SQLException{
		String sql="DELETE FROM comment WHERE postIdx=?";
		
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, postIdx);
		
		pstmt.executeUpdate();
	}
	
	public void close() throws SQLException{
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(con!=null) con.close();
	}
	
	
}
