<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="main.pc.koji.vo.KojiVO"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#iBtn").on("click", function() {
			
			$("#ksForm").attr({
				"action":"kojiForm.pc",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
			
		});
		$("#ssBtn").on("click", function() {
			alert("화면새로고침 >>> : ");
			$("#ksForm").attr({
				"action":"kojiSelectAll.pc",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
			
		});
		$(document).on("click", "#chkAll", function() {
			if($(this).prop("checked")) {
				$(".mid").prop("checked", false);
				
			}
			
		});
		$(document).on("click", "#mid", function() {
			if($(this).prop("checked")) {
				$(".mid").prop("checked", false);
				$(this).prop("checked", true);
				
			}
			
		});
		$("#dBtn").on("click", function() {
			
			$("#ksForm").attr({
				"action":"kojiDelete.pc",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
			
		});
		$("#sssBtn").on("click", function() {
			
			$("#ksForm").attr({
				"action":"kojiSelect.pc",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
			
		});
	});

</script>
</head>
<body>
<h3>SelectAllpage</h3>
<% 
request.setCharacterEncoding("UTF-8");
Object obj = request.getAttribute("listAll");

if(obj == null) {return;}

List<KojiVO> list = (List<KojiVO>)obj;
int nCnt = list.size();
%>

<form action="ksForm" id="ksForm" name="ksForm">
<table border="1" align="center">
<thead>
<th>
<input type="checkbox" id="chkAll" name="chkAll" class="chkAll"/>
</th>
<th>순번</th>
<th>아이디</th>
<th>공지글제목</th>
<th>공지글내용</th>
</thead>
<% 
if(nCnt>0) {
	
	for(int i = 0; i<list.size(); i++) {
		
		KojiVO kvo = list.get(i);
%>
<tbody>
<td>
<input type="checkbox" id="mid" name="mid" class="mid" value="<%= kvo.getMid() %>"/>
</td>
<td><%= i+1 %></td>
<td><%= kvo.getMid() %></td>
<td><%= kvo.getKtitle() %></td>
<td><%= kvo.getKcontent() %></td>
</tbody>




<% 
	}
}
%>
<td colspan="5">
<input type="button" id="iBtn" value="등록"/>
<input type="button" id="ssBtn" value="조회"/>
<input type="button" id="dBtn" value="삭제"/>
<input type="button" id="sssBtn" value="공지사항글내용수정"/>
</td>
</table>
</form>
</body>
</html>