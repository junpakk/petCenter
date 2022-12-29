<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("memPasswordUpdate.jsp >>> : ");
	
	String mid = (String)request.getAttribute("mid");
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
		
		var boolPw = false;
		
		// 비밀번호 체크, 올바른 비밀번호
		$("#pwCheck").click(function(){
			console.log(" pwCheck 함수 진입");
			
			pwcheck();
		});
		
		// 폼태그 데이터 컨트롤러에 보내기 수정
		$("#updateBtn").on("click", function() {
			
			if (!boolPw){
				alert("올바른 비밀번호를 입력해주세요");
				$("#mpw_condi").attr("hidden", false);
				return false;
			}
			
			$("#pwForm").attr({
				'action':'memPasswordUpdate.pc',
				'method':'POST',
				'enctype':'application/x-www-form-urlencoded'
			}).submit();
		});
	});
	
	function pwcheck() {
		
		var pwVal = $("#mpw").val();
		var pwVal_r = $("#mpw_r").val();
		
		//const CHECK_PW = /^[a-zA-Z0-9]{8,20}/;
		const CHECK_PW = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()])[A-Za-z\d!@#$%^&*()]{8,20}$/;
			
		if (!CHECK_PW.test(pwVal)){
			alert("올바른 비밀번호를 입력해주세요");
			$("#mpw_condi").attr("hidden", false);
			boolPw = false;
			return false;
		}
		
		if(pwVal == pwVal_r){
			alert("비밀번호가 같습니다.");
			$("#mpw").prop('readOnly', true);
			$("#mpw_r").prop('readOnly', true);
			$("#mpw").css('background-color', 'Bisque');
			$("#mpw_r").css('background-color', 'Bisque');
			$("#mpw_condi").attr("hidden", true);
			boolPw = true;
			return true;
		}else{
			alert("비밀번호가 다릅니다.");
			$("#mpw").val('');
			$("#mpw_r").val('');
			$("#mpw").focus();
			$("#mpw_condi").attr("hidden", false);
			boolPw = false;
			return false;
		}
		
	}
	
</script>
</head>
<body>
<div id="container">
<form name="pwForm" id="pwForm">
	<table class="table table-sm table-bordered w-auto" align="center">
		<thead>
			<tr>
				<td >
					<h2 style="text-align:center;">Pet Center 비밀번호 수정</h2>
				</td>
			</tr>
		</thead>
		
		<tbody>
			<tr>
				<td>
					<input type="hidden" name="mid" id="mid" value="<%= mid %>" />
					<input type="text" name="mpw" id="mpw" placeholder="8 ~ 20자리"  /><br/>
					<input type="text" id="mpw_r" name="mpw_r" placeholder="영문 숫자 특수문자"  />
					<input type="button" value="비밀번호확인" id="pwCheck" class="btn btn-success btn-sm"/><br/>
					<span id="mpw_condi"style="color:Red;" hidden>8~20자 영문, 숫자, 특수문자</span>
				</td>
			</tr>
		</tbody>
		
		<tfoot>
			<tr >
				<td colspan="2">
					<button type="button" id="updateBtn" class="btn btn-primary btn-lg">수정하기</button>
				</td>
			</tr>
		</tfoot>
		
	</table>
</form>
</div>
</body>
</html>