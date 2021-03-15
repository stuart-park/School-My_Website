<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*,javax.naming.*, mybean.*"%>
<%
	request.setCharacterEncoding("utf-8");

	String search = request.getParameter("search");
	String id = (String) session.getAttribute("id");

	Class.forName("org.mariadb.jdbc.Driver");

	String DB_URL = "jdbc:mariadb://localhost:3306/snsboard?useSSL=false";
	String DB_USER = "admin";
	String DB_PASSWORD = "1234";

	Connection con = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		User_Info_DB db = new User_Info_DB();
		User_Info ui = db.getAccount(id);

		con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		stmt = con.createStatement();

		String query = "SELECT idx, id, title, postDate, content, fileName FROM post WHERE title LIKE ? OR content LIKE ?";

		pstmt = con.prepareStatement(query);
		pstmt.setString(1, "%" + search + "%");
		pstmt.setString(2, "%" + search + "%");

		rs = pstmt.executeQuery();
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
	padding-left: 20px;
	margin-left: 30px
}

.story {
	border-radius: 30px;
	background: #e6e6e6;
	margin-top: 20px;
	padding: 30px;
}

.story:after {
	ccontent: "";
	display: table;
	clear: both;
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
			<img src="./upload_Img/<%=ui.getFileName()%>" alt="My Blank Profile"
				class="myImage"> <br>
			<div class="text" style="font-size: 20px;"><%=ui.getName()%></div>
			<br>
			<!--  
		<div class="text">게시판1</div>
		<div class="text">게시판2</div>
		<div class="text">게시판3</div>
		<br>
		<div class="text">게시판 생성</div>
		-->
			<div class="text">
				<a href="StoryBoard_MakePost.jsp">게시글 생성</a>
			</div>
			<div class="text" style="margin-top: 80px">
				<a href="StoryBoard_Login.jsp">로그아웃</a>
			</div>
		</div>


		<
		<div class="storybox">
			<%
				while (rs.next()) {
			%>
			<div class="story">
				<span style="font-size: 40px"
					onclick="location.href='StoryBoard_ShowPost.jsp?idx=<%=rs.getInt("idx")%>&id=<%=ui.getId()%>'">
					<%=rs.getString("title")%><span style="font-size: 12px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<%=rs.getString("postDate")%></span> <span
					style="font-size: 15px; float: right">작성자 : <%=rs.getString("id")%></span>
				</span><br>
				<br>
				<img src="./upload_Img/<%=rs.getString("fileName")%>" width="300"
					height="200">
				<%
					if (rs.getString("content").length() > 100) {
				%>
				<div>
					<a href=#none id="show"
						onclick="if(hide.style.display=='none') {hide.style.display=''; show.innerText='접기'} else{hide.style.display='none'; show.innerText='더보기'}">더보기</a>
					<div id="hide" style="display: none">
						<p><%=rs.getString("content")%></p>
					</div>
				</div>
				<%
					} else {
				%>
				<p><%=rs.getString("content")%></p>

				<%
					}
				%>
			</div>

			<%
				}
			%>
		</div>
	</div>

	<div class="footer">
		<b>End</b>
	</div>
	<%
		db.close();
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			out.print(e);
			return;
		}
	%>

</body>
</html>