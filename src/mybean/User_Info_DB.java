package mybean;

import java.sql.*;
import javax.naming.NamingException;
import mybean.DsCon;

public class User_Info_DB {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public User_Info_DB() throws SQLException, NamingException{
		con=DsCon.getConnection();
	}
	
	public void createAccount(User_Info ui) throws SQLException{
		String sql="INSERT INTO account(id, pwd, name, birthday, fileName) VALUES (?,?,?,?,?)";
		
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, ui.getId());
		pstmt.setString(2, ui.getPwd());
		pstmt.setString(3, ui.getName());
		pstmt.setString(4, ui.getBirthday());
		pstmt.setString(5, ui.getFileName());
		
		pstmt.executeUpdate();
	}
	
	public User_Info getAccount(String id) throws SQLException{
		String sql="SELECT id, pwd, name, birthday, fileName FROM account WHERE id=?";
		
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, id);
		
		rs=pstmt.executeQuery();
		
		rs.next();
		
		User_Info ui=new User_Info();
		ui.setId(rs.getString("id"));
		ui.setPwd(rs.getString("pwd"));
		ui.setName(rs.getString("Name"));
		ui.setBirthday(rs.getString("Birthday"));
		ui.setFileName(rs.getString("fileName"));
		
		return ui;
	}
	
	public void close() throws SQLException{
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(con!=null) con.close();
	}

}
