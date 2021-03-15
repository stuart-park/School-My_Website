<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="javax.naming.*, java.sql.*, mybean.*, java.io.*"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");

	try {
		String idx = request.getParameter("idx");

		Class.forName("org.mariadb.jdbc.Driver");

		String DB_URL = "jdbc:mariadb://localhost:3306/snsboard?useSSL=false";
		String DB_USER = "admin";
		String DB_PASSWORD = "1234";

		Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

		String sql = "SELECT fileName FROM post WHERE idx=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(idx));
		ResultSet rs = pstmt.executeQuery();
		rs.next();

		String fileName = rs.getString("fileName");

		ServletContext context = getServletContext();
		String realFolder = context.getRealPath("upload_img");

		File file = new File(realFolder + "\\" + fileName);
		file.delete();

		Content_Info_DB db = new Content_Info_DB();
		db.deletePost(Integer.parseInt(idx));
		db.close();

		Comment_Info_DB db2 = new Comment_Info_DB();
		db2.deletePostWithComment(Integer.parseInt(idx));
		db2.close();

		rs.close();
		pstmt.close();
		con.close();

	} catch (SQLException e) {
		out.print(e);
		return;
	} catch (NamingException e) {
		out.print(e);
		return;
	}

	response.sendRedirect("StoryBoard_Main.jsp?id="+id);
%>