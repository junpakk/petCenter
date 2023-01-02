<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collection" %>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<style>
	.arrow {
		text-decoration-line: none;
	}
</style>

<% request.setCharacterEncoding("UTF-8"); %>
<%

	Logger logger = LogManager.getLogger(getClass());
	logger.info("memPaging.jsp 진입");
	
	/************************************
	전달해야 할 변수
	************************************/
	String url = null;
	String str = null;
	
	url = request.getParameter("url");
	logger.info("url >>> : " + url);
	
	str = request.getParameter("str");
	logger.info("str >>> : " + str);
	
	if(str != null && str.length() > 0){
		str = str + "&";
		logger.info("str + & >>> : " + str);
	}
	
	/************************************
	페이지 네비게이션 관련 변수
	************************************/
	
	// 한페이지에 보여질 게시물의 갯수
	int pageSize = 0;
	
	// 그룹의 크기
	int groupSize = 0;
	
	// 현재페이지
	int curPage = 0;
	
	// 전체 게시물의 갯수
	int totalCount = 0;
	
	// 전체 페이지의 갯수
	int pageCount = 0;
	
	if(request.getParameter("pageSize") != null){
		pageSize = Integer.parseInt(request.getParameter("pageSize"));
		logger.info("pageSize >>> : " + pageSize);
	}
	
	if(request.getParameter("groupSize") != null){
		groupSize = Integer.parseInt(request.getParameter("groupSize"));
		logger.info("groupSize >>> : " + groupSize);
	}
	
	if(request.getParameter("curPage") != null){
		curPage = Integer.parseInt(request.getParameter("curPage"));
		logger.info("curPage >>> : " + curPage);
	}
	
	if(request.getParameter("totalCount") != null){
		totalCount = Integer.parseInt(request.getParameter("totalCount"));
		logger.info("totalCount >>> : " + totalCount);
	}
	
	// 전체게시물수와 페이지크기를 가지고 전체 페이지 개수를 게산함
	// 소수점에 따라 계산상의 오류가 없도록 한것임.
	// 전체 페이지수 = 전체게시물수 / 한페이지에 보일 게시물 수
	// ceil : 올림처리하여 소숫점을 올림처리
	// + 0.0 : 나누는 값을 실수로 변경
	// 		40		 =		400		/		10
	pageCount = (int)Math.ceil(totalCount / (pageSize + 0.0));
	logger.info("pageCount >>> : " + pageCount);
	
	// 현재 그룹 설정
	//		0	 =		1 - 1  /	5
	//		1	 =		6 - 1  /	5
	// 1페이지부터 5페이지까지  0번 그룹
	// 6페이지부터 10페이지까지 1번 그룹
	int curGroup = (curPage-1) / groupSize;
	logger.info("curGroup >>> : " + curGroup);
	
	//		0	 =		0	*	5
	//		5	 =		1	*	5
	// 1페이지부터 5페이지까지는  1페이저전 0페이지를 가르킴
	// 6페이지부터 10페이지까지는 1페이저전 5페이지를 가르킴
	int linkPage = curGroup * groupSize;
	logger.info("linkPage >>> : " + linkPage);
%>
<p align="center" style="margin:2px">
<%
	//이전 그룹이 존재 할 때
	if(curGroup > 0){
%>
	<a class="arrow" href="<%=url %>?<%=str %>curPage=1" style="text-decoration-line: none;">
		<img src="/petCenter/img/map/arrowLeft.png" height="25px" width="25px">
	</a>&nbsp;&nbsp;&nbsp;
	<a class="arrow" href="<%=url %>?<%=str %>curPage=<%=linkPage%>" style="text-decoration-line: none;">
		<img src="/petCenter/img/map/arrowLeft1.png" height="25px" width="25px">
	</a>&nbsp;&nbsp;&nbsp;
<%
	}else{// 이전그룹이 없을 때
%>
	<img src="/petCenter/img/map/arrowLeft.png" height="25px" width="25px">&nbsp;&nbsp;&nbsp;
	<img src="/petCenter/img/map/arrowLeft1.png" height="25px" width="25px">&nbsp;&nbsp;&nbsp;
<%
	}
	
	// 다음 링크를 위해 증가시킴
	linkPage++;
	logger.info("linkPage++ >>> : " + linkPage);
	// 0 -> 1
	
	// while 문 내부에서 사용할 변수 선언 루프횟수 = 그룹사이즈
	int loopCount = groupSize;
	logger.info("loopCount >>> : " + loopCount);
	// 5
	
	// 그룹범위내에서 페이지 링크만듬
	// 루프횟수를 1씩 감소시키면서 0이 되면 루프종료
	// 만들어야할 링크페이지가 전체 페이지보다 커지면 루프종료
	while((loopCount > 0) && (linkPage <= pageCount)){
		
		if(linkPage == curPage){
			logger.info("그룹범위내에서 페이지 링크 if : 현재페이지");
			// 현재페이지로 가는 링크는 없어도 된다
%>
		[<%= linkPage %>]&nbsp;
<%
		}else{
			logger.info("그룹범위내에서 페이지 링크 else : 다른페이지");
			// 그룹내부의 다른페이지로 가는 링크 생성
			//[2][3][4][5]
%>
		[<a href="<%= url %>?<%= str %>curPage=<%=linkPage%>"><%=linkPage%></a>]&nbsp;
<%
		}
		// 반복문 증감연산자
		linkPage++;
		loopCount--;
		
	}//end of while
%>&nbsp;&nbsp;<%
	// 다음 그룹이 존재 할때
	if(linkPage <= pageCount){
		logger.info("다음 그룹이 있는 경우 linkPage >>> : " + linkPage);
		logger.info("다음 그룹이 있는 경우 pageCount >>> : " + pageCount);
%>
		<a class="arrow" href="<%=url %>?<%=str %>curPage=<%=linkPage%>" style="text-decoration-line: none;">
			<img src="/petCenter/img/map/arrowRight1.png" height="25px" width="25px">
		</a>&nbsp;&nbsp;&nbsp;
		<a class="arrow" href="<%=url %>?<%=str %>curPage=<%=pageCount%>" style="text-decoration-line: none;">
			<img src="/petCenter/img/map/arrowRight.png" height="25px" width="25px">
		</a>&nbsp;&nbsp;&nbsp;
<%
	}else{ // 다음 그룹이 없을 때
		logger.info("다음 그룹이 없는 경우 linkPage >>> : " + linkPage);
		logger.info("다음 그룹이 없는 경우 pageCount >>> : " + pageCount);
%>
	<img src="/petCenter/img/map/arrowRight1.png" height="25px" width="25px">&nbsp;&nbsp;&nbsp;
	<img src="/petCenter/img/map/arrowRight.png" height="25px" width="25px">&nbsp;&nbsp;&nbsp;
<%
	}
%>

</p>