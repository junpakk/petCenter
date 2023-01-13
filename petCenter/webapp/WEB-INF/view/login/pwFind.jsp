<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PET CENTER PWFIND</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#mcomfirm").on("click", function(){
			console.log("mcomfirm >>> : ");
			
			let idVal = $("#mid").val();
			const CHECK_ID = /^[a-zA-Z0-9]{5,20}/;
			
			if (!CHECK_ID.test(idVal)){
				alert("올바른 아이디를 입력해주세요");
				$("#mid_condi").attr("hidden", false);
				return false;
			}else{
				$("#mid_condi").attr("hidden", true);
			}
			
			let url = "pwFindAuthnum.pc";
			let midVal = $("#mid").val();
			let memailVal = $("#memail").val();
			
			$.get(url
				,{"mid" : midVal, "memail" : memailVal}
				,function(data){
					//alert(data);
					var sVal = $(data).find("result").text();
					alert(sVal);
					
				 }
			);
		});
		
		// 폼태그 데이터 콘트롤러에 보내기
		$("#pwbtn").on("click", function(){
			console.log("idbtn >>> : ");
			
			$('#pwForm').attr({
				'action':'pwFind.pc',
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
<jsp:include page="../include/header.jsp" flush="true">
	<jsp:param name="url" value="produectSelectAll.jsp"/>
</jsp:include>
<br><br><br><br><br><br>

<div class="container">
<div class="row">
<div class="col">
</div>
<div class="col-6">

	<form name="pwForm" id="pwForm">
		<table border="1" class="table table-bordered w-auto" align="center">
			<thead>
				<tr>
					<td colspan="2"><h1 align="center">비밀번호 찾기</h1></td>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td class="align-middle">아이디</td>
					<td><input type="text" name="mid" id="mid" style="width:200px;">
					<br><span id="mid_condi" style="color:red" hidden>&nbsp;&nbsp;5~20자 영문 또는 숫자</span></td>
				</tr>
				
				<tr>
					<td class="align-middle">이메일</td>
					<td>
						<input type="text" name="memail" id="memail" style="width:200px;">
						&nbsp;&nbsp;<button type="button" id="mcomfirm" class="btn btn-success btn-sm">임시비밀번호 받기</button>
					</td>
				</tr>
				
				<tr>
					<td class="align-middle">임시비밀번호</td>
					<td>
						<input type="text" name="ppw" id="ppw" style="width:200px;" placeholder="임시비밀번호  8자리 숫자 입력">
						&nbsp;&nbsp;<button type="button" id="pwbtn" class="btn btn-success btn-sm">&nbsp;비밀번호&nbsp;바꾸기&nbsp;</button>
					</td>
				</tr>
			</tbody>
				
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