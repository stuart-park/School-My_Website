<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*, mybean.*, javax.naming.*"%>
<%
	request.setCharacterEncoding("utf-8");
   
    String id=request.getParameter("id");
	String idx = request.getParameter("idx");
	String postIdx = request.getParameter("postIdx");

	try {
		Comment_Info_DB db = new Comment_Info_DB();

		db.deleteComment(Integer.parseInt(idx));
		db.close();
	} catch (SQLException e) {
		out.print(e);
		return;
	} catch (NamingException e) {
		out.print(e);
		return;
	}

	response.sendRedirect("StoryBoard_ShowPost.jsp?idx=" + postIdx+"&id="+id);
%>