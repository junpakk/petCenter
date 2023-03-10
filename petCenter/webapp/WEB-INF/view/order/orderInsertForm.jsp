<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import=" org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%@ page import="java.util.List" %>
<%@ page import="main.pc.cart.vo.CartVO" %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("orderInsertForm.jsp 진입: ");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문정보 입력페이지</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		//우편번호
		$('#ozoneBtn').click(function(){
			console.log("#ozonecode 클릭: ");
			new daum.Postcode({
				oncomplete: function(data){
					$('#ozonecode').val(data.zonecode);//5자리 새우변번호, zonecode 다음주소코드	
					$('#oroadaddress').val(data.roadAddress);//도로명주소, roadAddress 다음주소코드
					$('#ojibunaddress').val(data.jibunAddress);//지번주소, jibunAddress 다음주소코드
				}
			}).open();
		});//end of #ozonecode
		
		
		//#orderBtn 주문버튼(바로 DB에 데이터 넘어가도록)
		$('#orderBtn').click(function(){
			console.log("#orderBtn 클릭: ");
			if(confirm("주문하시겠습니까?")){
				console.log("주문");
				
				var cnum = [];
				//each(), 다건 주문 포함
				$("#orderForm").each(function(){
					cnum.push($(this).val());
					console.log(cnum);
				});//end of each
				
				$("#orderForm").attr({
					 'action':'orderInsert.pc'
					,'method':'GET'
				}).submit();
			};
		});//end of #orderBtn
	});//end of ready()

</script>
<style>

	td {
		padding:10px;
	}
	
</style>
</head>
<body>
<form name="orderForm" id="orderForm">
	<jsp:include page="../include/header.jsp" flush="true">
		<jsp:param name="url" value="produectSelectAll.jsp"/>
	</jsp:include>
<table border="1" style="margin:0 auto;">
	<tr><br/><h2 align="center">주문정보입력</h2><br/></tr>
	<tr>
		<td colspan="6" align="left">
			<font size="3" style="color:black;"><h4>&nbsp;&nbsp;1. 주문확인</h4></font>
		</td>
	</tr>
	<tr>
		<td class="" style="text-align:center">주문 상품명</td>
		<td class="" style="text-align:center">수량</td>
		<td class="" style="text-align:center">주문금액</td>
		<td class="" style="text-align:center">합계</td>
	</tr>
<%
	Object obj = request.getAttribute("listAll");
	if(obj == null) {return;}
	
	List<CartVO> list = (List<CartVO>) obj;
	
	int delivery = 2500;
	int priceSum = 0;
	
	if(list.size()>0){
		
		logger.info("list.size(): "+ list.size());
		for(int i=0; i<list.size(); i++){
			CartVO cvo = list.get(i);
			logger.info("cvo: "+ cvo);
		
			int price = 0;
			price = Integer.parseInt(cvo.getCprice())*Integer.parseInt(cvo.getCcnt());
			priceSum += price;
%>	
	<tr>
		<td class="" id="" style="text-align:center;">
		<div style="margin:10px">
			<input type="hidden" id="cnum" name="cnum" value="<%= cvo.getCnum() %>">
			<input type="hidden" id="mnum" name="mnum" value="<%= cvo.getMnum() %>">
			<img src="/petCenter/fileupload/product/<%= cvo.getCphoto() %>" width="50" height="50"><br>
			<%= cvo.getCname() %>
		</div>
		</td>
		<td class="" style="text-align:center"><%= cvo.getCcnt() %>개</td>
		<td class="" style="text-align:right"><%= cvo.getCprice() %> 원&nbsp;&nbsp;</td>
		<td class="" style="text-align:right"><%= price %> 원&nbsp;&nbsp;</td>
	</tr>
<%
		}//end of for
	}//end of if
	
	if(priceSum >= 30000){
		delivery = 0;
		priceSum += delivery;
	}else{
		delivery = 2500;
		priceSum += delivery;
	}
%>
	<tr>
		<td class="" style="text-align:center">배송비</td>
		<td class="" style="text-align:right" colspan="3"><%= delivery %> 원&nbsp;&nbsp;
		<input type="hidden" name="delivery" value="<%= delivery %>">
		</td>
	</tr>
	<tr>
		<td class="" style="text-align:center">총합계</td>
		<td class="" style="text-align:right" colspan="3"><%= priceSum %> 원&nbsp;&nbsp;
		<input type="hidden" id="tprice" name="tprice" value="<%= priceSum %>">
		</td>
	</tr>
	<tr>
		<td colspan="6" align="left"><font size="3" style="color:black;"><h4>&nbsp;&nbsp;2. 배송지 정보</h4></font></td>
	</tr>
	<tr>
		<td align="center">받으실분</td>
		<td colspan="5"><input type="text" name="mname" id="mname"/></td>
	</tr>
	
	<tr>
		<td align="center">핸드폰</td>
		<td colspan="5">
			<select name="mhp" id="mhp">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
			</select>
			- <input type="text" name="mhp1" id="mhp1" size="4" maxlength="4">
			- <input type="text" name="mhp2" id="mhp2" size="4" maxlength="4">
		</td>
	</tr>
	
	<tr>
		<td align="center">주소</td>
		<td colspan="5">
			<input type="text" name="ozonecode" id="ozonecode" placeholder="우편번호" style="width:150px;" maxlength="6">
			<input type="button" name="ozoneBtn" id="ozoneBtn" value="우편번호 찾기" style="width:90px; background:rgba(0,0,0,0.2);  font-size:15px; padding:5px; border:0px;"><br/>
			<input type="text" name="oroadaddress" id="oroadaddress" placeholder="도로명주소" style="width:250px;"><br/>
			<input type="text" name="oroadaddressdetail" id="oroadaddressdetail" placeholder="도로명 상세주소" style="width:250px;"><br/>
			<input type="text" name="ojibunaddress" id="ojibunaddress" placeholder="지번주소" style="width:250px;">
		</td>
	</tr>
	
	<tr>
		<td colspan="6" style="text-align:center">
			<button type="button" id="orderBtn" style="width:90px; background:rgba(0,0,0,0.2);  font-size:15px; padding:5px; border:0px;">주문</button>
			<button type="button" id="paymentBtn" style="width:90px; background:rgba(0,0,0,0.2);  font-size:15px; padding:5px; border:0px;">결제</button>
			<button type="reset" style="width:90px; background:rgba(0,0,0,0.2);  font-size:15px; padding:5px; border:0px;">다시</button>
		</td>
	</tr>
</table>
	<br><br><br>
	<jsp:include page="../include/footer.jsp" flush="true">
		<jsp:param name="url" value="produectSelectAll.jsp"/>
	</jsp:include> 		
</form>
</body>
</html>