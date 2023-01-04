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
<!-- 		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"> -->
<!-- 		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script> -->
<!-- 		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
<!-- 		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>		 -->

		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<style type="text/css">

			*{
				font-family:'Noto Sans KR', sans-serif;
				/*목록에 점 없애기*/
				list-style:none;
				/*링크에 색깔 밑줄없애기*/
				text-decoration:none;
				border-collapse:collapse;
				margin:0px;
				padding:0px;
				/*기본폰트색깔*/
				color:#000;		
			}		


			.container{
				display:grid;
				grid-template-columns:1fr 1400px 1fr;
				grid-template-rows:150px 1fr 150px;
				grid-template-areas:
					"header		header		header"
					"side		main		aside" 
					"footer		footer		footer";
			}
		
			.container > div{
				justify-items:center;
				align-items:center;
			}				
			
			.header{
			/* 	background-image:url("../../img/contact.png"); */
				diplay:flex;
				position:sticky;
				top:0%;
			  	background:orange;
				grid-area:header;
				text-align:center;
			}
			
			.upperH{width:100%;height:50px;background:pink;}
			.lowerH{width:100%;height:100px;background:yellow;}
			
			.side{
				background:red;
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
				background:blue;
				grid-area:aside;
			}			
			.footer{
				background:green;
				grid-area:footer;
			}		
			
		</style>
		
	</head>
	<body>
	<div class="container">
		<!-- header를 sitearea, topbar, wrapper, logoarea, toplogo,  -->
		<div class="header">
			<!-- 상단바와 내용 -->
		<div class="upperH">링크1 / 링크2 / 링크3 / 링크4 / 링크 5  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 마이페이지
		
			<div>
			<%
				String mnum = "";
				String mid = "";
				Object objMnum = session.getAttribute("KNUM");
				Object objMid = session.getAttribute("KID");
				
				if (objMnum != null) {
					mnum = (String)objMnum;
					mid = (String)objMid;
			%>
				<p>
					<%= mid %>(<%= mnum %>) 님 안녕하세요!! 
					<a href="logout.pc">로그아웃</a> | 
					<a href="calendar.pc" >캘린더</a> |
					<a href="memInsertForm.pc" >회원가입</a>
					<% String link =  "memSelect.pc?mnum=" + mnum;%>
					<a href="<%= link %>">회원정보</a>
				</p>
			<% 
				}else{
			%>
				<p>
					<a href="loginForm.pc" >로그인</a> |
					<a href="memInsertForm.pc" >회원가입</a>
					
				</p>
			<%
				}
			%>		
			</div>
		
		</div>
		<div class="lowerH">로고 / 박람회(버튼) <a href="comInsForm.pc">커뮤니티글쓰기(ex)</a><a href="comSelAll.pc">커뮤니티글보기(ex)</a> 쇼핑몰(버튼) 지도(버튼) 공지사항(버튼)</div>
		<div class="lowerH">
			로고 
			/ 박람회(버튼) 
			<a href="communityInsertForm.pc">커뮤니티글쓰기</a>
			<a href="productSelectAll.pc?pcategory=21">쇼핑몰</a>
		 	지도(버튼) 
		 	공지사항(버튼)
		</div>
		</div><!-- end of header -->
		<div class="side">
		</div>
		<div class="main">
				<div><img src="/petCenter/img/11.png"/></div>
				<div><img src="/petCenter/img/22.png"/></div>
				<div><img src="/petCenter/img/33.png"/></div>
				<div><img src="/petCenter/img/44.png"/></div>
		</div><!--  end of main -->
		<div class="aside"></div>
		<div class="footer">
			
		</div>
	</div><!-- end of container -->	
	</body>
</html>