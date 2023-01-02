<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List"%>
<%@ page import = "main.pc.zang.vo.ZangVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	alert("셀렉트올스트립트 >>> : ");
	$(document).ready(function() {
		alert("셀렉트올제이쿼리 >>> : ");		
		$("#iBtn").on("click", function() {
			
			$("#sForm").attr({
				"action":"zangInsertForm.pc",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
			
			
		});	
		$("#sBtn").on("click", function() {
			alert("셀렉트올다시조회 >>> : ");
			$("#sForm").attr({
				"action":"petzangSelectAll.pc",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
			
			
		});	
		$(document).on("click", "#chkAll", function() {
			if($(this).prop("checked")) {
				$(".bznum").prop("checked", false);
				
			}	
		});
		$(document).on("click", "#bznum", function() {
			if($(this).prop("checked")) {
				$(".bznum").prop("checked", false);
				$(this).prop("checked", true);
				
			}	
		});
		$("#dBtn").on("click", function() {
			if($(".bznum:checked").length == 0) {
				
				alert("삭제선택하세요 >>> : ");
				return;
			}
			$("#sForm").attr({
				"action":"zangDelete.pc",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
			
			
		});	
		$("#ssBtn").on("click", function() {
			if($(".bznum:checked").length == 0) {
				
				alert("수정선택하세요 >>> : ");
				return;
			}
			$("#sForm").attr({
				"action":"zangSelect.pc",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
			
			
		});	
		
		
	});

</script>
</head>
<body>
<h3>장터셀렉트올</h3>
<%
request.setCharacterEncoding("UTF-8");
Object obj = request.getAttribute("listAll");
if(obj == null) return;

List<ZangVO> list = (List<ZangVO>)obj;
int nCnt = list.size();
%>
<form action="sForm" id="sForm" name="sForm">
<table border="1" align="center">
<thead>
<th>
<input type="checkbox" id="chkAll" name="chkAll" class="chkAll"/>
</th>
<th>순번</th>
<th>장터번호</th>
<th>장터카테고리</th>
<th>회원아이디</th>
<th>거래장터제목</th>
<th>거래장터글내용</th>
</thead>
<% 

if(nCnt>0) {
	
	for(int i = 0; i < nCnt; i++) {
		
		ZangVO zvo = list.get(i);
%>
<tbody>
<td>
<input type="checkbox" id="bznum" name="bznum" class="bznum" value="<%= zvo.getBznum() %>"/>
</td>
<td><%= i+1 %></td>
<td><%= zvo.getBznum() %></td>
<td><%= zvo.getBzc() %></td>
<td><%= zvo.getMid() %></td>
<td><%= zvo.getBztitle() %></td>
<td><%= zvo.getBzcontent() %></td>
</tbody>
<% 		
		
		
	}
}
%>
<td colspan="7">
<input type="button" value="입력" id="iBtn"/>
<input type="button" value="조회" id="sBtn"/>
<input type="button" value="삭제" id="dBtn"/>
<input type="button" value="수정(거래장터글내용)" id="ssBtn"/>
</td>
</table>
</form>
</body>
</html>