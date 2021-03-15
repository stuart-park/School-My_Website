<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"
	import="java.sql.*, java.io.*, java.util.Date, java.text.*, mybean.*, javax.naming.*"%>
<%
	request.setCharacterEncoding("utf-8");
	Class.forName("org.mariadb.jdbc.Driver");
	

	String DB_URL = "jdbc:mariadb://localhost:3306/snsboard?useSSL=false";
	String DB_USER = "admin";
	String DB_PASSWORD = "1234";

	Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;

	ServletContext context = getServletContext();
	String realFolder = context.getRealPath("upload_Img");

	int maxsize = 1024 * 1024 * 5;

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxsize, "utf-8",
			new DefaultFileRenamePolicy());
	
	String id=request.getParameter("id");
	int idx = Integer.parseInt(multi.getParameter("idx"));
	
	String title = multi.getParameter("title");
	String type = multi.getParameter("contentType");
	String content = multi.getParameter("content");

	Date d = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String date = sdf.format(d);

	String fileName = multi.getFilesystemName("fileName");

	if (fileName != null) {
		sql = "SELECT fileName FROM post WHERE idx=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, idx);

		rs = pstmt.executeQuery();
		rs.next();
		String oldFileName = rs.getString("fileName");

		File oldFile = new File(realFolder + "\\" + oldFileName);
		oldFile.delete();

		sql = "UPDATE post SET title=?, postDate=?, type=?, content=?, fileName=? WHERE idx=?";

		pstmt = con.prepareStatement(sql);

		pstmt.setString(1, title);
		pstmt.setString(2, date);
		pstmt.setString(3, type);
		pstmt.setString(4, content);
		pstmt.setString(5, fileName);
		pstmt.setInt(6, idx);

		pstmt.executeUpdate();
		
		rs.close();
		pstmt.close();
		con.close();
		

	} else {
		Content_Info_DB db = new Content_Info_DB();
		Content_Info ci = new Content_Info();

		ci.setIdx(idx);
		ci.setTitle(title);
		ci.setDate(date);
		ci.setType(type);
		ci.setContent(content);
		ci.setFileName(fileName);

		db.updatePost(ci);
		db.close();
	}
	
	response.sendRedirect("StoryBoard_ShowPost.jsp?idx="+ idx+ "&id="+id);
%>