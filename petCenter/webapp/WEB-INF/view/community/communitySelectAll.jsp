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
		alert("제이쿼리진입 >>> : ");
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
		
		
	});
</script>
</head>
<body>
<h3>커뮤니티셀렉트올</h3>
<%
request.setCharacterEncoding("UTF-8");
Object obj = request.getAttribute("listAll");
if(obj == null) return;

List<CommunityVO> list = (List<CommunityVO>)obj;
int nCnt = list.size();
%>
<form action="selectForm" id="selectForm" name="selectForm">
<table border="1" align="center">
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
<td><input type="checkbox" id="bcnum" name="bcnum" class="bcnum" value="<%= covo.getBcnum() %>"/></td>
<td><%= i+1 %></td>
<td><%= covo.getBcnum() %></td>
<td><%= covo.getBcc() %></td>
<td><%= covo.getMid() %></td>
<td><%= covo.getBctitle() %></td>
<td><%= covo.getBccontent() %></td>
</tbody>




<% 
	}
	
}%>
<td colspan="7">
<input type="button" value="등록" id="iBtn"/>
<input type="button" value="조회" id="sBtn"/>
<input type="button" value="삭제" id="dBtn"/>
<input type="button" value="수정" id="ssBtn"/>
</td>
</table>
</form>
</body>
</html>