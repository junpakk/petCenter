<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
    
<meta charset="UTF-8">
<title>커뮤니티 조회조건</title>
<link rel="stylesheet" href="/khsSpring/calendar_datepicker/jquery-ui-1.12.1/jquery-ui.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/khsSpring/calendar_datepicker/jquery-ui-1.12.1/jquery-ui.min.js"></script>

<%
	Logger logger = Logger.getLogger(this.getClass());

	String searchFilter = null;
	String keyword = null;
	String startDate = null;
	String endDate = null;
	String mid = null;
	
	searchFilter = request.getParameter("searchFilter");
	keyword = request.getParameter("keyword");
	startDate = request.getParameter("startDate");
	endDate = request.getParameter("endDate");
	mid = request.getParameter("mid");

	logger.info("Strings are >>> "+searchFilter+"/"+keyword+"/"+startDate+"/"+endDate+"/"+mid);
%>

<script type="text/javascript">
		//alert("javacript block >>> ");
	
	$(document).ready(function(){
			//alert("jQuery ready() block >>> ");
		
		$("#searchBtn").click(function(){

			var search = $("#communityForm option:selected").val();
			console.log("search >>> "+search);
			
			$("#communityForm").prop({
					"action" : "khsMCDoSelectA.khs?",
					"method" : "GET"
			}).submit();
		});
		
		$("#startDate").datepicker({
			showOn : "button",
			buttonImage : "/khsSpring/calendar_datepicker/images/calendar.gif",
			buttonImageOnly : false,
			dateFormat : "yy-mm-dd",
			buttonText : "Select date"
		});
		
		$("#endDate").datepicker({
			showOn : "button",
			buttonImage : "/khsSpring/calendar_datepicker/images/calendar.gif",
			buttonImageOnly : false,
			dateFormat : "yy-mm-dd",
			buttonText : "Select date"
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

	});
	/*
	showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다. 
	buttonImage: "/application/db/jquery/images/calendar.gif", // 버튼 이미지 
	buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다. 
	changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다. 
	changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다. 
	minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다. 
	nextText: '다음 달', // next 아이콘의 툴팁. 
	prevText: '이전 달', // prev 아이콘의 툴팁. 
	numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다. 
	stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
	yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가. 
	showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
	currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널 
	closeText: '닫기', // 닫기 버튼 패널 
	dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식. 
	showAnim: "slide", //애니메이션을 적용한다. 
	showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
	dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식. 
	monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식. 
	yearRange: "2010:2013" //연도 범위
	*/		
	
</script>

<form name="communityForm" id="communityForm">
	<select id="searchFilter" name="searchFilter">
		<option value="key_00">전체 -------------</option>
		<option value="key_01">카테고리</option>
		<option value="key_02">제목</option>
	</select>
	<input type="hidden" id="mid" name="mid" value="<%=mid%>">
	<input type="text" id="keyword" name="keyword" placeholder="검색어 입력">&nbsp;&nbsp;
	<input type="text" id="startDate" name="startDate" size="12" placeholder="시작일">
	<input type="text" id="endDate" name="endDate" size="12" placeholder="종료일">
	<input type="button" id="searchBtn" name="searchBtn" value="검색">
	<input type="reset" id="resetBtn" name="resetBtn" value="리셋">
	
</form>