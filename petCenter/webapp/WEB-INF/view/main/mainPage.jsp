<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%@ page import="main.pc.member.vo.MemberVO" %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("mainPage.jsp 진입 >>> : ");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>PET CENTER MAIN</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
메인페이지
<div>
<%
	String mnum = "";
	String mid = "";
	Object obj = session.getAttribute("KID");
	
	if (obj != null) {
		MemberVO lmvo = (MemberVO)obj;
		mnum = lmvo.getMnum();
		mid = lmvo.getMid();
%>
	<p>
		<%= mid %> 님 안녕하세요!! <br>
		<a href="logout.pc">로그아웃</a> | 
		정보수정
	</p>
<% 
	}else{
%>
	<p>
		<a href="loginForm.pc" >로그인</a> |
		<a href="memInsertForm.pc" >회원가입</a>
	</p>
<%
	}
%>		
</div>
</body>
</html>