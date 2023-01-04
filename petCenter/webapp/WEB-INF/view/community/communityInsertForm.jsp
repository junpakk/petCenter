<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
			//alert("스크립트진입 >>> : ");
			console.log("스크립트진입 >>> : ");

			$(document).ready(function() {
				//alert("제이쿼리진입 >>> : ");
				console.log("제이쿼리진입 >>> : ");
				
				$("#fBtn").on("click", function() {
					
					if(!$("#bcc").val()|| !$("#bctitle").val() || !$("#bccontent").val()){
						alert("내용을 입력해주세요!!");
						return false;
					}
					
					$("#Form").attr({
						"action":"communityInsert.pc",
						"method":"GET",
						"enctype":"application/x-www-form-urlencoded"
					}).submit();
				});
				
				$("#toMain").on("click", function(){
					location.href="mainPage.pc";
				});
			});
		</script>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>				
	
		<style>
			.title{text-align:center;font-size:2rem;font-weight:bold;}
			td.insert{width:85%;}
			input.insert_1{width:100%;border:none;}
			textarea.insert_1{width:100%;border:none;}
			td.semi_title{text-align:center;}
			td.gbuttons{text-align:center}
			.header{
			/* 	background-image:url("../../img/contact.png"); */
				diplay:flex;
				position:sticky;
				top:0%;
			  	background:orange;
				grid-area:header;
				text-align:center;
			}
			.upperH{width:100%;height:50px;background:pink;text-align:center;}
			.lowerH{width:100%;height:100px;background:yellow;text-align:center;}			
		</style>
	
	</head>
	<body>
		<div class="header">
		<div class="upperH">링크1 / 링크2 / 링크3 / 링크4 / 링크 5  &nbsp; 마이페이지
			<div>
			<%
				String mnum = null;
				String mid = null;
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
		<div class="lowerH">로고 / 박람회(버튼) 커뮤니티(버튼) 쇼핑몰(버튼) 지도(버튼) 공지사항(버튼)</div>
		</div>
		<div class="container">
		<script>
			if(<%=mid%> === null || "<%=mid%>" === ""){
				alert("먼저 로그인 해주세요 "+ <%=mid%>);
				location.href="mainPage.pc";
			}
		</script>
		<div class="title">커뮤니티글쓰기</div>
		<form action="Form" id="Form" name="Form">
			<input type="hidden" class="insert_1" id="mid" name="mid" value="<%=mid %>" readonly/>
			<table class="table-sm table-striped table-hover table-bordered" style="width:100%;">
				<tr>
					<td class="semi_title">글번호</td>
					<td class="insert"><input type="text" class="insert_1" id="bcnum" name="bcnum" placeholder="자동생성" readonly/></td>
				</tr>
				<tr>
					<td class="semi_title">글카테고리</td>
					<td class="insert"><input type="text" class="insert_1" id="bcc" name="bcc" required/></td>
				</tr>
				<tr>
					<td class="semi_title">글제목</td>
					<td class="insert"><input type="text" class="insert_1" id="bctitle" name="bctitle" required/></td>
				</tr>
				<tr>
					<td class="semi_title">글내용</td>
					<td class="insert"><textarea class="insert_1" id="bccontent" name="bccontent" rows="10"  required></textarea></td>
				</tr>
				
				<tr>
					<td colspan="2" class="gbuttons">
						<input type="button" id="fBtn" name="fBtn" value="입력"/>
						<input type="button" id="toMain" name="toMain" value="메인화면"/>
						<input type="reset" value="리셋">
					</td>
				</tr>
			
			</table>
		</form>
		</div>
	</body>
</html>