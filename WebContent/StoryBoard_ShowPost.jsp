<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*, mybean.*, javax.naming.NamingException"%>
<%
	Class.forName("org.mariadb.jdbc.Driver");

	String DB_URL = "jdbc:mariadb://localhost:3306/snsboard?useSSL=false";
	String DB_USER = "admin";
	String DB_PASSWORD = "1234";

	String idx = request.getParameter("idx");
	String id=request.getParameter("id");
	int num = 0;

	Connection con = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		Content_Info_DB db = new Content_Info_DB();
		Content_Info ci = db.getPost(Integer.parseInt(idx));
		
		User_Info_DB db2=new User_Info_DB();
		User_Info ui=db2.getAccount(id);

		con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		stmt = con.createStatement();

		String query = "SELECT idx, id, date, comment FROM comment WHERE postIdx=?";

		pstmt = con.prepareStatement(query);
		pstmt.setInt(1, Integer.parseInt(idx));

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
	padding: 40px;
	margin-left: 30px
}

.story:after {
	ccontent: "";
	display: table;
	clear: both;
}

.commentbox {
	padding: 20px;
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
<script>
function checkDelete(idx, id){
	var a=confirm("삭제하시겠습니까?");
	if(a==true){
		location.href="StoryBoard_Delete_Post_do.jsp?idx="+idx+"&id="+id;
	}else{
		return;
	}
}

function updateComment(idx, postIdx){
	window.open("StoryBoard_ModifyComment.jsp?idx="+idx+"&postIdx="+postIdx,"updateForm","width=600, height=350, resizable=no, scrollbars=no");
}
</script>
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
			<div style="font-size: 20px; text-align: center; margin-top: 20px;"><%=ui.getName()%></div>
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
			<div style="margin-top: 40px;">
				<strong style="font-size: 45px;"><%=ci.getTitle()%></strong> <span
					style="float: right; margin-right: 40px; margin-top: 40px; font-size: 15px;">작성일시
					: <%=ci.getDate()%></span>
			</div>
			<div style="margin-top: 20px; padding: 20px;">
				조회수 :
				<%=ci.getReadNum()%><br> 추천수 :
				<%=ci.getLikeNum()%>
				<input type="button" style="float: right; margin-right: 40px"
					value="삭제" onclick="checkDelete(<%=idx%>, '<%=ci.getId()%>')"> <input
					type="button" style="float: right; margin-right: 10px;" value="수정"
					onclick="location.href='StoryBoard_Modify_Post.jsp?idx=<%=idx%>&id=<%=id%>'">

			</div>
			<img src="./upload_Img/<%=ci.getFileName()%>" width="900"
				height="500">
			<div style="margin-top: 20px;">
				<%=ci.getContent()%>
			</div>
			<br> <a
				href="StoryBoard_PostLike_do.jsp?postIdx=<%=idx%>&likeNum=<%=ci.getLikeNum()%>&id=<%=id%>">
				<i class="fa fa-thumbs-o-up" style="font-size: 30px;"></i>
			</a>&nbsp;<span style="font-size: 13px">좋아요</span> <br>
			<br>

			<div class="commentbox">
				<form
					action="StoryBoard_AddComment_do.jsp?idx=<%=idx%>&id=<%=ci.getId()%>"
					method="post">
					<input type="text" name="comment" id="comment"
						style="width: 800px; height: 60px;"><input type="submit"
						value="댓글 쓰기" style="height: 60px; margin-left: 10px">
				</form>
				<br>
				<%
					while (rs.next()) {
				%>
				<%=rs.getString("comment")%>
				<input type="button" value="삭제" style="float: right;"onclick="location.href='StoryBoard_DeleteComment_do.jsp?idx=<%=rs.getInt("idx")%>&postIdx=<%=idx%>&id=<%=id%>'">
				<input type="button" value="수정" style="float: right; margin-right:10px;"onclick="updateComment(<%=rs.getInt("idx")%>, <%=idx%>)"> 
				<span style="float: right; font-size: 13px; margin-right:10px"> 작성자 :<%=rs.getString("id")%>&nbsp;&nbsp;&nbsp;&nbsp;작성일시:<%=rs.getString("date")%></span>
				<br><br>

				<%
					num = num + 1;
						}
				%>
				<br>
				댓글수 :
				<%=num%>
			</div>
		</div>

	</div>

	<div class="footer">
		<b>End</b>
	</div>

</body>
</html>
<%
	Integer readNum = ci.getReadNum();
		String sql = "UPDATE post SET readNum=? WHERE idx=?";

		pstmt = con.prepareStatement(sql);

		pstmt.setInt(1, readNum + 1);
		pstmt.setInt(2, Integer.parseInt(idx));

		pstmt.executeUpdate();

		db2.close();
		db.close();
		rs.close();
		pstmt.close();
		stmt.close();
		con.close();
	} catch (SQLException e) {
		out.print(e);
		return;
	} catch (NamingException e) {
		out.print(e);
		return;
	}
%>
