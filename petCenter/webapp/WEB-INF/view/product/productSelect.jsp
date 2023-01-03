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
	
	String pname = "";
	String pprice = "";
	String pphoto = "";
	String pphotoPath = "";
	String pnum = "";
	String ccnt = "";
	
	pname = pvo.getPname();
	pprice = pvo.getPprice();
	pphoto = pvo.getPphoto();
	pphotoPath = CommonUtils.PRODUCT_IMG_UPLOAD_PATH;
	pnum = pvo.getPnum();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 상세페이지</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">

	function count(type)  {
		  // 결과를 표시할 수량 및 총가격
		  const result = document.getElementById("result");
		  const totalPrice = document.getElementById("totalPrice");
		  
		  // 현재 화면에 표시된 값
		  let number = result.innerText;
		  let price = parseInt(totalPrice.innerText)/number;
		  
		  // 더하기/빼기
		  if(type === "plus") {
		    number = parseInt(number) + 1;
		    price = parseInt(price)*number;
		    
		  }else if(type === "minus")  {
		    number = parseInt(number) - 1;
		    price = parseInt(price)*number;
		  }
		  
		  // 결과 출력
		  result.innerText = number;
		  cCnt.innerText = number;
		  totalPrice.innerText = price;
		  tPrice.innerText = price;
		}

</script>
<style>
	
	div.a, .b{
		position: relative;
		width: 500px;
		height: 500px;
		border: 1px solid black;
	}
	
	div.c, .d{
		position: relative;
		width: 500px;
		height: 200px;
		border: 1px solid black;
	}
	
	div.b1{
		
		margin-top: 30px;
		position: relative;
		font:24px bold;
		left: 50px;
		width: 400px;
		height: 80px;
		border: 1px solid black;
	}
	
	div.b2{
		position: relative;
		left: 50px;
		width: 400px;
		height: 60px;
		border: 1px solid black;
	}
	
</style>
</head>


<body>
<form id="selectForm" name="selectForm" style="align:center;">
	<table align="center">
		<tr>
			<td>
				<div class="a"><img width="500px;" height="500px;" src="/petCenter/fileupload/product/<%= pvo.getPphoto() %>"/></div>
			</td>
			<td>
				<div class="b">
					<div class="b1" ><%= pvo.getPname() %></div>
					<div class="b1" ><%= pprice %> 원</div>			
					<hr>
					<div class="b2">연관태그 #강아지 #애완견 #사료</div>
					<hr>
					<div class="b2">배송정보 배송비 2,500원 (30,000원 이상 무료배송)</div>
					<hr>
					<div class="b2">취소/교환/환불 팝업창</div>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2"><hr></td>
		</tr>
		<tr>
			<td >
				<div class="c">
<%-- 					<img src="/petCenter/fileupload/product/<%= pvo.getPphoto() %>" width="40px" height="40px"/> --%>
					<div class=""><%= pvo.getPname() %></div>
					<div style="display: inline-block">
						<input type="button" onclick="count('minus')" value="-"/>
						<div id="result" style="display: inline-block">1</div>
						<input type="button" onclick="count('plus')" value="+"/>
					</div>
					<div id="totalPrice" style="display: inline-block"  align="right"><%= pvo.getPprice() %></div> 원
				</div>
			</td>
			<td>
				<div class="d">
					총수량<div id="cCnt" style="display: inline-block">1</div> 개<br/>
					합계	<div id="tPrice" style="display: inline-block"><%= pvo.getPprice() %></div> 원
						<div></div>
						<div>
							<div style="display: inline-block">
								<input type="button" id="cartBtn" value="장바구니">
							</div>
							<div style="display: inline-block">
								<input type="button" id="orderBtn" value="구매하기">
							</div>
						</div>
				</div>
			</td>
		</tr>
	</table>
</form>

<script>
	
	$('#cartBtn').click(function(){
		//console.log("#cartBtn 클릭: ");
		if(confirm("해당 상품을 장바구니에 담으시겠습니까?")){
			const cCnt = document.getElementById("cCnt").innerText;
			alert("cCnt: "+ cCnt);
					
			location.href="cartInsert.pc?pname=<%= pname %>&pprice=<%= pprice %>&pphoto=<%= pphoto %>&ccnt="+cCnt;		
		}
	});
	
	$('#orderBtn').click(function(){
		//console.log("#orderBtn 클릭: ");
		if(confirm("해당 상품을 주문하시겠습니까?")){
			const cCnt = document.getElementById("cCnt").innerText;
			alert("cCnt: "+ cCnt);
					
			location.href="cartInsert.pc?pname=<%= pname %>&pprice=<%= pprice %>&pphoto=<%= pphoto %>&ccnt="+cCnt;		
		}
	});
	
</script>
</body>
</html>