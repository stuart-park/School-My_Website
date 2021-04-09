# SNS Blog
## Overview

## File Description
+ StoryBoard.Login.jsp: 초기 페이지로 로그인 및 회원가입 기능 구현
+ StoryBoard.MakeAccount.jsp : 회원가입 페이지로 아이디, 비밀번호, 생일, 이름, 프로필 사진을 입력 받음
+ StoryBoard.MakeAccount_do.jsp : 회원DB에 회원 정보를 저장
+ StoryBoard.Login_ok.jsp : 로그인 정보가 DB상의 정보와 일치하는지 확인하고 일치하면 메인 페이지로 접속
+ StoryBoard.Main.jsp : 로그인 후 메인 페이지
+ StoryBoard.SearchPost.jsp : 검색어를 입력했을 때 게시글 제목이나 내용이 해당 검색어를 포함하고 있으면 해당 게시글들이 표시되는 페이지
+ StoryBoard.MakePost.jsp : 게시글을 작성하는 페이지로 게시글의 제목, 게시판, 사진, 내용을 입력받음
+ StoryBoard.MakePost_do.jsp : 작성한 게시글을 DB에 저장
+ StoryBoard.ShowPost.jsp : 메인 페이지에서 게시글의 제목을 클릭했을 때 해당 게시글을 확인할 수 있는 페이지
+ StoryBoard.PostLike_do.jsp : 게시글에서 게시글을 추천했을 때 추천수를 올려 다시 DB에 저장하는 파일
+ StoryBoard.Modify_Post.jsp : 게시글을 수정하기 위한 페이지로 수정버튼을 눌렀을 때 DB에서 해당 게시글에 대한 정보를 가지고 와 수정이 가능
+ StoryBoard.Modify_Post_do.jsp : 수정된 정보들을 DB에 다시 저장
+ StoryBoard.Delete_Post_do.jsp : 게시글을 삭제하는 페이지로 게시글을 삭제할건지 확인하고 확인을 누르면 해당 게시글을 삭제
+ StoryBoard.AddComment_do.jsp: 해당 게시글에 댓글을 추가하는 페이지로 해당 게시글에 대한 댓글을 DB에 저장함.
+ StoryBoard.ModifyComment.jsp : 댓글을 수정하기 위한 페이지로 수정 버튼을 클릭하면 팝업창이 나오면서 댓글을 수정하고 팝업창이 종료되면서 부모창을 새로고침
+ StoryBoard.ModifyComment_do.jsp : 수정된 댓글을 DB에 저장
+ StoryBoard.DeleteComment_do.jsp : 댓글을 삭제하는 페이지로 DB에서 해당 댓글 삭제


## Execution Results
+ **Initial Page**<br><br>
    <img src="images/LoginPage.jpg" width="750px">
<br>

+ **Make Account Page**<br><br>
    <img src="images/MakeAccount.jpg" width="750px">
    + 회원가입을 위한 ID, 비밀번호, 이름, 생일, 프로필 사진을 입력받고 이를 DB에 저장
<br>

+ **Main Page**<br><br>
    <img src="images/MainPage.jpg" width="750px">
    + 메인 화면으로 프로필과 게시글 내용이 표시됨
    + 메인 화면의 헤더 부분과 메뉴부분에서 왼쪽에 집모양의 버튼을 클릭하면 현재 화면인 메인 화면으로 돌아옴<br><br>
    
    <img src="images/ShowMore.jpg" width="750px"><br>
    + 게시글 내용이 100자 이상이면 더보기로 표시되고 더보기를 클릭하면 위와 같이 더보기가 접기로 바뀌면서 글이 펼처짐<br><br>

    <img src="images/SearchPost.jpg" width="750px"><br>
    + ‘Hello’ 라는 키워드로 검색했을 때 표시되는 게시물
<br>

+ **Make Post Page**
    <img src="images/MakePost.jpg" width="750px">
    + 게시글 작성 페이지로 제목, 게시판, 사진, 게시글 내용을 입력 받고 DB에 저장<br><br>
    
    <img src="images/AddPost.jpg" width="750px"><br>
    + 작성한 게시글이 Main Page에서 표시되는 것을 볼 수 있음
<br>

+ **Show Post Page**
    <img src="images/ShowPost.jpg" width="750px">
    + Main Page에서 게시글 제목을 눌렀을 때 해당 게시물의 내용들이 표시
    + 제목과 작성 일시 그 밑으로는 조회수와 추천수가 표시되고 옆에는 게시글을 수정하고 삭제하는 버튼이 표시됨
    + 사진과 글 내용이 표시되고 밑에 엄지 아이콘으로 추천하는 버튼이 표시. 엄지 버튼 클릭시 추천수가 증가
    + 글 하단에는 댓글이 표시되고 댓글을 작성하는 부분과 작성된 내용, 댓글 수 가 표시됨<br><br>

    <img src="images/LikePost.jpg" width="750px"><br>
    + 엄지 아이콘을 클릭했을 때 추천수가 증가한 것을 확인할 수 있음
<br>

+ **Modify Post Page**
    <img src="images/ModifyPost.jpg" width="750px">
    + 게시글 수정 페이지로 게시글에서 수정 버튼을 클릭했을 때 DB에서 해당 게시글의 내용을 가지고 옴<br><br>
   
    <img src="images/ModifyPostConfirm.jpg" width="750px"><br>
    + 게시글 수정후의 모습으로 작성일시도 갱신이 되었음을 알 수 있음
<br>

+ **Delete Post**
    <img src="images/DeletePost.jpg" width="750px">
    + 해당 게시물을 삭제하기 위해 삭제 버튼을 클릭<br><br>
    
    <img src="images/DeleteConfirmation.jpg" width="750px"><br>
    + 삭제여부를 묻는 알림 창이 나오고 확인을 클릭<br><br>
    
    <img src="images/DeleteConfirm.jpg" width="750px"><br>
    + 확인을 클릭하면 해당 게시물이 Main Page에서 삭제되었음을 알 수 있음
<br>

+ **Add Comment**
    <img src="images/AddComent.jpg" width="750px">
    + ‘Nice!’라는 댓글을 입력 후 댓글쓰기 버튼을 클릭<br><br>
    
    <img src="images/ConfirmComment.jpg" width="750px"><br>
    + 댓글과 작성시간, 아이디가 입력되었음을 확인할 수 있음
<br>

+ **Modify Commet**
    <img src="images/ModifyComment.jpg" width="750px">
    + 댓글 수정 버튼을 클릭했을 때 팝업창이 나타나면서 수정할 댓글을 DB에서 불러옴<br><br>
    
    <img src="images/ModifyCommentConfirm.jpg" width="750px"><br>
    + Good!을 Very Good로 수정 후의 모습으로 작성시간도 갱신되었음을 알 수 있음
<br>

+ **Delete Comment**
    <img src="images/DeleteConmment.jpg" width="750px">
    + 위에서 ‘Nice’댓글을 삭제하고 난 뒤의 모습으로 해당 댓글이 삭제되었음을 확인할 수 있음
