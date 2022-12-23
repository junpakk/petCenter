<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="org.apache.log4j.LogManager" %>  
<%@ page import="org.apache.log4j.Logger" %>   
    
<%-- <%@ page import="main.pc.community.vo.CommunityVO" %> --%>
<%@ page import="java.util.List" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/petCenter/calendar_datepicker/jquery-ui-1.12.1/jquery-ui.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/petCenter/calendar_datepicker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
  <%

	int pageSize = 0;
	int groupSize = 0;
	int curPage = 0;
	int totalCount = 0;
	String search = "";
	String key = "";
	String start = "";
	String end = "";
	
	Object objPaging = request.getAttribute("pagingVO");
/* 	CommunityVO pagingVO = (CommunityVO)objPaging;
	
	search = pagingVO.getSearchFilter();
	key = pagingVO.getKeyword();
	start = pagingVO.getStartDate();
	end = pagingVO.getEndDate(); */
  
  
  
  %>
<script type="text/javascript">

	$(document).ready(function(){
		alert("jQuery ready() 함수 블럭 진입 : ");
		
		$("#search_btn").click(function(){
			alert('검색버튼 클릭! 전체조회 조건검색');
			
			$("#tipList").attr({
				"method":"GET",
				"action":"tipBoardSelectAll.pc"
			}).submit();
		});
		
		$("#startDate").datepicker({
			showOn: "button",
			buttonImage: "/petCenter/calendar_datepicker/images/calendar.gif",
			dateFormat: 'yy-mm-dd',
			buttonImageOnly: false,
			buttonText: "Select date"
		});
		
		$("#endDate").datepicker({
			showOn: "button",
			buttonImage: "/petCenter/calendar_datepicker/images/calendar.gif",
			dateFormat: 'yy-mm-dd',
			buttonImageOnly: false,
			buttonText: "Select date"
		
		});
		
		// 메인
		$(document).on("click", "#mainBtn", function(){
			console.log("mainBtn");
			location.href="mainPage.pc";
		});
		
	
		// 전체 조회
		$(document).on("click", "#selectAllBtn", function(){
			console.log("selectBtn");
			location.href="tipBoardSelectAll.pc";	
		});
		
		// 게시글 조회		
		function select(){
			
			var f = document.getElementById("tipList");
			f.method="GET";
			f.action="communitySelect.pc"
			f.enctype="multipart/form-data"
			f.submit();
			
		}
		
	});
</script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("tipBoard.jsp");
%>
<h3>게시판 목록</h3>
<hr>

<form name="tipList" id="tipList">
<table border="1" align="center">
<thead>
<tr>
<td colspan="7">
	<select id="search" name="search">
			<option type="hidden">--카테고리--</option>
			<option value="bcc_01">강아지</option>
			<option value="bcc_02">고양이</option>
			<option value="bcc_03">그 외</option>
		</select>
	<select id="searchFilter" name="searchFilter">
			<option hidden>선택하세요</option>
			<option value="key_01">제목</option>
			<option value="key_02">내용</option>
		</select>
		<input type="text" id="keyword" name="keyword" value="" placeholder="검색어 입력">
		<!-- 
		<input tye="text id="startDate" name="startDate" style="text-align:left; width:100px; height:13px;" placeholder="시작일">
		 -->
		 <input type="text" id="startDate" name="startDate" size="10" placeholder="시작일">
		 ~
		<!-- 
		<input tye="text id="endDate" name="endDate" style="text-align:left; width:100px; height:13px;" placeholder="종료일">
		 -->
		<input type="text" id="endDate" name="endDate" size="10" placeholder="종료일">
		<input type="button" id="search_btn" name="search_btn" value="검색">
		<input type="reset" id="reset_btn" name="reset_btn" value="리셋">
</td>
</tr>
<tr>
	<th>글번호</th>
	<th>카테고리</th>
	<th>제목</th>
	<th>작성자</th>
	<th>파일</th>
	<th>작성일</th>
	<th>조회수</th>
</tr>
</thead>
<%-- <%
	
	Object obj = request.getAttribute("selectListAll");
	if (obj == null){ return; }
	
	List<CommunityVO> list = (List<CommunityVO>)obj;
	if (list.size() > 0){
		
		for (int i=0; i <list.size(); i++){
			CommunityVO cvo = list.get(i);
			
			// 페이징 세팅
			pageSize = Integer.parseInt(pagingVO.getPageSize());
			groupSize = Integer.parseInt(pagingVO.getGroupSize());
			curPage = Integer.parseInt(pagingVO.getCurPage());
			totalCount = Integer.parseInt(cvo.getTotalCount());
%>
<tbody>
<tr>
	<td><%=i+1 %></td>
	<td><%=cvo.getBcc %></td>
	<td><a href="javascript:select();"><%=cvo.getBctitle() %></a></td>
	<td><%=cvo.getMid() %></td>
	<td><img src="/petCenter/fileupload/pc/<%=cvo.getBcphoto() %>" onerror="this.onerror=null; this.src='/petCenter/img/null.jpg';" border="1" width="25" height="25" alt="image"></td>
	<td><%=cvo.getUdate() %></td>
	<td><%=cvo.getbchit %></td>
	<input type="hidden" name="bcnum" id="bcnum" value="<%= cvo.getBcnum() %>" >
</tr>
<%
		}	
%>
		<tr>
		<td colspan="7" align="right">
		<jsp:include page="tipBoardPaging.jsp" flush="true">
			<jsp:param name="url" value="tipBoardSelectAll.pc"></jsp:param>
			<jsp:param name="str" value="searchFilter=${pagingKVO.searchFilter}&keyword=${pagingKVO.keyword }&startDate=${pagingKVO.startDate }&endDate=${pagingKVO.endDate }"></jsp:param>
			<jsp:param name="pageSize" value="<%=pageSize %>"></jsp:param>
			<jsp:param name="groupSize" value="<%=groupSize %>"></jsp:param>
			<jsp:param name="curPage" value="<%=curPage %>"></jsp:param>
			<jsp:param name="totalCount" value="<%=totalCount %>"></jsp:param>
		</jsp:include>
		</td>
		</tr>
<%
	}

%> --%>
<tr>
	<td>
		<input type="button" value="메인으로" id="mainBtn">
	</td>
	<td colspan="6" align="right">
		<input type="button" value="전체조회" id="selectAllBtn">
		<input type="button" value="게시글 조회" id="selectBtn">
	</td>
</tr>
</tbody>
</table>
</form>
</body>
</html>