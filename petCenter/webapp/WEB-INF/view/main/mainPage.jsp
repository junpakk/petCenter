<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%@ page import="main.pc.member.vo.MemberVO" %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("mainPage.jsp ���� >>> : ");
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
����������
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
		<%= mid %> �� �ȳ��ϼ���!! <br>
		<a href="logout.pc">�α׾ƿ�</a> | 
		��������
	</p>
<% 
	}else{
%>
	<p>
		<a href="loginForm.pc" >�α���</a> |
		<a href="memInsertForm.pc" >ȸ������</a>
	</p>
<%
	}
%>		
</div>
</body>
</html>