<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.*, mybean.*, javax.naming.NamingException"%>
<%
	request.setCharacterEncoding("utf-8");

	String idx = request.getParameter("idx");
	String id=request.getParameter("id");

	try {
		Content_Info_DB db = new Content_Info_DB();
		Content_Info ci = db.getPost(Integer.parseInt(idx));
		
		User_Info_DB db2=new User_Info_DB();
		User_Info ui=db2.getAccount(id);
%>
<!DOCTYPE html>
<html>
<head>
<style>
* {
	box-sizing: border-box;
}

body {
	padding: 10px;
	background-image: url('./Images/background.jpg');
}

.header {
	padding: 70px;
	text-align: center;
	background: gray;
}

.header h1 {
	font-size: 40px;
}

.profilebox {
	background-color: #e6e6e6;
	border-radius: 10px;
	margin-top: 100px;
	margin-left: 20px;
	padding: 20px;
	float: left;
	width: 25%;
	padding: 20px
}

.storybox {
	width: 70%;
	float: left;
	padding: 30px;
	margin-top: 50px;
	margin-left: 30px;
	background: #e6e6e6;
	border-radius: 30px;
	margin-top: 50px;
}

.text {
	font-size: 15px;
	text-align: center;
	margin-top: 20px;
}

.text:hover {
	background-color: #ddd;
	color: black;
}

.row:after {
	content: "";
	display: table;
	clear: both;
}

.putstory {
	width: 800px;
	height: 300px;
	border-radius: 10px;
}

.footer {
	background-color: gray;
	padding: 20px;
	text-align: center;
	margin-top: 20px;
}

img.myImage {
	width: 150px;
	height: 150px;
	border-radius: 20px;
	margin-left: 100px;
}

form.example input[type=text] {
	padding: 10px;
	font-size: 17px;
	border: 1px solid grey;
	float: left;
	width: 80%;
	background: #f1f1f1;
}

form.example button {
	float: left;
	width: 20%;
	padding: 10px;
	background: #333333;
	color: white;
	font-size: 17px;
	border: 1px solid grey;
	border-left: none;
	cursor: pointer;
}

form.example button:hover {
	background: #0b7dda;
}

form.example::after {
	content: "";
	clear: both;
	display: table;
}
</style>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1">
<title>StoryBoard Main</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<body>
	<div class="header" onclick="location.href='StoryBoard_Main.jsp?id=<%=id%>'">
		<h1>My StoryBoard</h1>
	</div>

	<div class="w3-bar w3-light-grey w3-border w3-large">
		<a href="StoryBoard_Main.jsp?id=<%=id%>" class="w3-bar-item w3-button"><i
			class="fa fa-home"></i></a>
		<form class="example" action="StoryBoard_SearchPost.jsp"
			style="float: right; max-width: 300px">
			<input type="text" placeholder="Search.." name="search">
			<button type="submit">
				<i class="fa fa-search"></i>
			</button>
		</form>
	</div>

	<div class="row">
		<div class="profilebox">
			<img src="./upload_Img/<%=ui.getFileName() %>" alt="My Blank Profile"
				class="myImage"> <br>
			<div style="font-size: 20px; text-align: center; margin-top: 20px;"><%=ci.getId()%></div>
			<br>
			<!--  
		<div class="text">게시판1</div>
		<div class="text">게시판2</div>
		<div class="text">게시판3</div>
		<br>
		<div class="text">게시판 생성</div>
		-->
			<div class="text">
				<a href="StoryBoard_MakePost.jsp?id=<%=ci.getId()%>">게시글 생성</a>
			</div>
			<div class="text" style="margin-top: 80px">
				<a href="StoryBoard_Login.jsp">로그아웃</a>
			</div>
		</div>



		<div class="storybox">
			<div style="text-align: center; font-size: 40px;">게시글 수정</div>
			<form action="StoryBoard_Modify_Post_do.jsp?idx=<%=idx%>&id=<%=id%>"
				method="post" enctype="multipart/form-data">
				<div style="margin-top: 30px;">
					<strong>게시글 제목&nbsp;&nbsp;&nbsp;</strong> <input type="text"
						name="title" value="<%=ci.getTitle()%>" style="width: 600px;">
				</div>
				<div style="margin-top: 20px;">
					<strong>게시판 선택&nbsp;&nbsp;&nbsp;</strong><select name="contentType"
						class="inputBoxStyle">
						<option value="게시판 1">게시판 1</option>
						<option value="게시판 2">게시판 2</option>
						<option value="게시판 3">게시판 3</option>
					</select>
				</div>
				<div style="margin-top: 20px;">
					<strong>사진 선택 &nbsp;&nbsp;&nbsp;</strong><input type="file"
						id="myPicture" name="fileName">
				</div>
				<div style="margin-top: 20px;">
					<strong>게시글 내용 작성</strong><br><br>
					<textarea id="content" name="content" class="putstory"> <%=ci.getContent()%></textarea>
				</div>
				<br> <input class="buttonstyle" style="margin-right: 10px;"
					type="submit" value="저장"> <input class="buttonstyle"
					type="reset" value="취소">
			</form>
		</div>
	</div>

	<div class="footer">
		<b>End</b>
	</div>

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