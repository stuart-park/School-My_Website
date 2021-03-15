<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="mybean.*, java.sql.*, javax.naming.NamingException"%>
<%
    request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	
	try{
		User_Info_DB db=new User_Info_DB();
		User_Info ui=db.getAccount(id);
		
		if(pass.equals(ui.getPwd())){
			session.setAttribute("id", id);
			response.sendRedirect("StoryBoard_Main.jsp?id="+id);
		}
		else{
			out.println("<script>alert('비밀번호를 확인하세요'); history.back(); </script>");
		}
			
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>
<%
 db.close();
 }
	catch(SQLException e){
		out.println("<script>alert('아이디를 확인하세요'); history.back(); </script>");
	 return;
	 }
	catch(NamingException e){
	 out.print(e);
	 return;
	 }
%>