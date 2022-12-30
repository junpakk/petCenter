<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%@ page import="main.pc.member.vo.MemberVO" %>
<%@ page import="java.util.List" %>

<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("memSelect.jsp >>> : ");
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
	
	String mhp = mvo.getMhp();
	
	String memail = mvo.getMemail();
	
	String mpet = mvo.getMpet();
	logger.info("mpet >>> : " + mpet);
	String[] mpetArr = {"강아지", "고양이"};
	
	if (mpet != null && mpet.length() > 0){
		for(int i=0; i < mpetArr.length; i++) {
			mpet = mpet.replace(("mp"+String.valueOf(i)), mpetArr[i]);
		}
		mpet = mpet.replace(",", ", ");
	}else{
		mpet = "없음";
	}
	
	String minfo = mvo.getMinfo();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pet Center 회원정보</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
	alert("javascript");
	
	$(document).ready(function() {
		alert("jQuery");
		
		// 폼태그 데이터 컨트롤러에 보내기
		$("#btnUpdate").on("click", function() {
			
			$("#memForm").attr({
				'action':'memSelectForm.pc',
				'method':'POST',
				'enctype':'application/x-www-form-urlencoded'
			}).submit();
		});
		
		// 폼태그 데이터 컨트롤러에 보내기
		$("#btnCalendar").on("click", function() {
			
			location.href="calendar.pc";
			
		});
	});
	
</script>

<style type="text/css">

	.align-middle{ text-align: center;}
/* 	#notNull{ color: red; } */
	
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
		<input type="hidden" name="mnum" id="mnum" value="<%= mnum %>"/>
		<%= mid %>
	</td>
</tr>

<tr>
	<td class="align-middle">이름</td>
	<td><%= mname %></td>
</tr>

<tr>
	<td class="align-middle" id="notNull">이메일</td>
	<td>
		<%= memail %>
	</td>
</tr>

<tr>
	<td class="align-middle" >휴대폰</td>
	<td>
		<%= mhp %>
	</td>
</tr>

<tr>
	<td class="align-middle">기호동물</td>
	<td>
		<%= mpet %>
	</td>
</tr>

<tr>
	<td class="align-middle">자기소개</td>
	<td style="width:420px;">
		<%= minfo %>
	</td>
</tr>

</tbody>

<tfoot>
<tr >
	<td colspan="2">
		<button type="button" id="btnUpdate" class="btn btn-primary btn-lg">수정하기</button>
		<button type="button" id="btnCalendar" class="btn btn-info btn-lg">일정관리</button>
<!-- 		<button type="reset">다시 </button> -->
	</td>
</tr>
</tfoot>

</table>
</form>
</div>
</body>
</html>