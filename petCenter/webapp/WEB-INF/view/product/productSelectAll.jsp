<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="main.pc.product.vo.ProductVO" %> 
<%@ page import="java.util.List" %>  

<%@ page import=" org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<% request.setCharacterEncoding("UTF-8");%> 
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("productSelectAll.jsp 진입: ");
	
	//페이징 세팅
// 	int pageSize = 0;
// 	int groupSize = 0;
// 	int curPage = 0;
// 	int totalCount = 0;
	
// 	Object objPaging = request.getAttribute("pagingPVO");//페이징
// 	ProductVO pagingPVO = (ProductVO)objPaging;
	
/*
일단 가장 큰 차이점은 둘의 리턴 타입이다.
getParameter()메서드의 경우 String타입을 리턴,
getAttribute()는 Object 타입을 리턴하기 때문에 주로 빈 객체나 다른 클래스를 받아올 때 사용된다.

getParameter()는 웹브라우저에서 전송받은 request영역의 값을 읽어오고
getAttribute()의 경우 setAttribute()속성을 통한 설정이 없으면 무조건 null값을 리턴한다.
*/
	Object obj = request.getAttribute("listAll");//상품정보
	List<ProductVO> list = (List<ProductVO>)obj;
	int nCnt = list.size();
	logger.info("list.size(): "+ list.size());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체상품목록</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
	});	

</script>
<style>

tbody {
  display: inline-block;
  width: 250px;
  height: 300px;
  padding: 5px;
  border: 1px solid none;    
  background-color: none; 
}

table {
	align: center;
}
	
</style>
</head>
<body>
<h3 align="center">PetCenter가 추천하는 내 아이 취향저격 상품</h3>
<form name="productList" id="productList">
<table border="1">

	<thead>
		<tr>
			<th>사료 간식 용품 카테고리</th>
		</tr>
	</thead>

<%
	String pnum = "";
	String pprice = "";
	
	for(int i=0; i<nCnt; i++){
		ProductVO pvo  = list.get(i);
		pnum = pvo.getPnum();
		pprice = pvo.getPprice();
// 		pprice = NumUtil.comma(pprice);//',' 제거
		
		//페이징 세팅
// 		pageSize = Integer.parseInt(pagingPVO.getPageSize());
// 		groupSize = Integer.parseInt(pagingPVO.getGroupSize());
// 		curPage = Integer.parseInt(pagingPVO.getCurPage());
// 		totalCount = Integer.parseInt(pvo.getTotalCount());
%>
<%
	for(i=0; i<4; i++){
%>
	<tbody>
			<tr>
				<td>
					<a>
						사진 및 상세보기링크<img src=""/>
					</a>
				</td>
			</tr>
			<tr>
				<td>
					우측 장바구니 버튼
				</td>
			</tr>
			<tr>
				<td>
					좌측메뉴명
				</td>
			</tr>
			<tr>
				<td>
					좌측 가격(원)
				</td>
			</tr>
	</tbody>
<%
	}
%>
	
<%
	}//end of for
%>

	<tfoot>
	<!-- <tr> -->
	<!-- 	<td colspan="3"> -->
	<%-- 		<jsp:include page="productPaging.jsp" flush="true"> --%>
	<%-- 			<jsp:param name="url" value="productSelectAll.pjb"/> --%>
	<%-- 			<jsp:param name="str" value=""/> --%>
	<%-- 			<jsp:param name="pageSize" value="<%=pageSize%>"/> --%>
	<%-- 			<jsp:param name="groupSize" value="<%=groupSize%>"/> --%>
	<%-- 			<jsp:param name="curPage" value="<%=curPage%>"/> --%>
	<%-- 			<jsp:param name="totalCount" value="<%=totalCount%>"/> --%>
	<%-- 		</jsp:include> --%>
	<!-- 	</td> -->
	<!-- </tr> -->
	</tfoot>
</table>
</form>
</body>
</html>