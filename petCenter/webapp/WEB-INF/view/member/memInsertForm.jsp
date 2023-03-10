<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("memInsertForm.jsp >>> : ");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pet Center 회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
	//alert("javascript");
	
	var boolId = false;
	var boolPw = false;
	
	$(document).ready(function() {
		//alert("jQuery");
		
		$("#minfo").keyup(function(){
			cut_300(this);
		});
		
		// 아이디 중복체크, 올바른 아이디
		$("#midbtn").on("click", function(){
			console.log("idCheck >>> : ");
			
			//let mid = $("#mid").val();
			idcheck();
		});
		
		// 비밀번호 체크, 올바른 비밀번호
		$("#pwCheck").click(function(){
			console.log(" pwCheck 함수 진입");
			
			//var mpw = $("#mpw").val();
			//var mpw_r = $("#mpw_r").val();
			
			pwcheck();
		});
		
		// 이메일
		$("#memail3").change(function() {
			console.log("change 함수 진입 >>> : ")
			
			// $("개체").each(function(){})
			// jQuery 개체에 대해 반복하여 일치하는 각 요소에 대해 함수를 실행합니다.
			// while문 반복문이라고 생각하면 쉽다
			$("#memail3 option:selected").each(function() {
				 console.log("each option:seleted 진입 >>> : ");
				
				if($(this).val() == '1') { // 직접입력일 경우
					console.log("if $(this).val() >>> : " + $(this).val());
					
					var aa = $("#memail2").val();
					console.log("aa >>> : " + aa);
					
					$("#memail2").val(''); // 값 초기화
					console.log("memail2.val >>> : " + $("#memail2").val());
					$("#memail2").attr("readOnly", false); // 활성화
					
				} else { // 직접입력이 아닐경우
					console.log("else >>>  : " + $(this).val());
					
					$("#memail2").val($(this).text()); // 선택값 입력
					console.log("memail2.val >>> : " + $("#memail2").val());
					$("#memail2").attr("readOnly", true); // 비활성화
					
				}
			});
		});
		
		
		// 폼태그 데이터 컨트롤러에 보내기
		$("#btn").on("click", function() {
			
			if (!boolId){
				alert("올바른 아이디를 입력해주세요");
				$("#mid_condi").attr("hidden", false);
				return false;
			}
			if (!boolPw){
				alert("올바른 비밀번호를 입력해주세요");
				$("#mpw_condi").attr("hidden", false);
				return false;
			}
			if ($("#memail1").val() == "" || $("#memail2").val() == ""){
				alert("올바른 이메일을 입력해주세요");
				return false;
			}
			
			$("#memForm").attr({
				'action':'memInsert.pc',
				'method':'POST',
				'enctype':'application/x-www-form-urlencoded'
			}).submit();
			
			
		});
	});
	
	function idcheck() {
		
		let idVal = $("#mid").val();
		const CHECK_ID = /^[a-zA-Z0-9]{5,20}/;
		
		if (!CHECK_ID.test(idVal)){
			alert("올바른 아이디를 입력해주세요");
			$("#mid_condi").attr("hidden", false);
			boolId = false;
			return false;
		}
		
		let idCheckURL = "memIdCheck.pc";
		let reqType = "POST";
		let dataParam = {mid: idVal,};
		console.log("idCheckURL >>> : " + idCheckURL);
		console.log("reqType >>> : " + reqType);
		console.log("dataParam.kid >>> : " + dataParam.kid);
	
		$.ajax({
			url: idCheckURL,
			type: reqType,
			data: dataParam,
			success: whenSuccess,
			error: whenError
		});
	
		function whenSuccess(resData){
// 			alert("whenSuccess resData >>> : " + resData);
			if ("ID_YES" == resData){
				alert("사용가능한 아이디입니다");
				$("#mid").css('background-color', 'Bisque');
				$("#mid").prop('readOnly', 'true');
				$("#mpw").focus();
				$("#mid_condi").attr("hidden", true);
				boolId = true;
			}else if("ID_NO" == resData){
				alert("이미 사용중인 아이디입니다");
				$("#mid").val('');
				$("#mid").focus();
				$("#mid_condi").attr("hidden", false);
				boolId = false;
			}
		}
		function whenError(e){
			alert("e >>> : " + e.responseText);
		}
	}
	
	function pwcheck() {
		
		var pwVal = $("#mpw").val();
		var pwVal_r = $("#mpw_r").val();
		
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
	
	//한글 포함 문자열 길이
	function getTextLength(s){
		var len = 0;
		for(var i=0; i < s.length; i++){
			if(escape(s.charAt(i)).length == 6){
				len++;
			}
			len++;
		}
		return len;
	}
	function cut_300(obj){
		var t = $(obj).val();
		var l = t.length;
		while(getTextLength(t) > 300){
			l--;
			t= t.substring(0, l);
		}
		$(obj).val(t);
	}
	
	
</script>

<style type="text/css">

	.align-middle{ 
		text-align: center;
		white-space:nowrap;
		font-size: 22px;
	}
	#notNull{ color: red; }
	
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

<form name="memForm" id="memForm">
<table border="1" align="center" class="table table-sm table-striped table-hover table-bordered" >
<thead>
<tr>
	<td colspan="2">
		<h2 style="text-align:center;">Pet Center 회원가입</h2>
	</td>
</tr>
</thead>

<tbody>

<tr>
	<td class="align-middle" id="notNull" style="width:120px;">아이디</td>
	<td style="width:420px;">
		<div class="form-row">
			<div class=" col-6 " >
				<input type="text" name="mid" id="mid" placeholder="5~20자 영문 또는 숫자" maxlength="20" class="form-control" />
			</div>
			<div class=" col-2">
				<input type="button" name="midbtn" id="midbtn" value=" 아이디확인 " class="btn btn-success " />
			</div>
		</div>
		<span id="mid_condi" style="color:red" hidden>&nbsp;&nbsp;5~20자 영문 또는 숫자</span>
	</td>
</tr>

<tr>
	<td class="align-middle" id="notNull">비밀번호</td>
	<td>
		<div class="form-row">
			<div class=" col-6 " >
				<input type="password" name="mpw" id="mpw" placeholder="8 ~ 20자리" maxlength="20" class="form-control"/>
			</div>
		</div>
		<div class="form-row">
			<div class=" col-6 " >
				<input type="password" id="mpw_r" name="mpw_r" placeholder="영문 숫자 특수문자 포함" maxlength="20" class="form-control"/>
			</div>
			<div class=" col-2">
				<input type="button" value="비밀번호확인" id="pwCheck" class="btn btn-success btn"/>
			</div>
		</div>
		<span id="mpw_condi"style="color:Red;" hidden>8~20자 영문, 숫자, 특수문자</span>
	</td>
</tr>

<tr>
	<td class="align-middle">이름</td>
	<td>
		<div class="form-row">
			<div class=" col-6 " >
				<input type="text" name="mname" id="mname" class="form-control"/>
			</div>
		</div>
	</td>
</tr>

<tr>
	<td class="align-middle" id="notNull">이메일</td>
	<td>
		<div class="form-row">
			<div class=" col-4 "  >
				<input type="text" name="memail1" id="memail1" placeholder="필수입력" style="width:150px" class="form-control"/>
			</div>
			<div class=" col-1 align-middle" >
				<span style="font-size:22px; vertical-align: middle;" >&nbsp;&nbsp;@&nbsp;</span>
			</div>
			<div class=" col-3 " >
				<input type="text" name="memail2" id="memail2" style="width:100px" placeholder="직접입력" class="form-control"/>
			</div>
			<div class=" col-3 " >
				<select name="memail3" id="memail3" class="custom-select" style="width:115px; margin-right:10px">
					<option value="1" selected>직접입력</option>
					<option value="naver.com" >naver.com</option>
					<option value="gmail.com" >gmail.com</option>
					<option value="daum.net" >daum.net</option>
					<option value="kakao.com" >kakao.com</option>
				</select>
			</div>
			</div>
		<span id="memail_condi"style="color:Red;" hidden>필수입력정보</span>
	</td>
</tr>

<tr>
	<td class="align-middle" >휴대폰</td>
	<td >
		<div class="form-row">
			<div class=" col-3 " style="padding-right:0; ">
				<select name="mhp1" id="mhp1" class="custom-select" >
					<option value="010" selected>010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select>
			</div>
			<div class=" col-1 align-middle"  >
				<span style="font-size:22px; vertical-align: middle;" >-</span>
			</div>
			<div class=" col-3 " style="padding:0;" >
				<input type="text" name="mhp2" id="mhp2" maxlength="4"  class="form-control"/>
			</div>
			<div class=" col-1 align-middle" >
				<span style="font-size:22px; vertical-align: middle;" >-</span>
			</div>
			<div class=" col-3 " style="padding:0;" >
				<input type="text" name="mhp3" id="mhp3" maxlength="4"  class="form-control"/>
			</div>
		</div>
	</td>
</tr>

<tr>
	<td class="align-middle">기호동물</td>
	<td >
		<div class="form-check form-check-inline">
		&nbsp;&nbsp;
		<input type="checkbox" name="mpetArr" value="mp0" class="form-check-input " />
		<span style="font-size:22px; vertical-align: middle;" >강아지&nbsp;&nbsp;</span>
		<input type="checkbox" name="mpetArr" value="mp1" class="form-check-input"/>
		<span style="font-size:22px; vertical-align: middle;" >고양이&nbsp;&nbsp;</span>
		<input type="checkbox" name="mpetArr" value="mp2" class="form-check-input"/>
		<span style="font-size:22px; vertical-align: middle;" >새&nbsp;&nbsp;</span>
		<input type="checkbox" name="mpetArr" value="mp3" class="form-check-input"/>
		<span style="font-size:22px; vertical-align: middle;" >파충류</span>
		</div>
	</td>
</tr>

<tr>
	<td class="align-middle">자기소개</td>
	<td>
		<div class="form-row" style="margin:0 auto;">
			<div>
			<textarea name="minfo" id="minfo" rows="6" cols="47" placeholder="자기소개글 작성해주세요" class="form-control"></textarea>
			</div>
		</div>
	</td>
</tr>

</tbody>

<tfoot>
<tr >
	<td colspan="2" align="right">
		<button type="button" id="btn" class="btn btn-info btn-lg">가입하기</button>
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