<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="main.pc.photo.vo.PhotoVO"%>

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
				
		
				
				$(document).on("click", "#bpnum", function() {
					if($(this).prop("checked")) {
						$(".bpnum").prop("checked", false);
						$(this).prop("checked", true);
					}
				});

				$("#iBtn").on("click", function() {
					
					if($(".bpnum:checked").length == 0) {
						return;
					}
					
					$("#selectForm").attr({
						"action":"photoInsForm.pc",
						"method":"GET",
						"enctype":"application/x-www-form-urlencoded"
					}).submit();
				});

				$("#dBtn").on("click", function() {
					if($(".bpnum:checked").length == 0) {
						alert("삭제하나선택하시오 >>> : ");
						return;
					}
					$("#selectForm").attr({
						"action":"photoDel.pc",
						"method":"GET",
						"enctype":"application/x-www-form-urlencoded"
					}).submit();
				});

				$("#ssBtn").on("click", function() {
					if($(".bpnum:checked").length == 0) {
						alert("수정하나선택하시오 >>> : ");
						return;
					}

					$("#selectForm").attr({
						"action":"photoSel.pc",
						"method":"GET",
						"enctype":"application/x-www-form-urlencoded"
					}).submit();
				});
					
					
				$("#viewBtn").on("click", function() {
					if($(".bpnum:checked").length == 0) {
						return;
					}
					$("#selectForm").attr({
						"action":"photoSelForm.pc",
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
			th{text-align:center; white-space:nowrap;}
			td.vCenter{text-align:center}
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
		Object obj = request.getAttribute("photoList");
		if(obj == null) return;
		
		int totalCount = 0;
		
		List<PhotoVO> list = (List<PhotoVO>)obj;
		int nCnt = list.size();
		%>
	<div class="container">
		<div class="title">반려동물 자랑</div>
		
		<form action="selectForm" id="selectForm" name="selectForm">
			<table class="table-sm table-striped table-hover table-bordered" style="width:100%;">
				<thead>
					<th></th>
					<th>순번</th>
					<th>글번호</th>
					<th style="width:100px;">아이디</th>
					<th style="width:200px;">글제목</th>
					<th>사진</th>
					<th>조회수</th>
					<th>입력일</th>
				</thead>
				<% 
				if(nCnt>0) {
					for(int i = 0; i<nCnt; i++) {
						
						PhotoVO pvo = list.get(i);
						totalCount = Integer.parseInt(pvo.getTotalCount());
				%>
			<tbody>
				<tr>
					<td class="vCenter"><input type="checkbox" id="bpnum" name="bpnum" class="bpnum" value="<%= pvo.getBpnum() %>"/></td>
					<td class="vCenter"><%= i+1 %></td>
					<td class="vCenter"><%= pvo.getBpnum() %></td>
					<td class="vCenter"><%= pvo.getMid() %></td>
					<td class="vCenter"><%= pvo.getBptitle() %></td>
					<td class="vCenter"><img id="bImage" src="/petCenter/fileupload/photo/<%=pvo.getBpphoto() %>" width="110" height="110" onerror="this.src='/petCenter/img/noImg.gif';"></td>
					<td class="vCenter"><%= pvo.getBphit() %></td>
					<td class="vCenter"><%= pvo.getIdate() %></td>
				</tr>
				<% 
					}
				}
				%>
				<tr>
					<td colspan="8">
						<jsp:include page="photoPaging.jsp" flush="true">
							<jsp:param name="url" value="photoSelAll.pc"/>
							<jsp:param name="str" value=""/>
							<jsp:param name="pageSize" value="${paging.pageSize}"/>
							<jsp:param name="groupSize" value="${paging.groupSize}"/>
							<jsp:param name="curPage" value="${paging.curPage}"/>
							<jsp:param name="totalCount" value="<%=totalCount %>"/>
						</jsp:include>
					</td>
				</tr>				
				<tr>
					<td colspan="8" class="gbuttons" align="right">
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