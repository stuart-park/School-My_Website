# My WebSite
## Overview

## Description
+ StoryBoard_Login.jsp (시작 페이지): 맨 처음 화면으로 로그인을 하는 기능과 회원가입을 하는 기능 구현
+ StoryBoard_MakeAccount.jsp : 회원가입을 하는 페이지로 아이디, 비밀번호, 생일, 이름, 프로필 사진을 입력 받음
+ StoryBoard_MakeAccount_do.jsp : 회원DB에 회원 정보를 저장하는 프로그램
+ StoryBoard_Login_ok.jsp : 로그인 정보가 DB상의 정보와 일치하는지 확인하고 일치하면 메인 페이지로 접속
+ StoryBoard_Main.jsp : 로그인 후 초기 페이지로 헤더에는 게시글의 검색 기능을 구현하였고 왼쪽에는 회원의 프로필 사진, 이름, 게시글 작성 기능을 구현. 또한 오른쪽에는 게시된 글들이 표시되고 각 글에는 제목, 작성시간, 사진, 내용이 표시. 만약 내용이 100자 이상이면 더보기가 표시되도록 구현.
+ StoryBoard_SearchPost.jsp : 검색어를 입력했을 때 게시글 제목이나 내용이 해당 검색어를 포함하고 있으면 해당 게시글들이 표시되는 페이지
+ StoryBoard_MakePost.jsp : 게시글을 작성하는 페이지로 게시글의 제목, 게시판, 사진, 내용을 입력받음.
+ StoryBoard_MakePost_do.jsp : 작성한 게시글의 내용들을 DB에 저장
+ StoryBoard_ShowPost.jsp : 게시글의 제목을 클릭했을 때 해당 게시글을 확인할 수 있는 페이지. 게시글의 제목, 작성시간, 추천수, 조회수, 내용, 사진이 표시됨. 게시글에 대한 내용 밑에는 댓글을 작성할 수 있도록 기능 구현. 댓글과 게시글 모두 수정과 삭제가 가능하도록 버튼을 위치시킴.
+ StoryBoard_PostLike_do.jsp : 게시글에서 게시글을 추천했을 때 추천수를 올려 다시 DB에 저장하는 파일
+ StoryBoard_Modify_Post.jsp : 게시글을 수정하기 위한 페이지로 수정버튼을 눌렀을 때 해당 게시글에 대한 정보를 가지고 오고 수정이 가능하도록 설계.
+ StoryBoard_Modify_Post_do.jsp : 수정된 정보들을 DB에 다시 저장하기 위한 파일
+ StoryBoard_Delete_Post_do.jsp : 게시글을 삭제하는 페이지로 게시글을 정말로 삭제할껀지 확인하고 확인을 누르면 해당 게시글을 삭제시킴. 해당게시글을 삭제시키면 해당 댓글도 같이 삭제되도록 설계.
+ StoryBoard_AddComment_do.jsp: 해당 게시글에 댓글을 추가하는 페이지로 해당 게시글에 대한 댓글을 DB에 저장함.
+ StoryBoard_ModifyComment.jsp : 댓글을 수정하기 위한 페이지로 수정 버튼을 클릭하면 팝업창이 나오면서 댓글을 수정하고 다시 팝업창이 종료되면서 부모창을 새로고침 함.
+ StoryBoard_ModifyComment_do.jsp : 수정된 댓글을 DB에 저장하도록 함.
+ StoryBoard_DeleteComment_do.jsp : 댓글을 삭제하는 페이지로 DB에서 해당 댓글 삭제.
## Project Review
