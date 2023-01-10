<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="main.pc.member.vo.MemberVO" %>
<%@ page import="main.pc.notice.vo.NoticeVO"%>
<%@ page import="java.util.List"%>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("noticeSelectAll.jsp >>> : ");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		$("#insertBtn").on("click", function() {
			
			$("#nsForm").attr({
				"action" : "noticeInsertForm.pc",
				"method" : "GET",
				"enctype" : "application/x-www-form-urlencoded"
			}).submit();
		});
		$("#selectallBtn").on("click", function() {
			alert("새로고침>>> : ");
			$("#nsForm").attr({
				"action" : "noticeSelectAll.pc",
				"method" : "GET",
				"enctype" : "application/x-www-form-urlencoded"
			}).submit();
		});
		$("#selectformBtn").on("click", function() {
	
			$("#nsForm").attr({
			"action" : "noticeSelectForm.pc",
			"method" : "GET",
			"enctype" : "application/x-www-form-urlencoded"
			}).submit();
		});
	
	});
  
</script>

<style type="text/css">

	.align-middle{ text-align: center;}
	
</style>
</head>
<body>
<% 
request.setCharacterEncoding("UTF-8");
Object obj = request.getAttribute("listAll");
if(obj == null) {return;}
List<NoticeVO> list = (List<NoticeVO>)obj;
int nCnt = list.size();
%>

<form action="nsForm" id="nsForm" name="nsForm">
	<jsp:include page="../include/header.jsp" flush="true">
		<jsp:param name="url" value="produectSelectAll.jsp"/>
	</jsp:include>
	<br><br><br><br><br><br>
<div class="container">
<table border="1" align="center" class="table table-sm table-striped table-hover table-bordered" >
<thead>
<tr>
<td colspan="5" >
<h3 style="text-align:center;">공지사항 전체조회</h3>
</td>
</tr>
<th class="align-middle">
<input type="checkbox" id="chkAll" name="chkAll" class="chkAll"/>
</th>
<th class="align-middle">순번</th>
<th class="align-middle">글제목</th>
<th class="align-middle">글내용</th>
<th class="align-middle">사진</th>
</thead>


<% 

if(nCnt>0) {
	
	for(int i = 0; i<nCnt; i++) {
		NoticeVO nvo = list.get(i);
%>
<tbody>
<td class="align-middle">
<input type="checkbox" id="bntitle" name="bntitle" class="bntitle" value="<%=nvo.getBntitle()  %>"/>
</td>
<td class="align-middle"><%=i+1 %></td>
<td class="align-middle"><%=nvo.getBntitle() %></td>
<td class="align-middle"><%=nvo.getBncontent() %></td>
<td class="align-middle"><img src="/petCenter/fileupload/notice/<%=nvo.getBnphoto() %>" width="50px" height="50px"/></td>
</tbody>
<% 		
		
		
	}
}
%>
<td colspan="5">
<%
	String admin = "";
	Object objAdmin = session.getAttribute("KNUM");
	if (objAdmin != null) {
		admin = (String)objAdmin;
		logger.info("mnum >>> : " + admin);
		if(admin.equals("M0000000001")){
%>
<input type="button" id="insertBtn" value="등록" class="btn btn-success btn-sm"/>
<%
		}
	}
%>
<input type="button" id="selectallBtn" value="전체조회" class="btn btn-secondary btn-sm"/>
<input type="button" id="selectformBtn" value="내용확인" class="btn btn-warning btn-sm"/>
</td>
</table>
</div>
	<br><br><br><br><br><br>
	<jsp:include page="../include/footer.jsp" flush="true">
		<jsp:param name="url" value="produectSelectAll.jsp"/>
	</jsp:include> 
</form>
</body>
</html>