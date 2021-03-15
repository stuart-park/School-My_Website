<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	background-image: url('./Images/background.jpg');
}

.makeAccountBox {
	margin: auto;
	margin-top:250px;
	width: 300px;
	height: 250px;
}
</style>
<meta charset="UTF-8">
<title>Make Account</title>
</head>
<body>
	<div class="makeAccountBox">
	<p style="font-size:40px; text-align:center">회원 가입하기 </p>
		<form action="StoryBoard_MakeAccount_do.jsp" method="post" enctype="multipart/form-data">
			Id : <input type="text" name="id" maxlength="10" size="8"><br>
			Password : <input type="text" name="pwd"><br>
			Name : <input type="text" name="name" maxlength="12" size="12"><br>
			Birthday : <input type="text" name="birthday"><br>
			프로필 사진 : <input type="file" id="myPicture" name="fileName"><br><br><br>
			<input type="submit" value="회원가입" style="border:0px; width:270px ;height:30px; background-color:lightblue">
		</form>
	</div>
</body>
</html>