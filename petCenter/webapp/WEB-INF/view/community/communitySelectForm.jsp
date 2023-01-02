<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="main.pc.community.vo.CommunityVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {

		$("#suBtn").on("click", function() {
	
			location.href = "/petCenter/communitySelectAll.pc";

			});
		
		// like_1 버튼 
		$(document).on("click", "#like_1", function(e){
			
			let boardLikeURL = "like1.pc";
			let reqType = "GET";
			let dataParam = {
				like1: $(this).val(),
				mnum: $("mnum").val(),
				bcnum: $("bcnum").val(),
			};		
			dataParam = $("#sForm").serialize();
			
			$.ajax({
				url: boardLikeURL,
				type: reqType,								
				data: dataParam,	            
				success: whenSuccess				
			});
			
			function whenSuccess(resData){
				alert("resData : " + resData);
				console.log("resData : " + resData);			
				$("#disp_cnt_recom").text(resData).val();				
			}	
			
		});
		
		// like_2 버튼 
		$(document).on("click", "#like_2", function(e){
			
			let boardLikeURL = "hate1.pc";
			let reqType = "GET";
			let dataParam = {
				hate1: $(this).val(),
				mnum: $("mnum").val(),
				bcnum: $("bcnum").val(),
			};		
			dataParam = $("#sForm").serialize();
			
			$.ajax({
				url: boardLikeURL,
				type: reqType,								
				data: dataParam,	            
				success: whenSuccess				
			});
			
			function whenSuccess(resData){
				alert("resData : " + resData);
				console.log("resData : " + resData);			
				$("#disp_cnt_stop").text(resData).val();				
			}	
			
		});
					
		});
</script>
</head>
<body>
<h3>커뮤니티조회</h3>
<%
request.setCharacterEncoding("UTF-8");
Object obj = request.getAttribute("listS");
String mnum = (String)session.getAttribute("KNUM");
if(obj == null) return;

List<CommunityVO> list = (List<CommunityVO>)obj;
int i = list.size();
String bcnum = "";


CommunityVO covo = null;
if(i == 1) { 
	 covo = list.get(0);
	bcnum = covo.getBcnum();
}
%>
<form action="sForm" id="sForm" name="sForm">
<table border="1" align="center">
<tr>
<td>글번호</td>
<td>
<%= covo.getBcnum() %>
<input type="hidden" name="mnum" id="mnum" value="<%=mnum %>">
<input type="hidden" name="bcnum" id="bcnum" value="<%=bcnum %>">
</td>
</tr>
<tr>
<td>글카테고리</td>
<td>
<%= covo.getBcc() %>
</td>
</tr>
<tr>
<td>회원아이디</td>
<td>
<%= covo.getMid() %>
</td>
</tr>
<tr>
<td>글제목</td>
<td>
<%= covo.getBctitle() %>
</td>
</tr>
<tr>
<td>글내용</td>
<td>
<%= covo.getBccontent() %>
</td>
</tr>
<tr>
	<td>
		<button type="button" class="like_1" name="like_1" id="like_1">추천
		<p><img src='/petCenter/img/like/heart.png' style='width:12px; margin:3px 3px 0 0;'>
		<span id="disp_cnt_recom"><%= covo.getLikey() %></span></p></button>
		
		<button type="button" class="like_2" name="like_2" id="like_2">반대
		<p><img src='/petCenter/img/like/thumb_rev.png' style='width:12px; margin:3px 3px 0 0;'>
		<span id="disp_cnt_stop"><%= covo.getHate() %></span></p></button>




<tr>
<td colspan="2">

<input type="button" value="메인" id="suBtn"/>
</td>
</tr>
</table>
</form>
<div>
<!-- 댓글 처리 하는 루틴  --> 
<jsp:include page="/replyForm.pc">
	<jsp:param value="<%=bcnum%>" name="bcnum"/>
</jsp:include>	
</div>
</body>
</html>