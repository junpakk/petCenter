<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%@ page import="main.pc.member.vo.MemberVO" %>
<%@ page import="java.util.List" %>

<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("memSelectForm.jsp >>> : ");
%>
<%
	Object obj = request.getAttribute("list");
	if (obj == null) {return;}
	
	List<MemberVO> list = (List<MemberVO>)obj;
	if (list.size() != 1) {return;}
	
	MemberVO mvo = list.get(0);
	
	String mnum = mvo.getMnum();
	String mname = mvo.getMname();
	String mid = mvo.getMid();
	String mpw = mvo.getMpw();
	
	String[] mhpArr = mvo.getMhp().split("-");
	String mhp1 = mhpArr[0];
	String mhp2 = mhpArr[1];
	String mhp3 = mhpArr[2];
	
	String[] memailArr = mvo.getMemail().split("@");
	String memail1 = memailArr[0];
	String memail2 = memailArr[1];
	
	String mpet = mvo.getMpet();
	
	String minfo = mvo.getMinfo();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pet Center 회원정보수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
	alert("javascript");
	
	$(document).ready(function() {
		alert("jQuery");
		
		(function inputData(){
			$("#mnum").val('<%= mnum %>');
			$("#mname").val('<%= mname %>');
			$("#mid").val('<%= mid %>');
			
			$("#mhp1").val('<%= mhp1 %>');
			$("#mhp2").val('<%= mhp2 %>');
			$("#mhp3").val('<%= mhp3 %>');
			
			$("#memail1").val('<%= memail1 %>');
			$("#memail2").val('<%= memail2 %>');
			
			var memail2 = $("#memail2").val();
			var memails = ['naver.com', 'gmail.com', 'daum.net', 'kakao.com'];
			console.log("memails.length >>> : " + memails.length);
			
			for (var i=0; i < memails.length; i++){
				if(memail2 == memails[i]){
					$("#memail3").val(memail2);
					$("#memail2").attr("readOnly", true);
					console.log("memails[i] >>> : " + memails[i]);
					break;
				}
			}
			
			var mpet = '<%= mpet %>'
			var mpetArr = mpet.split(',');
			console.log("mpetArr >>> : " + mpetArr);
			
			for (var m in mpetArr){
				var mpetValue = mpetArr[m];
				console.log("mpetValue >>> : " + mpetValue);
				
				$(".mpetArr").each(function(){
					if($(this).val() == mpetValue){
						$(this).prop("checked", true);
						console.log("$(this).val() >>> : " + $(this).val());
						console.log("mpetValue >>> : " + mpetValue);
					}
				});
			}
		})();
		
		
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
		
		
		// 폼태그 데이터 컨트롤러에 보내기 수정
		$("#updateBtn").on("click", function() {
			
			$("#memForm").attr({
				'action':'memUpdate.pc',
				'method':'POST',
				'enctype':'application/x-www-form-urlencoded'
			}).submit();
			
		});
		
		// 폼태그 데이터 컨트롤러에 보내기 탈퇴
		$("#deleteBtn").on("click", function() {
			
			$("#memForm").attr({
				'action':'memDelete.pc',
				'method':'POST',
				'enctype':'application/x-www-form-urlencoded'
			}).submit();
			
		});
		
		// 폼태그 데이터 컨트롤러에 보내기 비밀번호수정
		$("#pwUpdate").on("click", function() {
			
			$("#memForm").attr({
				'action':'memPwCheck.pc',
				'method':'POST',
				'enctype':'application/x-www-form-urlencoded'
			}).submit();
			
		});
	});
	
</script>

<style type="text/css">

	.align-middle{ text-align: center;}
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
		<h2 style="text-align:center;">Pet Center 회원정보</h2>
	</td>
</tr>
</thead>

<tbody>

<tr>
	<td class="align-middle" id="notNull">아이디</td>
	<td>
		<input type="hidden" name="mnum" id="mnum" />
		<input type="text" name="mid" id="mid" readonly />
	</td>
</tr>

<tr>
	<td class="align-middle" id="notNull">비밀번호</td>
	<td>
<!-- 		<input type="text" name="mpw" id="mpw" placeholder="8 ~ 20자리"  /><br/> -->
<!-- 		<input type="text" id="mpw_r" name="mpw_r" placeholder="영문 숫자 특수문자"  /> -->
		<input type="button" value="비밀번호변경" id="pwUpdate" class="btn btn-success btn-sm"/><br/>
	</td>
</tr>

<tr>
	<td class="align-middle">이름</td>
	<td><input type="text" name="mname" id="mname" readonly/></td>
</tr>

<tr>
	<td class="align-middle" id="notNull">이메일</td>
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
	<td class="align-middle" >휴대폰</td>
	<td>
		<select name="mhp1" id="mhp1">
			<option value="010" selected>010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
		</select>
		- <input type="text" name="mhp2" id="mhp2" size="1"/>
		- <input type="text" name="mhp3" id="mhp3" size="1"/>
	</td>
</tr>

<tr>
	<td class="align-middle">기호동물</td>
	<td>
		<input type="checkbox" name="mpetArr" class="mpetArr" value="mp0" />강아지
		<input type="checkbox" name="mpetArr" class="mpetArr" value="mp1" />고양이
	</td>
</tr>

<tr>
	<td class="align-middle">자기소개</td>
	<td>
		<textarea name="minfo" id="minfo" rows="5" cols="49" placeholder="자기소개글 작성해주세요"><%= minfo %></textarea>
	</td>
</tr>

</tbody>

<tfoot>
<tr >
	<td colspan="2">
		<button type="button" id="updateBtn" class="btn btn-primary btn-lg">수정하기</button>
		<button type="button" id="btn" class="btn btn-danger btn-lg">탈퇴하기</button>
<!-- 		<button type="reset">다시 </button> -->
	</td>
</tr>
</tfoot>

</table>
</form>
</div>
</body>
</html>