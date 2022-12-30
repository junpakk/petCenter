<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){	 
		alert("jQuery ready() 함수 블럭 진입 : ");
	
	
		//보내기
		$(document).on("click", "#insertbtn", function(){
			alert("insertBtn 버튼 블럭 진입 : ");
			console.log("insertBtn : ");
	
		$('#fairForm').attr({
			'action':'fairInsert.pc',
			'method':'POST',
			'enctype':'multipart/form-data'
		}).submit();
	});
});

</script>
</head>
<body>
<div class="container">
<form name="fairForm" id="fairForm">
<table border="1" align="center">
	<tr>
		<td colspan="2" align="center">박람회 게시판 글쓰기</td>				
	</tr>

	<tr>
		<td align="center">박람회 이름</td>
		<td><input type="text" name="bfname" id="bfname" size="53"></td>
	</tr>
	<tr>
		<td  align="center">박람회 날짜</td>.
		<td><input type="text" name="bfdate" id="bfdata" size="53"></td>
	</tr>
	<tr>
		<td  align="center">박람회 장소</td>
		<td><input type="text" name="bfplace" id="bfplace" size="53"></td>
	</tr>
	<tr>
		<td  align="center">사진</td>
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
</body>
</html>