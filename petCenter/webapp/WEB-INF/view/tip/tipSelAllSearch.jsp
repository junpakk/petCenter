<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
    
<meta charset="UTF-8">
<title>커뮤니티 조회조건</title>
<link rel="stylesheet" href="/petCenter/calendar_datepicker/jquery-ui-1.12.1/jquery-ui.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/petCenter/calendar_datepicker/jquery-ui-1.12.1/jquery-ui.min.js"></script>

<%
	Logger logger = Logger.getLogger(this.getClass());

	String searchFilter = null;
	String keyword = null;
	String startDate = null;
	String endDate = null;
	String mnum = null;
	String mid = null;
	
	searchFilter = request.getParameter("searchFilter");
	keyword = request.getParameter("keyword");
	startDate = request.getParameter("startDate");
	endDate = request.getParameter("endDate");
	mnum = request.getParameter("mnum");
	mid = request.getParameter("mid");

	logger.info("Strings are >>> "+searchFilter+"/"+keyword+"/"+startDate+"/"+endDate+"/"+mnum+"/"+mid);
%>

<script type="text/javascript">
	console.log("javacript block >>> ");
	
	$(document).ready(function(){
		console.log("jQuery ready() block >>> ");
		
		$("#searchBtn").click(function(){

			var search = $("#comsForm option:selected").val();
			console.log("search >>> "+search);
			
			$("#comsForm").prop({
					"action" : "comSelAll.pc?",
					"method" : "GET"
			}).submit();
		});

		$("#startDate").datepicker({
			dateFormat : "yy-mm-dd",
		});

		$("#endDate").datepicker({
			dateFormat : "yy-mm-dd",
		});
		
		if("<%=searchFilter%>" == null || "<%=searchFilter%>" == ""){
			$("#searchFilter").val("key_00");
		}else{
			$("#searchFilter").val("<%=searchFilter%>");
		}
		
		if("<%=keyword%>" == null || "<%=keyword%>" == ""){
			$("#keyword").val("");
		}else{
			$("#keyword").val("<%=keyword%>");
		}
		
		if("<%=startDate%>" == null || "<%=startDate%>" == ""){
			$("#startDate").val("");
		}else{
			$("#startDate").val("<%=startDate%>");
		}
	
		if("<%=endDate%>" == null || "<%=endDate%>" == ""){
			$("#endDate").val("");
		}else{
			$("#endDate").val("<%=endDate%>");
		}		

		$("#searchFilter").change(function(){
		    console.log("The text has been changed >>> "+$("#comsForm option:selected").val());
		    let searchKey = $("#comsForm option:selected").val();
		    
		    if(searchKey == "key_01"){$("#keyword").val("");$("#keyword").attr("readonly",false);$("#keyword").focus();}
		    else if(searchKey == "key_02"){$("#keyword").val("강아지");$("#keyword").attr("readonly", true);}
			else if(searchKey == "key_03"){$("#keyword").val("고양이");$("#keyword").attr("readonly", true);}
			else if(searchKey == "key_04"){$("#keyword").val("그외");$("#keyword").attr("readonly", true);}
			else{$("#keyword").val("");$("#keyword").attr("readonly", true);}
		});
	});
	
</script>

<form name="comsForm" id="comsForm">
	<select id="searchFilter" name="searchFilter">
		<option value="key_00">-------</option>
		<option value="key_01">글제목검색</option>
		<option value="key_02">강아지</option>
		<option value="key_03">고양이</option>
		<option value="key_04">그외</option>
	</select>
	<input type="hidden" id="mnum" name="mnum" value="<%=mnum%>">
	<input type="hidden" id="mid" name="mid" value="<%=mid%>">
	<input type="text" id="keyword" name="keyword" placeholder="검색어 입력" readonly>&nbsp;&nbsp;
	<input type="text" id="startDate" name="startDate" size="12" placeholder="시작일">
	<input type="text" id="endDate" name="endDate" size="12" placeholder="종료일">
	<input type="button" id="searchBtn" name="searchBtn" value="검색">
	<input type="reset" id="resetBtn" name="resetBtn" value="리셋">
	
</form>