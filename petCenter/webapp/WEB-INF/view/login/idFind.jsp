<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PET CENTER IDFIND</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#mcomfirm").on("click", function(){
			console.log("mcomfirm >>> : ");
			
			let url = "idFindAuthnum.pc";
			let mnameVal = $("#mname").val();
			let memailVal = $("#memail").val();
			
			$.get(url
				,{"mname" : mnameVal, "memail" : memailVal}
				,function(data){
					//alert(data);
					var sVal = $(data).find("result").text();
					alert(sVal);
					
				 }
			);
		});
		
		// 폼태그 데이터 콘트롤러에 보내기
		$("#idbtn").on("click", function(){
			console.log("idbtn >>> : ");
			
			$('#idForm').attr({
				'action':'idFind.pc',
				'method':'POST',
				'enctype':'application/x-www-form-urlencoded'
			}).submit();
		});
		
		
		
	});

</script>

<style type="text/css">

	.align-middle{ text-align: center;}
	
</style>

</head>
<body>
<div class="container">
	<form name="idForm" id="idForm">
		<table border="1" class="table table-bordered w-auto" align="center">
			<thead>
				<tr>
					<td colspan="2"><h1 align="center">IdFind</h1></td>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td class="align-middle">이름</td>
					<td><input type="text" name="mname" id="mname" style="width:200px;"></td>
				</tr>
				
				<tr>
					<td class="align-middle">이메일</td>
					<td>
						<input type="text" name="memail" id="memail" style="width:200px;">
						&nbsp;&nbsp;<button type="button" id="mcomfirm" class="btn btn-success btn-sm">인증번호받기</button>
					</td>
				</tr>
				
				<tr>
					<td class="align-middle">인증번호</td>
					<td>
						<input type="text" name="authnum" id="authnum" style="width:200px;" placeholder="인증번호  6자리 숫자 입력">
						&nbsp;&nbsp;<button type="button" id="idbtn" class="btn btn-success btn-sm">&nbsp;아이디&nbsp;&nbsp;찾기&nbsp;</button>
					</td>
				</tr>
			</tbody>
				
		</table>
	</form>
</div>
</body>
</html>