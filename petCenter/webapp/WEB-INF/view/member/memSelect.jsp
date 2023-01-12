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
	
	String mname = "";
	if(mvo.getMname() != null) mname = mvo.getMname();
	
	String mid = mvo.getMid();
	
	String mpw = mvo.getMpw();
	
	String mhp = "";
	if(mvo.getMhp() != null) mhp = mvo.getMhp();
	
	String memail = mvo.getMemail();
	
	String mpet = mvo.getMpet();
	logger.info("mpet >>> : " + mpet);
	String[] mpetArr = {"강아지", "고양이", "조류", "파충류"};
	
	if (mpet != null && mpet.length() > 0){
		for(int i=0; i < mpetArr.length; i++) {
			mpet = mpet.replace(("mp"+String.valueOf(i)), mpetArr[i]);
		}
		mpet = mpet.replace(",", ", ");
	}else{
		mpet = "없음";
	}
	
	String minfo = "";
	if(mvo.getMinfo() != null) minfo = mvo.getMinfo();
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
	//alert("javascript");
	
	$(document).ready(function() {
		//alert("jQuery");
		
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
	
</style>
</head>

<body>
<form name="memForm" id="memForm">
	<jsp:include page="../include/header.jsp" flush="true">
		<jsp:param name="url" value="produectSelectAll.jsp"/>
	</jsp:include>
<br><br><br>
<div class="container">
<div class="row">
<div class="col">
</div>
<div class="col col-6">
<table border="1" align="center" class="table table-sm table-striped table-hover table-bordered" >
<thead>
<tr>
	<td colspan="2">
		<h2 style="text-align:center;">Pet Center 회원정보</h2>
	</td>
</tr>
</thead>

<tbody>

<tr>
	<td class="align-middle" id="notNull" style="width:120px;">아이디</td>
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
	<td>
		<%= minfo %>
	</td>
</tr>

</tbody>

<tfoot>
<tr >
	<td colspan="2" align="right">
		<button type="button" id="btnUpdate" class="btn btn-primary btn-lg">수정하기</button>
		<button type="button" id="btnCalendar" class="btn btn-info btn-lg">일정관리</button>
	</td>
</tr>
<%
	String admin = "";
	Object objAdmin = session.getAttribute("KNUM");
	if (objAdmin != null) {
		admin = (String)objAdmin;
		logger.info("mnum >>> : " + admin);
		if(admin.equals("M0000000001") && mnum.equals("M0000000001")){
%>
<tr>
	<td colspan="2" align="center">
		<h2>관리자 사이트 설정</h2>
	</td>
</tr>
<tr >
	<td colspan="2" align="center">
		<button type="button" onclick="location.href='memSelectAll.pc'" class="btn btn-danger" >회원관리</button>
		<button type="button" onclick="location.href='noticeInsertForm.pc'" class="btn btn-warning" >공지사항작성</button>
		<button type="button" onclick="location.href='productInsertForm.pc'" class="btn btn-success" >상품등록</button>
		<button type="button" onclick="location.href='fairInsertForm.pc'" class="btn btn-success" >박람회등록</button>
		<button type="button" onclick="location.href='chartdata.pc'" class="btn btn-success" >차트</button>
		
	</td>
</tr>
<%
		}
	}
%>
</tfoot>
</table>
</div>
<div class="col">
</div>
</div>
</div>
	<br><br><br>
	<jsp:include page="../include/footer.jsp" flush="true">
		<jsp:param name="url" value="produectSelectAll.jsp"/>
	</jsp:include> 	
</form>

</body>
</html>