<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글쓰기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#nBtn").on("click", function() {
			$("#nForm").attr({
				"action":"noticeInsert.pc",
				"method":"POST",
				"enctype":"multipart/form-data"
			}).submit();
		});
		
	});
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
<form action="nForm" id="nForm" name="nForm">
<table border="1" align="center" class="table table-sm table-striped table-hover table-bordered" >
<thead>
<tr>
<th colspan="2" >
<h3 style="text-align:center;">공지사항 글쓰기</h3>
</th>
</tr>
</thead>
<tr>
<td class="align-middle" style="width:120px;">게시판번호</td>
<td>
<input type="text" id="bnnum" name="bnnum" readonly/>
</td>
</tr>
<tr>
<td class="align-middle">글제목</td>
<td>
<input type="text" id="bntitle" name="bntitle"/>
</td>
</tr>
<tr>
<td class="align-middle">글내용</td>
<td>
<!-- <input type="text" id="bncontent" name="bncontent"/> -->
<textarea name="bncontent" id="bncontent" rows="5" cols="49" placeholder="글내용 작성해주세요"></textarea>
</td>
</tr>
<tr>
<td class="align-middle">사진</td>
<td>
<input type="file" id="bnphoto" name="bnphoto" />
</td>
</tr>
<tr>
<td colspan="2" align="right">
<input type="button" id="nBtn" value="공지사항입력" class="btn btn-primary btn-lg"/>
</td>
</tr>
</table>
</form>
</div>
<br><br><br><br><br><br>
<jsp:include page="../include/footer.jsp" flush="true">
		<jsp:param name="url" value="produectSelectAll.jsp"/>
</jsp:include>
</body>
</html>