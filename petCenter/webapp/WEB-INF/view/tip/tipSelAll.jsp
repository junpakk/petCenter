<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="main.pc.communities.vo.CommunitiesVO"%>

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
				console.log("제이쿼리진입 >>> : ");
				
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
				
				$("#tomain").on("click", function(){
					location.href="mainPage.pc";
				});

					
				$("#viewBtn").on("click", function() {
					if($(".bcnum:checked").length == 0) {
						return;
					}
					$("#selectForm").attr({
						"action":"comSelForm.pc",
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
			#bImage{
				border:1px solid #ccc;
				border-radius:1px;
				width:20px;
				height:20px;
			}
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
		Object obj = request.getAttribute("comList");
		if(obj == null) return;
		
		int totalCount = 0;
		
		List<CommunitiesVO> list = (List<CommunitiesVO>)obj;
		int nCnt = list.size();
		%>
		<div class="title">팁 게시판</div>
		
		<div class="search-box">
			<jsp:include page="tipSelAllSearch.jsp" flush="true">
				<jsp:param name="searchFilter" value="${paging.searchFilter}"/>
				<jsp:param name="keyword" value="${paging.keyword}"/>
				<jsp:param name="startDate" value="${paging.startDate}"/>
				<jsp:param name="endDate" value="${paging.endDate}"/>
				<jsp:param name="mnum" value="${paging.mnum}"/>
				<jsp:param name="mid" value="${paging.mid}"/>
			</jsp:include>
		</div>
		<form action="selectForm" id="selectForm" name="selectForm">
			<table class="table-sm table-striped table-hover table-bordered" style="width:100%;">
				<thead>
					<th><input type="checkbox" id="chkAll" name="chkAll" class="chkAll"/></th>
					<th>순번</th>
					<th>글번호</th>
					<th style="width:100px;">카테고리</th>
					<th>회원번호</th>
					<th style="width:100px;">아이디</th>
					<th style="width:200px;">글제목</th>
					<th>글내용</th>
					<th>조회수</th>
					<th>입력일</th>
				</thead>
				<% 
				if(nCnt>0) {
					for(int i = 0; i<nCnt; i++) {
						
						CommunitiesVO covo = list.get(i);
						totalCount = Integer.parseInt(covo.getTotalCount());
				%>
			<tbody>
				<tr>
					<td class="vCenter"><input type="checkbox" id="bcnum" name="bcnum" class="bcnum" value="<%= covo.getBcnum() %>"/></td>
					<td class="vCenter"><%= i+1 %></td>
					<td class="vCenter"><%= covo.getBcnum() %></td>
					<td class="vCenter"><%= covo.getBcc() %></td>
					<td class="vCenter"><%= covo.getMnum() %></td>
					<td class="vCenter"> <img id="bImage" src="/petCenter/fileupload/com/<%=covo.getBcphoto() %>"  onerror="this.src='/petCenter/img/noImg.gif';"><%= covo.getMid() %></td>
					<td class="vCenter"><%= covo.getBctitle() %></td>
					<td><%= covo.getBccontent() %></td>
					<td class="vCenter"><%= covo.getBchit() %></td>
					<td class="vCenter"><%= covo.getIdate() %></td>
				</tr>
				<% 
					}
				}
				%>
				<tr>
					<td colspan="10">
						<jsp:include page="tipPaging.jsp" flush="true">
							<jsp:param name="url" value="comSelAll.pc"/>
							<jsp:param name="str" value="searchFilter=${paging.searchFilter}&keyword=${paging.keyword}&startDate=${paging.startDate}&endDate=${paging.endDate}&mid=<%= mid %>&mnum=<%= mnum %>"/>
							<jsp:param name="pageSize" value="${paging.pageSize}"/>
							<jsp:param name="groupSize" value="${paging.groupSize}"/>
							<jsp:param name="curPage" value="${paging.curPage}"/>
							<jsp:param name="totalCount" value="<%=totalCount %>"/>
						</jsp:include>
					</td>
				</tr>				
				<tr>
					<td colspan="10" class="gbuttons">
						<input type="button" value="메인으로" id="tomain"/>
						<input type="button" value="보기" id="viewBtn"/>
					</td>
				</tr>
			</tbody>			
			</table>
		</form>
		</div>
	</body>
</html>