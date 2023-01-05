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

				$("#iBtn").on("click", function() {
					$("#selectForm").attr({
						"action":"comInsForm.pc",
						"method":"GET",
						"enctype":"application/x-www-form-urlencoded"
					}).submit();
				});

// 				$("#sBtn").on("click", function() {
// 					$("#selectForm").attr({
// 						"action":"comSelAll.pc",
// 						"method":"GET",
// 						"enctype":"application/x-www-form-urlencoded"
// 					}).submit();
// 				});

				$("#dBtn").on("click", function() {
					if($(".bcnum:checked").length == 0) {
						alert("삭제하나선택하시오 >>> : ");
						return;
					}
					$("#selectForm").attr({
						"action":"comDel.pc",
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
						"action":"comSel.pc",
						"method":"GET",
						"enctype":"application/x-www-form-urlencoded"
					}).submit();
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
	<jsp:include page="../include/header.jsp" flush="true">
			<jsp:param name="url" value="produectSelectAll.jsp"/>
	</jsp:include>
	<br><br>
	
		<%
		Object mnum = session.getAttribute("KNUM");
		Object mid = session.getAttribute("KID");
		request.setCharacterEncoding("UTF-8");
		Object obj = request.getAttribute("comList");
		if(obj == null) return;
		
		int totalCount = 0;
		
		List<CommunitiesVO> list = (List<CommunitiesVO>)obj;
		int nCnt = list.size();
		%>
	<div class="container">
		<div class="title">커뮤니티글보기(ex)</div>
		
		<div class="search-box">
			<jsp:include page="comSelAllSearch.jsp" flush="true">
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
						<jsp:include page="comPaging.jsp" flush="true">
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
						<input type="button" value="등록" id="iBtn"/>
<!-- 						<input type="button" value="조회" id="sBtn"/> -->
						<input type="button" value="삭제" id="dBtn"/>
						<input type="button" value="수정" id="ssBtn"/>
						<input type="button" value="보기" id="viewBtn"/>
					</td>
				</tr>
			</tbody>			
			</table>
		</form>
		</div>
	<br><br>
	<jsp:include page="../include/footer.jsp" flush="true">
		<jsp:param name="url" value="produectSelectAll.jsp"/>
	</jsp:include>
	</body>
</html>