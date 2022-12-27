<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="main.pc.product.vo.ProductVO" %> 
<%@ page import="main.pc.common.NumUtil" %>
<%@ page import="main.pc.common.CommonUtils" %>
<%@ page import="java.util.List" %>  

<%@ page import=" org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<% request.setCharacterEncoding("UTF-8");%> 
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("productSelect.jsp 진입: ");
	
	Object obj = request.getAttribute("list");//상품상세정보
	List<ProductVO> list = (List<ProductVO>)obj;
	int nCnt = list.size();
	logger.info("list.size(): "+ list.size());
	
	ProductVO pvo = list.get(0);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 상세페이지</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
	});	

</script>
<style>
	
</style>
</head>
<%
	String pprice = "";
	pprice = pvo.getPprice();
	pprice = NumUtil.comma(pprice);//',' 추가
%>
<body>
	<table>
		<tr>
			<td>
				<img src="/petCenter/fileupload/product/<%= pvo.getPphoto() %>"/>
			</td>
			<td>
				<div>
					<div><%= pvo.getPname() %></div>
					<div><%= pprice %> 원</div>			
				</div>
				<div>연관태그 #강아지</div>
				<div>배송정보 배송비 2,500원 (30,000원 이상 무료배송)</div>
				<div>취소/교환/환불 팝업창</div>
				<hr>
			</td>
		</tr>
		
		<tr>
			<td >
				<div style="display: inline-block"><img src="/petCenter/fileupload/product/<%= pvo.getPphoto() %>" width="40px" height="40px"/>
				<div style="display: inline-block">
					<div style="display: inline-block"><%= pvo.getPname() %></div>
					<div><%= pvo.getPprice() %> 원</div>
				</div>
			</td>
			<td>장바구니 구매하기</td>
		</tr>
	</table>
</body>
</html>