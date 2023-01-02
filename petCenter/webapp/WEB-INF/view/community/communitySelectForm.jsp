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
					
		});
</script>
</head>
<body>
<h3>커뮤니티조회</h3>
<%
request.setCharacterEncoding("UTF-8");
Object obj = request.getAttribute("listSel");
if(obj == null) return;

List<CommunityVO> list = (List<CommunityVO>)obj;
int i = list.size();
String bcnum = "";
%>
<% 
if(i>0) { 
	CommunityVO covo = list.get(0);
	bcnum = covo.getBcnum();
%>
<form action="sForm" id="sForm" name="sForm">
<table border="1" align="center">
<tr>
<td>글번호</td>
<td>
<%= covo.getBcnum() %>
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


<% 	
}
%>
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