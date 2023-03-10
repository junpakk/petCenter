<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<!-- <script  src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$(document).on("click", "#pBtn", function(){
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
<jsp:include page="../include/header.jsp" flush="true">
	<jsp:param name="url" value="produectSelectAll.jsp"/>
</jsp:include>
<br><br><br><br><br><br>

<div class="container">
<div class="row">
<div class="col">
</div>
<div class="col-6">

<!-- <h3 style="text-align:center;"><b>상품등록 페이지</b></h3> -->
<!-- <hr>	 -->
<form name="productInsertForm" id="productInsertForm">
<table  border="1" align="center" class="table table-sm table-striped table-hover table-bordered">
	<tr>
		<td colspan="2" align="center"><h2>상품등록</h2></td>				
	</tr>
	<tr>
		<td>상품번호</td>		
		<td><input type="text" name="pnum" id="pnum" placeholder="상품번호" readonly></td>
	</tr>
	<tr>
		<td>상품이름</td>
		<td><input type="text" name="pname" id="pname" placeholder="상품이름"> </td>
	</tr>
	<tr>
		<td>상품가격</td>
		<td><input type="text" name="pprice" id="pprice" placeholder="상품가격"> </td>
	</tr>
	<tr>
		<td>상품카테고리</td>
		<td>
			<select name="pcategory1" id="pcategory1" style="width:80px">
				<option value="1">강아지</option>
				<option value="2">고양이</option>
			</select>
			<select name="pcategory2" id="pcategory2" style="width:80px">
				<option value="1">사료</option>
				<option value="2">간식</option>
				<option value="3">용품</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>상품설명</td>
		<td>
		<textarea name="pdetail" id="pdetail" cols="50" rows="10" style="resize: none;" placeholder="상품설명"></textarea>
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