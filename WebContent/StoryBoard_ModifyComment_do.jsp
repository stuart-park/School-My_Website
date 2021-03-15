<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.Date, java.text.*, mybean.*, java.sql.*, javax.naming.NamingException"%>
<%
	request.setCharacterEncoding("utf-8");
    
    String idx=request.getParameter("idx");
	String postIdx = request.getParameter("postIdx");
	String id = request.getParameter("id");
	String comment = request.getParameter("comment");

	Date d = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String date = sdf.format(d);

	Comment_Info ci = new Comment_Info();
     
	ci.setIdx(Integer.parseInt(idx));
	ci.setPostIdx(Integer.parseInt(postIdx));
	ci.setId(id);
	ci.setDate(date);
	ci.setComment(comment);

	try {
		Comment_Info_DB db = new Comment_Info_DB();

		db.updateComment(ci);
		db.close();
	} catch (NamingException e) {
		out.print(e);
		return;
	} catch (SQLException e) {
		out.print(e);
		return;
	}
	
	out.println("<script> window.opener.location.reload(); window.close(); </script>");
%>