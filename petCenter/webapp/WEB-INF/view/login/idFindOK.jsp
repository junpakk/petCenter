<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="main.pc.member.vo.MemberVO"%>
<%@page import="java.util.List"%>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	Object obj = request.getAttribute("midFind");
	if (obj == null) return;
	
	List<MemberVO> list = (List<MemberVO>)obj;
	String mid = list.get(0).getMid();
	String idate = list.get(0).getIdate();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PET CENTER IDFIND OK</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

</script>

<style type="text/css">

	.align-middle{ text-align: center;}
	
</style>

</head>

<body>
<jsp:include page="../include/header.jsp" flush="true">
	<jsp:param name="url" value="produectSelectAll.jsp"/>
</jsp:include>
<br><br><br><br><br><br>

<div class="container">
<div class="row">
<div class="col">
</div>
<div class="col-3">

	<form name="idFindForm" id="idFindForm">
		<table border="1" class="table table-bordered w-auto" align="center">
			<thead>
				<tr>
					<td colspan="2"><h1 align="center">Id찾기 완료</h1></td>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td class="align-middle">아이디</td>
					<td><%= mid %></td>
				</tr>
				
				
				<tr>
					<td class="align-middle">등록일</td>
					<td><%= idate %></td>
				</tr>
			</tbody>
			
			<tfoot>
				<tr>
					<td colspan="2" align="center">
						<a href="loginForm.pc" >로그인</a> &nbsp;&nbsp;|&nbsp;&nbsp;
						<a href="pwFindForm.pc" >비밀번호찾기</a>
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>
<div class="col">
</div>
</div>
</div>

<br><br><br><br><br><br>
<jsp:include page="../include/footer.jsp" flush="true">
		<jsp:param name="url" value="produectSelectAll.jsp"/>
</jsp:include>
</body>
</html>