<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="main.pc.community.vo.CommunityVO"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>커뮤니티조회</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0
								maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">		
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		
		<script type="text/javascript">
			$(document).ready(function() {
				alert("제이쿼리진입 >>> : ");
				
				$(document).on("click", "#chkAll", function() {
					if($(this).prop("checked")) {
						$(".bcnum").prop("checked", false);
						
					}
				});
				
				$(document).on("click", "#bcnum", function() {
					if($(this).prop("checked")) {
						$(".bcnum").prop("checked", false);
						$(this).prop("checked", true);
					}
				});

				$("#iBtn").on("click", function() {
					$("#selectForm").attr({
						"action":"communityInsertForm.pc",
						"method":"GET",
						"enctype":"application/x-www-form-urlencoded"
					}).submit();
				});

				$("#sBtn").on("click", function() {
					$("#selectForm").attr({
						"action":"communitySelectAll.pc",
						"method":"GET",
						"enctype":"application/x-www-form-urlencoded"
					}).submit();
				});

				$("#dBtn").on("click", function() {
					if($(".bcnum:checked").length == 0) {
						alert("삭제하나선택하시오 >>> : ");
						return;
					}
					$("#selectForm").attr({
						"action":"communityDelete.pc",
						"method":"GET",
						"enctype":"application/x-www-form-urlencoded"
					}).submit();
				});

				$("#ssBtn").on("click", function() {
					if($(".bcnum:checked").length == 0) {
						alert("수정하나선택하시오 >>> : ");
						return;
					}

					$("#selectForm").attr({
						"action":"communitySelect.pc",
						"method":"GET",
						"enctype":"application/x-www-form-urlencoded"
					}).submit();
				});
					
					
				$("#viewBtn").on("click", function() {
					if($(".bcnum:checked").length == 0) {
						return;
					}
					$("#selectForm").attr({
						"action":"communitySelectForm.pc",
						"method":"GET",
						"enctype":"application/x-www-form-urlencoded"
					}).submit();	
				});
			});
		</script>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>				

		<style>
			.title{text-align:center;font-size:2rem;font-weight:bold;}
/* 			td.insert{width:85%;} */
/* 			input.insert_1{width:100%;border:none;} */
/* 			textarea.insert_1{width:100%;border:none;} */
			/*td.semi_title{text-align:center;}*/
			th{text-align:center;}
			td.gbuttons, td.vCenter{text-align:center}
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
		<%
		request.setCharacterEncoding("UTF-8");
		Object obj = request.getAttribute("listAll");
		if(obj == null) return;
		
		List<CommunityVO> list = (List<CommunityVO>)obj;
		int nCnt = list.size();
		%>
		<div class="title">커뮤니티글보기</div>
		
		<div class="search-box">
			<jsp:include page="communitySearch.jsp" flush="true">
				<jsp:param name="searchFilter" value="${paging.searchFilter}"/>
				<jsp:param name="keyword" value="${paging.keyword}"/>
				<jsp:param name="startDate" value="${paging.startDate}"/>
				<jsp:param name="endDate" value="${paging.endDate}"/>
				<jsp:param name="mid" value="${paging.mid}"/>
			</jsp:include>
		</div>
		
		<form action="selectForm" id="selectForm" name="selectForm">
			<table class="table-sm table-striped table-hover table-bordered" style="width:100%;">
				<thead>
					<th><input type="checkbox" id="chkAll" name="chkAll" class="chkAll"/></th>
					<th>순번</th>
					<th>글번호</th>
					<th>글카테고리</th>
					<th>회원아이디</th>
					<th>글제목</th>
					<th>글내용</th>
				</thead>
				<% 
				if(nCnt>0) {
					for(int i = 0; i<nCnt; i++) {
						
						CommunityVO covo = list.get(i);
				%>
			<tbody>
				<tr>
					<td class="vCenter"><input type="checkbox" id="bcnum" name="bcnum" class="bcnum" value="<%= covo.getBcnum() %>"/></td>
					<td class="vCenter"><%= i+1 %></td>
					<td class="vCenter"><%= covo.getBcnum() %></td>
					<td class="vCenter"><%= covo.getBcc() %></td>
					<td class="vCenter"><%= covo.getMid() %></td>
					<td class="vCenter"><%= covo.getBctitle() %></td>
					<td><%= covo.getBccontent() %></td>
				</tr>
				<% 
					}
				}
				%>
				<tr>
					<td colspan="7" class="gbuttons">
						<input type="button" value="등록" id="iBtn"/>
						<input type="button" value="조회" id="sBtn"/>
						<input type="button" value="삭제" id="dBtn"/>
						<input type="button" value="수정" id="ssBtn"/>
						<input type="button" value="보기" id="viewBtn"/>
					</td>
				</tr>
			</tbody>			
			</table>
		</form>
		</div>
	</body>
</html>