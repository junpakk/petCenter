<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="org.apache.log4j.LogManager" %>    
<%@ page import="org.apache.log4j.Logger" %>    

<%@ page import="java.util.List" %>
<%@ page import="main.pc.member.vo.MemberVO" %>


<% request.setCharacterEncoding("UTF-8"); %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("mainPage.jsp 진입 >>> : ");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PET CENTER MAIN</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Seymour+One&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
	*{
/* 		font-family:'Noto Sans KR', sans-serif; */
		/*목록에 점 없애기*/
		font-family: 'Jua', sans-serif;
		list-style:none;
		/*링크에 색깔 밑줄없애기*/
		text-decoration:none;
		border-collapse:collapse;
		margin:0px;
		padding:0px;
		/*기본폰트색깔*/
		color:#000;		
	}		
	
	.header{
	/* 	background-image:url("../../img/contact.png"); */
		height: 165px;
 		position:sticky;
	  	background:white;
		grid-area:header;
		width: 100%;
		z-index: 9999;
		left: 0;
/* 		padding-top: 0px; */
  		top: -50px;
	}
	
	.upperWrap{
		background:#3db7cc;
	}
	
	.upperH{
			position:relative;
			width: 1200px;
			margin: 0 auto;
			height:40px;
			background:#3db7cc;
			}
			
	.upperH a{
		color: black;
		text-decoration: none;
		font-size: 18px;
/* 		font: italic small-caps bold; */
	}
			
			
	.lowerH{
/* 			position:fixed; */
			width: 1200px;
			margin: 0 auto;
			height:115px;
			background:white; 
/* 			padding-left: 100px;  */
/* 			padding-right: 30px */
			}
			
	.lowerH img{
		float: left;
		margin-left: 10px;
	}
	
	.menu{
		float: right;
	}
	
	.menu li{
			list-style: none;
			float: left;
	}
	
/* 	ul.tmenu > li{ */
/* 		list-style: none; */
/* 		padding-right: 100px; */
/* 		float: right; */
/* 	} */
	
	.menu a{
		line-height: 110px;
		color: black;
		display: block;
		padding: 0 15px;
		text-decoration: none;
		font-size: 30px;
/* 		font: italic small-caps bold; */
	}
	
	.side{
		background:#3db7cc;
		grid-area:side;
	}
	
	.main{
		background:#fff;
		width:100%;
		min-height:100%;
		text-align:center;
		grid-area:main;
	}

	.aside{
		background:#3db7cc;
		grid-area:aside;
	}			
	
	.footer{
		background:#3db7cc;
		grid-area:footer;
		text-align: center;
	}
	
	.dropdown1-content{
	  display : none;
	  position : absolute;
	  z-index : 1; /*다른 요소들보다 앞에 배치*/
	}
	
	.dropdown1:hover .dropdown1-content {
	  display: block;
	  background-color: white;
	}
	
	.dropdown1-content a:hover{
		background: #c9eef5;
	}
	
	.lowerH a:hover{
		color:#3db7cc;
	}

</style>
</head>
<body>
		<!-- header를 sitearea, topbar, wrapper, logoarea, toplogo,  -->
		<div class="header">
			<div class="upperWrap">
			<!-- 상단바와 내용 -->
			<div class="upperH">
	
<%
	String mnum = "";
	String mid = "";
	Object objMnum = session.getAttribute("KNUM");
	Object objMid = session.getAttribute("KID");
	
	if (objMnum != null) {
		mnum = (String)objMnum;
		mid = (String)objMid;
%>
					<ul class="tmenu">
						<li align="right" style="padding-right:1.5%; padding-top:5px">
							<a style="color:white;"><%= mid %> 님 안녕하세요!!</a> &nbsp; &nbsp;
							<a href="logout.pc" style="color:white;">로그아웃 |</a>
							<% String link =  "memSelect.pc?mnum=" + mnum;%>
							<a href="<%= link %>" style="color:white;">내정보</a>
						</li>    
<% 
	}else{
%>
						<li align="right" style="padding-right:1.5%; padding-top:5px">
							<a href="loginForm.pc" style="color:white;">로그인 |</a>
							<a href="memInsertForm.pc" style="color:white;">회원가입</a>
						</li>  
					</ul>
<%
	}
%>		
			</div>
			</div>
			<div class="lowerH">
				<a href="mainPage.pc"><img src="/petCenter/img/logo.png" align="left" width="110" height="110"></a>
				<nav>
					<ul class="menu">
						<li><a href="noticeSelectAll.pc">공지사항</a></li>
						<li><a href="productSelectAll.pc?pcategory=21">쇼핑몰</a></li>
						<li>
							<div class="dropdown1">
								<a class="dropBtn" href="#">지도서비스</a>
								<div class="dropdown1-content">
									<hr style="border: 1px solid #3db7cc;">
										<a href="keySearch.pc">동물병원찾기</a>
										<a href="walkHelper.pc">산책도우미</a>
										<a href="walkHistory.pc">지난산책로</a>
								</div>
							</div>
						</li>
						<li><a href="fairSelectAll.pc">박람회</a></li>
						<li>
							<div class="dropdown1">
								<a class="dropBtn" href="#">게시판</a>
								<div class="dropdown1-content">
									<hr style="border: 1px solid #3db7cc;">
									<a href="comSelAll.pc">커뮤니티</a>
									<a href="tipSelAll.pc">팁게시판</a>
									<a href="photoSelAll.pc">사진게시판</a>
								</div>
							</div>
						</li>
					</ul>
				</nav>
			</div>
			<hr>
		</div><!-- end of header -->
</body>
</html>