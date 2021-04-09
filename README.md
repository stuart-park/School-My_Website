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
+ 로그인 화면
![image](images/LoginPage.jpg)
+ 회원가입하기
![image](images/MakeAccount.jpg)
+ 로그인 후 화면
![image](images/MainPage.jpg)
+ 더보기 기능
![image](images/ShowMore.jpg)
+ 게시글 검색
![image](images/SearchPost.jpg)
+ 게시글 작성
![image](images/MakePost.jpg)
![image](images/AddPost.jpg)
+ 게시글 보기
![image](images/ShowPost.jpg)
+ 추천하기
![image](images/LikePost.jpg)
+ 게시글 수정
![image](images/ModifyPost.jpg)
![image](images/ModifyPostConfirm.jpg)
+ 게시글 삭제
![image](images/DeletePost.jpg)
![image](images/DeleteConfirmation.jpg)
![image](images/DeleteConfirm.jpg)
+ 댓글 입력
![image](images/AddComent.jpg)
![image](images/ConfirmComment.jpg)
+ 댓글 수정
![image](images/ModifyComment.jpg)
![image](images/ModifyCommentConfirm.jpg)
+ 댓글 삭제
![image](images/DeleteConmment.jpg)
