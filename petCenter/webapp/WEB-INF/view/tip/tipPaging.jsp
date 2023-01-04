<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>    
    
    
<%
	Logger logger= Logger.getLogger(this.getClass());

	String url = null;
	String str = null;
	
	url = request.getParameter("url");
	logger.info("url >>> "+url);
	
	str = request.getParameter("str");
	logger.info("str >>> "+str);
	
	if(str != null && str.length() > 0){
		str = str + "&";
		logger.info("str + & >>> "+str);
	}
%>
<%
	int pageSize = 0;
	int groupSize = 0;
	int totalCount = 0;
	int curPage = 0;
	int pageCount = 0;
	
	if(request.getParameter("pageSize") != null){
		pageSize = Integer.parseInt(request.getParameter("pageSize"));
		logger.info("pageSize >>> "+pageSize);
	}

	if(request.getParameter("groupSize") != null){
		groupSize = Integer.parseInt(request.getParameter("groupSize"));
		logger.info("groupSize >>> "+groupSize);
	}
	
	if(request.getParameter("curPage") != null){
		curPage = Integer.parseInt(request.getParameter("curPage"));
		logger.info("curPage >>> "+curPage);
	}
	
	if(request.getParameter("totalCount") != null){
		totalCount = Integer.parseInt(request.getParameter("totalCount"));
		logger.info("totalCount >>> "+totalCount);
	}
	
	pageCount = (int)Math.ceil(totalCount/(pageSize+0.0));
	logger.info("pageCount >>> "+pageCount);
	
	int curGroup = (curPage-1)/groupSize;
	logger.info("curGroup >>> "+curGroup);
	
	int linkPage = curGroup*groupSize;
	logger.info("linkPage >>> "+linkPage);
%>
	<p align="center">
<%
	if(curGroup > 0){
%>
		<a href="<%=url %>?<%=str %>curPage=1">
		<img src="/petCenter/img/doublearrowleft.png" width="20" height="15"/></a>&nbsp;
		<a href="<%=url %>?<%=str %>curPage=<%=linkPage %>">
		<img src="/petCenter/img/arrowleft.png" width="20" height="15"/></a>
<%		
	}else{
%>
		<img src="/petCenter/img/doublearrowleft.png" width="20" height="15"/>&nbsp;
		<img src="/petCenter/img/arrowleft.png" width="20" height="15"/>
<%
	}

	linkPage++;
	logger.info("linkPage++ >>> "+linkPage);
	
	int loopCount = groupSize;
	logger.info("loopCount >>> "+loopCount);
	
	while((loopCount > 0)&&(linkPage <= pageCount)){
		if(linkPage == curPage){
			logger.info("그룹범위내에서 페이지 링크 if");
%>
			<%=linkPage %>
<%
		}else{
			logger.info("그룹범위내에서 페이지 링크 else");
%>						
			[<a href="<%=url %>?<%=str %>curPage=<%=linkPage %>"><%=linkPage %></a>]
<%			
		}
		linkPage++;
		loopCount--;
	}
	
	if(linkPage <= pageCount){
		logger.info("다음그룹이 있는 경우 linkPage >>> "+linkPage);
		logger.info("다음그룹이 있는 경우 pageCount >>> "+pageCount);
		
%>
		<a href="<%=url%>?<%=str%>curPage=<%=linkPage%>">
		<img src="/petCenter/img/arrowright.png" width="20" height="15"/></a>&nbsp;
		<a href="<%=url%>?<%=str%>curPage=<%=pageCount%>">
		<img src="/petCenter/img/doublearrowright.png" width="20" height="15"/></a>
<%
	}else{
		logger.info("다음그룹이 있는 경우 linkPage >>> "+linkPage);
		logger.info("다음그룹이 있는 경우 pageCount >>> "+pageCount);
		logger.info("다음그룹이 있는 경우 else >>> ");
%>
		<img src="/petCenter/img/arrowright.png" width="20" height="15"/>&nbsp;
		<img src="/petCenter/img/doublearrowright.png" width="20" height="15"/>
<%
	}
%>
	</p>