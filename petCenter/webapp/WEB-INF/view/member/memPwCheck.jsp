<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("memPwCheck.jsp >>> : ");
	
	String mid = (String)request.getAttribute("mid");
	String memail = (String)request.getAttribute("memail");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pet Center 비밀번호 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		// 폼태그 데이터 컨트롤러에 보내기 수정
		$("#updateBtn").on("click", function() {
			
			$("#pwForm").attr({
				'action':'memPwUpdateForm.pc',
				'method':'POST',
				'enctype':'application/x-www-form-urlencoded'
			}).submit();
		});
	});
	
	function moveFocus(next){
		if(event.keyCode==13){
			document.getElementById(next).focus();
		}
	}
	
</script>
</head>
<body>
<jsp:include page="../include/header.jsp" flush="true">
	<jsp:param name="url" value="produectSelectAll.jsp"/>
</jsp:include>
<br><br><br><br><br><br><br><br><br>

<div class="container">
<div class="row">
<div class="col">
</div>
<div class="col-6">


<form name="pwForm" id="pwForm" >
	<table border="1" align="center" class="table table-sm table-striped table-hover table-bordered" >
		<thead>
			<tr>
				<td >
					<h2 style="text-align:center;">Pet Center <br>현재 비밀번호 입력</h2>
				</td>
			</tr>
		</thead>
		
		<tbody>
			<tr>
				<td align="center">
					<input type="hidden" name="mid" id="mid" value="<%= mid %>" />
					<input type="hidden" name="memail" id="memail" value="<%= memail %>" />
					<input type="text" style="display:none;">
					<input type="password" name="mpw" id="mpw" onkeydown=moveFocus("updateBtn")/><br/>
				</td>
			</tr>
		</tbody>
		
		<tfoot>
			<tr >
				<td colspan="2" align="right">
					<input type="button" id="updateBtn" class="btn btn-primary btn-lg" value="수정하기"/>
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

<br><br><br><br><br><br><br><br><br>
<jsp:include page="../include/footer.jsp" flush="true">
		<jsp:param name="url" value="produectSelectAll.jsp"/>
</jsp:include>
</body>
</html>