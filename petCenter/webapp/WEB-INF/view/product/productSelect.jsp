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
	
	Object mnum = session.getAttribute("KNUM");
	logger.info("mnum: "+ mnum);
	
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
		height: 450px;
/* 		border: 1px solid black; */
	}
	
	div.b{
		margin-top: 100px;
	}
	
	div.c, .d{
		position: relative;
		width: 500px;
		height: 200px;
/* 		border: 1px solid black; */
	}
	
	div.b1{
		
		margin: 30px 50px 30px 50px;
		position: relative;
		font:24px bold;
		width: 400px;
		height: 80px;
/* 		border: 1px dotted black; */
	}
	
	div.b2{
		position: relative;
		margin: 8px 50px 8px 50px;
		width: 400px;
		height: 60px;
/* 		border: 1px dotted black; */
	}
	
	table.t{
/* 		background:#faf8b9; */
/* background-color:rgba(61, 183, 204, 0.3); */
		background-color:rgba(255, 195, 54, 0.1);
	}
	
</style>
</head>


<body>
<form id="selectForm" name="selectForm" style="align:center;">
	<jsp:include page="../include/header.jsp" flush="true">
		<jsp:param name="url" value="produectSelectAll.jsp"/>
	</jsp:include>
	<h2 align="center"><br/>상품상세정보보기<br/></h2><br/>
	<table class="t" style="margin:0 auto;">
		<tr>
			<td colspan="2"><hr></td>
		</tr>
		<tr>
			<td>
				<div class="a"><img style="margin:50px;" width="400px;" height="400px;" src="/petCenter/fileupload/product/<%= pvo.getPphoto() %>"/></div>
			</td>
			<td>
				<div class="b">
					<div class="b1"><h2><%= pvo.getPname() %></h2></div>
					<div class="b1" align="right";><h3><%= pprice %> 원 &nbsp;</h3></div>			
					<div class="b2"><hr>연관태그<br/>&nbsp;&nbsp;&nbsp; #<%= pvo.getPname() %><br/>&nbsp;&nbsp;&nbsp; #반려동물 #사료<hr></div>
					<div class="b2">배송정보<br/>&nbsp;&nbsp;&nbsp; 배송비 2,500원 (30,000원 이상 무료배송)<hr></div>
					<div class="b2">취소/교환/환불 팝업창<hr></div>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2"><hr></td>
		</tr>
		<tr>
			<td >
				<div class="c">
					<div style="margin: 50px 50px 30px 50px; /*border: 1px dotted black;*/">
						<div class=""><h3><%= pvo.getPname() %></h3></div><br/>
						<div align="right">
							<div style="display: inline-block">
								<input type="button" onclick="count('minus')" value="-"/>
								&nbsp;<div id="result" style="display: inline-block">1</div>&nbsp;
								<input type="button" onclick="count('plus')" value="+"/>&nbsp;
							</div>
							<div id="totalPrice" style="display: inline-block"><h3><%= pvo.getPprice() %></h3></div><h3 style="display: inline-block">&nbsp;원</h3>
						</div>
						<br/>
						<hr>
					</div>
				</div>
			</td>
			<td>
				<div class="d">
					<div style="margin: 30px 50px 30px 50px; /*border: 1px dotted black;*/">
						<h3><div align="right">총수량&nbsp;<div id="cCnt" style="display: inline-block;">1</div> 개&nbsp;&nbsp;&nbsp;<br/><br/></div></h3>
						<h3><div align="right">합계	<div id="tPrice" style="display: inline-block;"><%= pvo.getPprice() %></div> 원&nbsp;&nbsp;&nbsp;<br/><br/></div></h3>
							<div align="center">
								<div style="display: inline-block">
									<input type="button" id="cartBtn" value="장바구니">
								</div>
								<div style="display: inline-block">
									<input type="button" id="orderBtn" value="구매하기">
								</div>
							</div>
							<br/>
							<hr/>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2"><hr></td>
		</tr>
	</table>
	<br>
	<jsp:include page="../include/footer.jsp" flush="true">
		<jsp:param name="url" value="produectSelectAll.jsp"/>
	</jsp:include> 	
</form>

<script>
	
// 	function cartPlz(){
<%-- 		const mnum = "<%= mnum %>"; --%>
// 		alert("mnum: "+ mnum);
// 		if (confirm("장바구니 목록을 확인하시겠습니까?")){
		
// 			if(mnum == null || mnum == "null" || typeof(mnum)== "undefined" || mnum== ""){
// 				alert("로그인을 먼저 해주세요!");
// 				return;
// 			}else{
// 				location.href="cartSelectAll.pc?mnum="+mnum;
// 			}
// 		}
// 	};
	
	$('#cartBtn').click(function(){
		//console.log("#cartBtn 클릭: ");
		if(confirm("해당 상품을 장바구니에 담으시겠습니까?")){
			const mnum = '<%= mnum %>';
			const cCnt = document.getElementById("cCnt").innerText;
			alert("cCnt, mnum: "+ cCnt +" , "+ mnum);
					
			if(mnum == null || mnum == "null" || typeof(mnum) == "undefined" || mnum == ""){
				alert("로그인을 먼저 해주세요!");
				return;
			}else{
				location.href="cartInsert.pc?pname=<%= pname %>&pprice=<%= pprice %>&pphoto=<%= pphoto %>&ccnt="+cCnt+"&mnum="+mnum;
			}
		}
	});
	
		
	$('#orderBtn').click(function(){
		//console.log("#orderBtn 클릭: ");
		if(confirm("해당 상품을 주문하시겠습니까?")){
			const mnum = '<%= mnum %>';
			const cCnt = document.getElementById("cCnt").innerText;
			alert("cCnt, mnum: "+ cCnt +" , "+ mnum);
			
			if(mnum == null || mnum == "null" || typeof(mnum) == "undefined" || mnum == ""){
				alert("로그인을 먼저 해주세요!");
				return;
			}else{
				location.href="cartInsert.pc?pname=<%= pname %>&pprice=<%= pprice %>&pphoto=<%= pphoto %>&ccnt="+cCnt;
			}
		}
	});
	
</script>
</body>
</html>