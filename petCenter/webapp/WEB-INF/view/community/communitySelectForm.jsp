<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="main.pc.community.vo.CommunityVO"%>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<%
			Logger logger = LogManager.getLogger(this.getClass());
		%>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
		
			$(document).ready(function() {
		


				$("#suBtn").on("click", function() { location.href = "/petCenter/communitySelectAll.pc"; });
				
				// like_1 버튼 
				$(document).on("click", "#like_1", function(e){
					alert($("#likey").val());
		
					let boardLikeURL = "like1.pc";
					let reqType = "GET";
					let dataParam = {
						likey: $("#likey").val(),
						mnum: $("#mnum").val(),
						bcnum: $("#bcnum").val(),
					};

					
					dataParam = $("#sForm").serialize();
					
					$.ajax({
						url: boardLikeURL,
						type: reqType,								
						data: dataParam,	            
						success: whenSuccess,		
						error: error1
					});
					
					function whenSuccess(resData){
						alert("resData : " + resData);
						console.log("resData : " + resData);			
						$("#disp_cnt_recom").text(resData);
						$("#likey").val(resData);
					}
					
					function error1(e){
						console.log(":" + e.responseText);
					}
					
				});
				
				// like_2 버튼 
				$(document).on("click", "#like_2", function(e){
					alert($("#haty").val());
					
					let boardLikeURL = "hate1.pc";
					let reqType = "GET";
					let dataParam = {
						hate: $("#haty").val(),
						mnum: $("#mnum").val(),
						bcnum: $("#bcnum").val(),
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
						$("#disp_cnt_stop").text(resData);
						$("#haty").val(resData);
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
		<form id="sForm">
			<table border="1" align="center">
				<tr>
					<td>글번호</td>
					<td>
						<%= covo.getBcnum() %>
						<input type="hidden" name="mnum" id="mnum" value="<%=mnum %>">
						<input type="hidden" name="bcnum" id="bcnum" value="<%=bcnum %>">
						<input type="hidden" name="likey"  id="likey" value="<%= covo.getLikey()%>">
						<input type="hidden" name="hate"  id="haty" value="<%= covo.getHate() %>">						
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
						<input type="button" class="like_1" name="like_1" id="like_1" value="추천">
						<p>	
							<img src='/petCenter/img/like/heart.png' style='width:12px; margin:3px 3px 0 0;'>
							<span id="disp_cnt_recom"><%= covo.getLikey() %></span>
						</p>
					</td>
					<td>
						<input type="button" class="like_2" name="like_2" id="like_2" value="반대">
						<p>
							<img src='/petCenter/img/like/thumb_rev.png' style='width:12px; margin:3px 3px 0 0;'>
							<span id="disp_cnt_stop"><%= covo.getHate() %></span>
						</p>
					</td>
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