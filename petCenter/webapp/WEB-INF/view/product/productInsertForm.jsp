<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$(document).on("click", "#pBtn", function(){
			alert("#pBtn 버튼 클릭: ");
			console.log("#pBtn 버튼 클릭: ");
			$("#productInsertForm").attr({
				 'action' :'productInsert.pc'
				,'method' :'POST'
				,'enctype':'multipart/form-data'
			}).submit();//보내기
		});//end of #pBtn
	});//end of ready

</script>
</head>
<body>

<h3 style="text-align:center;"><b>상품등록 페이지</b></h3>
<hr>	
<form name="productInsertForm" id="productInsertForm">
<table  border="1" align="center">
	<tr>
		<td colspan="2" align="center">상품등록</td>				
	</tr>
	<tr>
		<td>상품번호</td>		
		<td><input type="text" name="pnum" id="pnum" style="width:150px" readonly></td>
	</tr>
	<tr>
		<td>상품이름</td>
		<td><input type="text" name="pname" id="pname" style="width:300px"></td>
	</tr>
	<tr>
		<td>상품가격</td>
		<td><input type="text" name="pprice" id="pprice" style="width:300px"></td>
	</tr>
	<tr>
		<td>상품카테고리</td>
		<td><input type="text" name="pcategory" id="pcategory" style="width:80px"></td>
	</tr>
	<tr>
		<td>상품설명</td>
		<td>
		<textarea name="pdetail" id="pdetail" cols="50" rows="10" style="resize: none; width: 500px;"></textarea>
		</td>
	</tr>
	<tr>
		<td>상품사진</td>
		<td>
		<input type="file" name="pphoto" id="pphoto">
		</td>
	</tr>	
	<tr>
		<td colspan="2" align="right">				
		<input type="button" value="상품등록" id="pBtn">		
	</td>				
	</tr>
</table>
</form>
</body>
</html>