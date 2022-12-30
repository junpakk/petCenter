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
	alert("수정하러가요 >>> : ");
	$(document).ready(function() {
		alert("수정하러 제이쿼리진입  >>> : ");
		$("#suBtn").on("click", function() {
			$("#sForm").attr({
				"action":"communityUpdate.pc",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
			
			
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
%>
<% 
if(i>0) { 
	CommunityVO covo = list.get(0);
%>
<form action="sForm" id="sForm" name="sForm">
<table border="1" align="center">
<tr>
<td>글번호</td>
<td>
<input type="text" id="bcnum" name="bcnum" value="<%= covo.getBcnum() %>"/>
</td>
</tr>
<tr>
<td>글카테고리</td>
<td>
<input type="text" id="bcc" name="bcc" value="<%= covo.getBcc() %>"/>
</td>
</tr>
<tr>
<td>회원아이디</td>
<td>
<input type="text" id="mid" name="mid" value="<%= covo.getMid() %>"/>
</td>
</tr>
<tr>
<td>글제목</td>
<td>
<input type="text" id="bctitle" name="bctitle" value="<%= covo.getBctitle() %>"/>
</td>
</tr>
<tr>
<td>글내용</td>
<td>
<input type="text" id="bccontent" name="bccontent" value="<%= covo.getBccontent() %>"/>
</td>
</tr>


<% 	
}
%>
<tr>
<td colspan="2">

<input type="button" value="수정(글내용)" id="suBtn"/>
</td>
</tr>
</table>
</form>
</body>
</html>