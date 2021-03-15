<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"
	import="java.sql.*, mybean.*, javax.naming.*, java.util.*,java.util.Date, java.text.*, java.io.*"%>
<%
	request.setCharacterEncoding("utf-8");

	int maxsize = 5 * 1024 * 1024;
	
	String id = request.getParameter("id");

	ServletContext context = getServletContext();
	String realFolder = context.getRealPath("upload_Img");

	try {
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxsize, "utf-8", new DefaultFileRenamePolicy());
		
		
		String title = multi.getParameter("title");
		String type = multi.getParameter("contentType");
		String content = multi.getParameter("content");
		

		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(d);
		
		String fileName=multi.getFilesystemName("fileName");

		Content_Info ci = new Content_Info();
		
		ci.setId(id);
		ci.setTitle(title);
		ci.setDate(date);
		ci.setType(type);
		ci.setContent(content);
		ci.setFileName(fileName);
		ci.setReadNum(0);
		ci.setLikeNum(0);

		Content_Info_DB db = new Content_Info_DB();

		db.makePost(ci);
		db.close();
		
	}catch (IOException e){
		out.print(e);
		return;
	}catch (NamingException e) {
		out.print(e);
		return;
	}

	response.sendRedirect("StoryBoard_Main.jsp?id=" + id);
%>