<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	background-image: url('./Images/background.jpg');
}

.loginBox {
	margin: auto;
	width: 200px;
	height: 100px;
}

.accountBox {
	margin: auto;
	width: 200px;
	height: 100px;
}

.footer {
	padding: 20px;
	text-align: right;
	margin-top: 130px;
}
</style>
<meta charset="UTF-8">
<title>Welcome_Login</title>
</head>
<body>

	<p style="text-align: center; font-size: 80px; font-style: italic;">Welcome</p>

	<div style="margin: auto;">
		<div class="loginBox">
			<form action="StoryBoard_Login_ok.jsp" method="post">
				<label for="id"></label> <input type="text" style="width: 170px;"
					id="id" name="id" placeholder="Enter ID" required><br>
				<label for="pass"></label><input type="password"
					style="width: 170px;" name="pass" id="pass"
					placeholder="Enter Password" required> <br>
				<input type="submit" value="로그인"
					style="width: 180px; background-color: lightblue; border: 0px;">
			</form>
			<br> <br> <br>
		</div>
		<div class="accountBox">
			계정이 없으신가요? <input type="button" value="회원가입  하기"
				style="width: 175px; height:20px; border: 0px"
				onclick="location.href='StoryBoard_MakeAccount.jsp'">
		</div>
	</div>

	<div class="footer">
		<p>Made By</p>
		<p>Stuart Park</p>
	</div>

</body>
</html>
