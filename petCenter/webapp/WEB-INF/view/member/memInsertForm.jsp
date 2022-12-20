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
	alert("javascript");
	
	$(document).ready(function() {
		alert("jQuery");
		
		// 아이디 중복체크, 올바른 아이디
		
		// 비밀번호 체크, 올바른 비밀번호
		$("#pwCheck").click(function(){
			console.log(" pwCheck 함수 진입");
			
			var mpw = $("#mpw").val();
			var mpw_r = $("#mpw_r").val();
			
			if(mpw.length < 8 && mpw_r.length < 8){
				alert("비밀번호는 8자리 이상!!!");
				$("#mpw").val('');
				$("#mpw_r").val('');
				return false;
			}
			
			if(mpw == mpw_r){
				alert("비밀번호가 같습니다.");
				$("#mpw").prop('readOnly', true);
				$("#mpw_r").prop('readOnly', true);
				$("#mpw").css('background-color', 'Bisque');
				$("#mpw_r").css('background-color', 'Bisque');
				return true;
			}else{
				alert("비밀번호가 다릅니다.");
				$("#mpw").val('');
				$("#mpw_r").val('');
				$("#mpw").focus();
				return false;
			}
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
			
			$("#memForm").attr({
				'action':'memInsert.pc',
				'method':'POST',
				'enctype':'application/x-www-form-urlencoded'
			}).submit();
			
		});
	});
	
</script>

<style type="text/css">

	.mem{ text-align: center;}
	#notNull{ color: red; }
	
</style>
</head>

<body>
<div id="container">

<form name="memForm" id="memForm">
<table class="table table-sm table-bordered w-auto" align="center">
<thead>
<tr>
	<td colspan="2">
		<h2 style="text-align:center;">Pet Center 회원가입</h2>
	</td>
</tr>
</thead>

<tbody>

<tr>
	<td class="mem" id="notNull">아이디</td>
	<td>
		<input type="text" name="mid" id="mid" placeholder="아이디체크"  />
		<input type="button" name="midbtn" id="midbtn" value="아이디확인" class="btn btn-success btn-sm" />
<!-- 		<span id="midchange" style="color:red">8자이상입력</span> -->
	</td>
</tr>

<tr>
	<td class="mem" id="notNull">비밀번호</td>
	<td>
		<input type="text" name="mpw" id="mpw" placeholder="8 ~ 20자리"  /><br/>
		<input type="text" id="mpw_r" name="mpw_r" placeholder="영문 숫자 특수문자"  />
		<input type="button" value="비밀번호확인" id="pwCheck" class="btn btn-success btn-sm"/><br/>
	</td>
</tr>

<tr>
	<td class="mem">이름</td>
	<td><input type="text" name="mname" id="mname" /></td>
</tr>

<tr>
	<td class="mem" id="notNull">이메일</td>
	<td>
		<input type="text" name="memail1" id="memail1" style="width:150px" />
		@ <input type="text" name="memail2" id="memail2" style="width:100px" placeholder="직접입력"/>
		<select name="memail3" id="memail3" style="width:100px; margin-right:10px">
			<option value="1" selected>직접입력</option>
			<option value="naver.com" >naver.com</option>
			<option value="gmail.com" >gmail.com</option>
			<option value="daum.net" >daum.net</option>
			<option value="kakao.com" >kakao.com</option>
		</select>
	</td>
</tr>

<tr>
	<td class="mem" >휴대폰</td>
	<td>
		<select name="mhp1" id="mhp1">
			<option value="010" selected>010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
		</select>
		- <input type="text" name="mhp2" id="mhp2" size="2"/>
		- <input type="text" name="mhp3" id="mhp3" size="2"/>
	</td>
</tr>

<tr>
	<td class="mem">기호동물</td>
	<td>
		<input type="checkbox" name="mpetArr" value="mp0" />강아지
		<input type="checkbox" name="mpetArr" value="mp1" />고양이
	</td>
</tr>

<tr>
	<td class="mem">자기소개</td>
	<td>
		<textarea name="minfo" id="minfo" rows="5" cols="49" placeholder="자기소개글 작성해주세요"></textarea>
	</td>
</tr>

</tbody>

<tfoot>
<tr >
	<td colspan="2">
		<button type="button" id="btn" class="btn btn-primary btn-lg">가입하기</button>
<!-- 		<button type="reset">다시 </button> -->
	</td>
</tr>
</tfoot>

</table>
</form>
</div>
</body>
</html>