<%@ page contentType="text/html; charset=UTF-8"
	import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"
	import="java.sql.*, mybean.*, javax.naming.*,java.text.*, java.io.*"%>
<%
	request.setCharacterEncoding("utf-8");

	int maxsize = 5 * 1024 * 1024;
	
	ServletContext context = getServletContext();
	String realFolder = context.getRealPath("upload_Img");
    
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxsize, "utf-8", new DefaultFileRenamePolicy());
	
	String id = multi.getParameter("id");
	String pwd = multi.getParameter("pwd");
	String name = multi.getParameter("name");
	String birthday = multi.getParameter("birthday");
	String fileName=multi.getFilesystemName("fileName");

	if (id == "") {
		out.println("<script> alert('아이디를 입력하세요');history.back(); </script>");
	} else if (pwd == "") {
		out.println("<script> alert('비밀번호를 입력하세요');history.back(); </script>");
	} else if (name == "") {
		out.println("<script> alert('아름을 입력하세요');history.back(); </script>");
	} else if (birthday == "") {
		out.println("<script> alert('생일을 입력하세요');history.back(); </script>");
	}

	else {
		User_Info ui = new User_Info();
		ui.setId(id);
		ui.setPwd(pwd);
		ui.setName(name);
		ui.setBirthday(birthday);
		ui.setFileName(fileName);

		try {
			User_Info_DB db = new User_Info_DB();

			db.createAccount(ui);
			db.close();

		} catch (NamingException e) {
			out.print(e);
			return;
		} catch (SQLException e) {
			out.print(e);
			return;
		}

		response.sendRedirect("StoryBoard_Login.jsp");
	}
%>