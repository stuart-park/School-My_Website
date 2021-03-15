<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*, mybean.*, javax.naming.NamingException"%>
<%
	request.setCharacterEncoding("utf-8");

	String idx = request.getParameter("idx");
	String postIdx = request.getParameter("postIdx");

	try {
		Comment_Info_DB db = new Comment_Info_DB();
		Comment_Info ci = db.getComment(Integer.parseInt(idx));
%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	padding: 20px;
	background: #e6e6e6;
} 
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="StoryBoard_ModifyComment_do.jsp?idx=<%=idx %>&postIdx=<%=postIdx%>&id=<%=ci.getId() %>" method="post">
댓글수정: <input type="text" name="comment" value="<%=ci.getComment()%>">
<input type="submit" value="수정하기">
</form>
</body>
</html>
<%
	db.close();
	} catch (SQLException e) {
		out.print(e);
		return;
	} catch (NamingException e) {
		out.print(e);
		return;
	}
%>