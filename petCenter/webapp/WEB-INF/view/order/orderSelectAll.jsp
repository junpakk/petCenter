<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import=" org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%@ page import="main.pc.order.vo.OrderVO" %>
<%@ page import="java.util.List" %> 

<% request.setCharacterEncoding("UTF-8");%> 
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("orderSelectAll.jsp 진입: ");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문목록 확인창</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$('#shoppingBtn').click(function(){
		console.log("#shoppingBtn 클릭: ");
		const mnum = document.getElementById("mnum");
		location.href="productSelectAll.pc?mnum="+mnum;
		});
});//end of ready()
	
</script>
</head>
<body>
<h3 align="center">주문정보 확인창</h3><hr width="1000px">

<form name="orderSelectAll" id="orderSelectAll">
<table border="1" align="center">
<thead>
	<tr>
		<td style="text-align:center">
			<input type="checkbox" name="chk" id="chk" class="chk">
		</td>
		<td style="text-align:center">주문일</td>
		<td style="text-align:center">상품명</td>
		<td style="text-align:center">가격</td>
		<td style="text-align:center">수량</td>
		<td style="text-align:center">합계</td>
		<td style="text-align:center">배송비</td>
	</tr>
</thead>
<tbody>
<%
	String pnum = "";
	String pprice = "";
	String ppricesum = "";
	String opsum = "";
	int delivery = 2500;
	int sum = 0;
	String sumV = "";
	
	Object obj = request.getAttribute("orderListAll");
	if(obj == null){
%>
<tr>
	<td colspan="8" align="center">
		<h2>주문목록 정보가 없습니다.</h2>
	</td>
</tr>
<%
	}else{
		List<OrderVO> list = (List<OrderVO>)obj;
		int nCnt = list.size();
		logger.info("list.size(): "+ list.size());
		
		for(int i=0; i<nCnt; i++){
			OrderVO ovo = list.get(i);
%>
<tr>
	<td style="text-align:center">
		<input type="hidden" id="mnum" value="<%= ovo.getMnum() %>">
		<input type="checkbox" name="onum" id="onum" class="onum" value=<%= ovo.getOnum() %>>
	</td>
	<td style="text-align:center"><%= ovo.getIdate() %></td>
	<td style="text-align:center"><%= ovo.getOname() %></td>
<%
			int Oprice = 0;
			Oprice = Integer.parseInt(ovo.getOpsum())/Integer.parseInt(ovo.getOcnt());

			opsum = ovo.getOpsum();
			if(Integer.parseInt(opsum)>=30000){
				delivery = 0;
			}
%>
	<td style="text-align:center"><%= Oprice  %> 원</td>
	<td style="text-align:center"><%= ovo.getOcnt() %> 개</td>
	<td style="text-align:center">총 <%= opsum %> 원</td>
	<td style="text-align:center"><%= delivery %> 원</td>
</tr>
<%
		}//end of for
	}//end of else
%>

<tr>
	<td colspan="8" style="text-align:right">
		<input type="button" value="쇼핑하기" id="shoppingBtn">
	</td>
</tr>
</tbody>
</table>
</form>
</body>
</html>