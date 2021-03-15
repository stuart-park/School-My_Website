<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*"%>
<%

Class.forName("org.mariadb.jdbc.Driver");

String DB_URL = "jdbc:mariadb://localhost:3306/snsboard?useSSL=false";
String DB_USER = "admin";
String DB_PASSWORD = "1234";
request.setCharacterEncoding("utf-8");

String id=request.getParameter("id");
String idx=request.getParameter("postIdx");
String likeNum=request.getParameter("likeNum");


try{
	Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	
	String sql="UPDATE post SET likeNum=? WHERE idx=?";
	
	PreparedStatement pstmt=con.prepareStatement(sql);
	
	pstmt.setInt(1, Integer.parseInt(likeNum)+1);
	pstmt.setInt(2, Integer.parseInt(idx));
	
	pstmt.executeQuery();
	
	con.close();
	pstmt.close();
	
}catch(SQLException e){
	out.print(e);
	return;
}

response.sendRedirect("StoryBoard_ShowPost.jsp?idx=" + idx + "&id=" +id);
%>