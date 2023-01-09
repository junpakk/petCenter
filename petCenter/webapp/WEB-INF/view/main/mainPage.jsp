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
<!-- 		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"> -->
<!-- 		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script> -->
<!-- 		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
<!-- 		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>		 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">


		$(document).ready(function(){	 

				//박람회 전체보기
				$("#allfair").on("click", function(){
					location.href="fairSelectAll.pc";
					});
				
				//박람회 첫번째
				$("#fairSel").on("click", function(){
					location.href="fairSelect.pc";
					});

				
				//박람회 나머지
				
				$("#fairnone").on("click", function(){
					alert("사전등록은 한달 전부터 가능합니다. ");
					});
			});
</script>
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

	.container1{
		position: relative;
	
		display:grid;
		grid-template-columns:1fr 1200px 1fr;
		grid-template-rows:150px 1fr 218px;
		grid-template-areas:
			"header		header		header"
			"side		main		aside" 
			"footer		footer		footer";
	}

	.container1 > div{
		justify-items:center;
		align-items:center;
/* 		min-height : 100%;  */
	}				
	
	.header{
	/* 	background-image:url("../../img/contact.png"); */
		height: 165px;
 		position:sticky;
 	  	background:white;
/* 		background:#3db7cc; */
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
			height:50px;
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
/* 		background:white; */
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
/*  		background:white; */
		grid-area:aside;
	}			
	
	.footer{
		background:#3db7cc;
		grid-area:footer;
		text-align:center;
	}
	
	
	button {
   		 margin: 10px;
	}
	
	.w-btn {
	    display: inline-block;
	    padding: 15px 60px;
	    border-radius: 50px;
	}
	
	
	.fair {
	    background-color: white;
	    
	}

	.fairbtn {
		border-radius: 50px;
		background-color: white;
		width:205pt;
		height:30pt;
	}
	
/* 	.dropdown{ */
/* 	  position : relative; */
/* 	  display : inline-block; */
/* 	} */

	.dropdown1-content{
	  display : none;
	  position : absolute;
	  z-index : 1; /*다른 요소들보다 앞에 배치*/
	}
	
/* 	.dropdown-content a{ */
/* 	  display : block; */
/* 	} */
	
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
	<div class="container1">
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
						<li align="right" style="padding-right:1.5%; padding-top:12px">
							<a style="color:white;"><%= mid %> 님 안녕하세요!!</a> &nbsp; &nbsp;
							<a href="logout.pc" style="color:white;">로그아웃 |</a>
							<% String link =  "memSelect.pc?mnum=" + mnum;%>
							<a href="<%= link %>" style="color:white;">내정보</a>
						</li>    
<% 
	}else{
%>
						<li align="right" style="padding-right:1.5%; padding-top:12px">
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

				<a href="#"><img src="/petCenter/img/logo.png" align="left" width="110" height="110"></a>
				<nav>
					<ul class="menu">
						<li><a href="noticeSelectAll.pc">공지사항</a></li>
						<li>
							<div class="dropdown1">
								<a class="dropBtn" href="#">게시판</a>
								<div class="dropdown1-content">
									<hr style="border: 1px solid #3db7cc;">
									<a href="comSelAll.pc">커뮤니티</a>
									<a href="tipSelAll.pc">팁게시판</a>
									<a href="">사진게시판</a>
								</div>
							</div>
						</li>
						<li><a href="productSelectAll.pc?pcategory=21">쇼핑몰</a></li>
						<li><a href="walkHelper.pc">산책지도</a></li>
						<li><a href="fairSelectAll.pc">박람회</a></li>
					</ul>
				</nav>

			</div>

		</div><!-- end of header -->
		<div class="side"></div>
		<div class="main">
		<!-- 박람회 -->
				<div>
	
					<br>
					<table>
						<tr>
							<td>
								<h1 align="left" style="margin-left:50px;">예정 전시</h1> 
							</td>
							<td width="1000" align="right">	
								<button  type="button" class="w-btn fair" id="allfair">전체보기  ></button>
							</td>
						</tr>
					</table>
					<br>
					<table style="border:1px; width:1200px;">
						<tr>
							<td>
								<img src="/petCenter/img/fair/1.png" style="border-radius:7px;" width="280" height="350"/>
							</td>
							<td>
					 			<img src="/petCenter/img/fair/2.png" style="border-radius:7px;" width="280" height="350"/>
					 		</td>
					 		<td>
					 			<img src="/petCenter/img/fair/3.png" style="border-radius:7px;" width="280" height="350"/>
					 		</td>
					 		<td>
					 			<img src="/petCenter/img/fair/4.png" style="border-radius:7px;" width="280" height="350"/>
					 		</td>
					 	</tr>
					 	<tr>
					 		<td>
					 			<button  type="button" id="fairSel" class="fairbtn">사전등록하러가기</button>
					 		</td>
					 		<td>
					 			<button  type="button" id="fairnone" class="fairbtn">사전등록하러가기</button>
					 		</td>
					 		<td>
					 			<button  type="button" id="fairnone" class="fairbtn">사전등록하러가기</button>
					 		</td>
					 		<td>
					 			<button  type="button" id="fairnone" class="fairbtn">사전등록하러가기</button>
					 		</td>
					</table>
				
				</div>
		<!-- 박람회 -->
		<!-- rss 연결 -->
				<div>
					<jsp:include page="../main/rssPage.jsp" flush="true">
						<jsp:param name="url" value="rss.jsp"/>
					</jsp:include>
				</div>
				<!-- rss 연결 -->
				
				<!-- 사진 게시판 연결 -->
					<div>
						사진 게시판 넣을예정
						<img src="/petCenter/img/33.png"/>
					</div>
				<!-- 사진 게시판 연결 -->
			
			<div><img src="/petCenter/img/44.png"/></div>
		</div><!--  end of main -->
		<div class="aside"></div>
		<div class="footer">
			<div class="footer1" style="color:white;">
				<br/>
				(주) PetCenter   대표자 : PC   프로젝트번호 : 202-05-20231   주소 : 서울특별시 금천구 가산디지털2로 123 2차) 월드메르디앙 ㅣ 발표번호 : 2023-서울가산-0113
				<br/>
				[CS CENTER]
				<br/><br/>
				참가 문의 : 02-XXXX-XXXX,XXXX ㅣ 참관객 문의 : 02-XXXX-XXXX   E-MAIL : petCenter.pc@pcgroup.com   FAX : 02-XXXX-XXXX
				<br/>
				Mon - Fri. 09:30 - 18:30 ㅣ Lunch : 13:20 - 14:30 ㅣ Sat, Sun & Holiday OFF
				<br/>
				(사)한국펫센터프로젝트협회   주소 : 경기도 프로젝트시 833-1 반려동물지식산업센터 A+동 115층 1001호
				<br/><br/>
				Copyright(c) 2023. PetCenter. All Right Reserved.
				<br/><br/>
			</div>
		</div>
	</div><!-- end of container1 -->	
</body>
</html>