<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*, mybean.*, javax.naming.*, java.util.Date, java.text.*"%>

<%
	request.setCharacterEncoding("utf-8");

	String postIdx = request.getParameter("idx");
	String id = request.getParameter("id");
	String comment = request.getParameter("comment");

	if (comment == "") {
		out.println("<script> alert('댓글을 입력하세요');history.back(); </script>");
	} 
	else {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(d);

		Comment_Info ci = new Comment_Info();

		ci.setPostIdx(Integer.parseInt(postIdx));
		ci.setId(id);
		ci.setDate(date);
		ci.setComment(comment);

		try {
			Comment_Info_DB db = new Comment_Info_DB();

			db.addComment(ci);
			db.close();
		} catch (NamingException e) {
			out.print(e);
			return;
		} catch (SQLException e) {
			out.print(e);
			return;
		}

		response.sendRedirect("StoryBoard_ShowPost.jsp?idx=" + postIdx+"&id="+id);
	}
%>