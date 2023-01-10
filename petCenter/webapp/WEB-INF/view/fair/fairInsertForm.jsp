<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>박람회 게시판 글쓰기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){	 
		//alert("jQuery ready() 함수 블럭 진입 : ");
	
	
		//보내기
		$(document).on("click", "#insertbtn", function(){
			//alert("insertBtn 버튼 블럭 진입 : ");
			console.log("insertBtn : ");
	
		$('#fairForm').attr({
			'action':'fairInsert.pc',
			'method':'POST',
			'enctype':'multipart/form-data'
		}).submit();
	});
});

</script>
<style>
	.align-middle{ 
		text-align: center;
		white-space:nowrap;
	}
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
<div class="col-6">

<form name="fairForm" id="fairForm">
<table border="1" align="center" class="table table-sm table-striped table-hover table-bordered" >
	<tr>
		<td colspan="2" align="center"><h2>박람회 게시판 글쓰기</h2></td>
	</tr>

	<tr>
		<td align="center" class="align-middle">박람회 이름</td>
		<td><input type="text" name="bfname" id="bfname" size="53"></td>
	</tr>
	<tr>
		<td  align="center" class="align-middle">박람회 날짜</td>
		<td><input type="text" name="bfdate" id="bfdata" size="53"></td>
	</tr>
	<tr>
		<td  align="center" class="align-middle">박람회 장소</td>
		<td><input type="text" name="bfplace" id="bfplace" size="53"></td>
	</tr>
	<tr>
		<td  align="center" class="align-middle">사진</td>
		<td>
		<input type="file" name="bfphoto" id="bfphoto">
	</td>
	</tr>
	<tr>
		<td colspan="2" align="right">				
		<input type="button" value="글쓰기" id="insertbtn">
	</td>				
	</tr>
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