<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="java.util.List" %>
<%@ page import="main.pc.cart.vo.CartVO" %>
<%@ page import="main.pc.common.CommonUtils" %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("cartSelectAll.jsp 진입: ");
	
	Object mnum = session.getAttribute("KNUM");
	logger.info("mnum: "+ mnum);
	
	Object obj = request.getAttribute("listAll");
	
	String cnum = "";
	String cname = "";
	String ccnt = "";
	String cprice = "";
	String cphoto = "";
	String cphotoPath = "";
	String delyn = "";
	String idate = "";
	String udate = "";
	int opsum = 0;

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style>

	div.a,.b{
		  position: relative;
		  left: 400px;
		  width: 400px;
		  height: 40px;
/* 		  border: 1px solid black; */
	}
	
	div.c{
		  position: relative;
		  left: 400px;
		  width: 400px;
		  height: 100px;
		  margin-top: 20px;
/* 		  border: 1px solid black; */
	}
	
	div.d{
		  position: relative;
		  margin: 20px;
/* 		  left: 50px; */
		  width: 400px;
		  height: 140px;
/* 		  border: 1px solid black; */
	}
	
	div.de{
		position: fixed;
	  	top: 210px;
	  	left: 900px;
	  	border: 1px solid black;
	}
	
	.buyBtn{
		background-image: url('./img/icon/order.png');
/* 	    background-position:  0px 0px; */
		align: center;
	    background-repeat: no-repeat;
	    width: 380px;
	    height: 60px;
	    border: 0px;
		cursor:pointer;
		outline: 0;
		}
	.shopBtn{
		background-image: url('./img/icon/shopping.png');
		align: center;
	    background-repeat: no-repeat;
	    width: 380px;
	    height: 60px;
	    border: 0px;
		cursor:pointer;
		outline: 0;
	}
	.orderInfo{
		background-image: url('./img/icon/orderdetail.png');
		align: center;
	    background-repeat: no-repeat;
	    width: 380px;
	    height: 60px;
	    border: 0px;
		cursor:pointer;
		outline: 0;
	}
		
	div.lAll{
		position: relative;
		left: 50px;
		width: 400px;
		border: 1px solid black;
		
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		//전체 체크 또는 전체 해제
		$(document).on("click", "#chk", function(){
			if($(this).prop('checked')){
				$('.cnum').prop('checked', true);
			}else{
				$('.cnum').prop('checked', false)
			}
		});//end of #chk
		
		//삭제버튼
		$(document).on('click', '#delBtn', function(){
			alert("#delBtn 클릭: ");
			let cnum = $(this).val();
			let mnum = $('#mnum').val();
			alert("cnum: "+ cnum);
			alert("mnum: "+ mnum);
			
			location.href="cartDelete.pc?cnum="+cnum+"&mnum="+mnum;
		});
		
		
// 		배송비<div id="delivery" style="text-align:right; display: inline-block;"> 2500 </div> 원<hr>
// 		최종결제금액<div id="tPrice" style="text-align:right; display: inline-block;"> 0 </div> 원
		
		//오더 함수(선택한 항목만 가져가서 주문)
		$(document).on('click', '#buyBtn', function(){
			alert("#buyBtn 버튼 클릭: ");
			
			if($('.cnum:checked').length == 0){
				alert("주문한 상품 하나 이상을 선택하시오.");
				return;
			}
			
			let cnum = [];
			$("input:checkbox[name='cnum']:checked").each(function(){
				cnum.push($(this).val());
				console.log(cnum);
			});//end of each
			
// 			const delivery = document.getElementsByName("delivery").innerText;
// 			const tprice = document.getElementsByName("tprice").innerText;
// 			alert("delivery: "+ delivery);
// 			alert("tprice: "+ tprice);
// 			alert("delivery: "+ typeof(delivery));
// 			alert("tprice: "+ typeof(tprice));
			
			$("#cartSelectAll").attr({ 	 "action":"orderInsertForm.pc"
// 			$("#cartSelectAll").attr({ 	 "action":"orderInsertForm.pc"
										,"method":"GET"
			}).submit();
		});
		
		//쇼핑 함수
		$(document).on('click', '#shopBtn', function(){
			alert("#shopBtn 버튼 클릭: ");
			let mnum = $('#mnum').val();
			alert("mnum: "+ mnum);
			
			location.href="productSelectAll.pc?pcategory=21&mnum="+mnum;
		});
		
		//주문내역확인
		$(document).on('click', '#orderInfo', function(){
			alert("#orderInfo 버튼 클릭: ");
			let mnum = $('#mnum').val();
			alert("mnum: "+ mnum);
			
			location.href="orderSelectAll.pc?mnum="+mnum;
		});
		
		
		//체크박스를 클릭 -> 해당하는 금액이 전체 금액에 더해짐 -> 만약 전체금액이 30000원 이상이면 배송료는 0원으로 변한다.
		let price = 0;
		$(document).on('click', '#cnum', function(){

			//$("#price").text("");
			//$("#targetChkbox").is(":checked") == true
			if($(this).is(":checked") == true){
				let cost = $(this).siblings();
				//alert("cost: "+ cost);
				let value = cost.get(0).value;
				alert("value: "+ value);
				price = price + parseInt(value);
				$("#price").text(price);
			}else{
				let cost = $(this).siblings();
				let value = cost.get(0).value;
				price = price - parseInt(value);
				$("#price").text(price);
			}
			
			if(price >= 30000){
				$("#delivery").text(0);
				$("#tPrice").text(price);
				
			}else{
				$("#delivery").text(2500);
				$("#tPrice").text(price+2500);
			}
			
		});
	
	});//end of ready()


</script>
</head>
<body>
<form id="cartSelectAll" name="cartSelectAll">
	<jsp:include page="../include/header.jsp" flush="true">
		<jsp:param name="url" value="produectSelectAll.jsp"/>
	</jsp:include>
	<br><br>
	<table>
		<tr>
			<td><div class="c"><h1>장바구니</h1></div></td>
		</tr>
			<tr>
				<td>
					<div class="a">
						<input type="hidden" name="mnum" id="mnum" class="mnum" value="<%= mnum %>">
<!-- 						<div><input type="checkbox" name="chk" id="chk" class="chk">전체선택<hr></div> -->
					</div>
				</td>
				<td><div> </div></td>
			</tr>
			<tr>
				<td>
					<div class="b" style="text-align:right;">[배송비 30000원 이상 무료]<hr></div>
<%
	if(obj == null){
%>
				<tr>
					<td colspan="8">
						<div class="b" style="text-align:center;" >
							<h2><br/><br/>장바구니에 상품을 담으세요.<br/><br/></h2>
						</div>
					</td>
				</tr>				
<%		
	}else{
		List<CartVO> list = (List<CartVO>)obj;
		int nCnt = list.size();
		logger.info("list.size(): "+ list.size());
						
		for(int i=0; i<list.size(); i++){
			CartVO cvo = list.get(i);
			 
			cnum = cvo.getCnum();
// 			mnum = cvo.getMnum();
			ccnt = cvo.getCcnt();
			cprice = cvo.getCprice();
			cphoto = cvo.getCphoto();
			cname = cvo.getCname();
			opsum = Integer.valueOf(ccnt)*Integer.valueOf(cprice);							
		// 	cphotoPath = CommonUtils.PRODUCT_IMG_UPLOAD_PATH;
			idate = cvo.getIdate();
			logger.info("cnum: "+ cnum);
			logger.info("mnum: "+ mnum);
			logger.info("cname: "+ cname);
			logger.info("ccnt: "+ ccnt);
			logger.info("cprice: "+ cprice);
			logger.info("cphoto: "+ cphoto);
			logger.info("cphoto: "+ cphoto);
			logger.info("cphotoPath: "+ cphotoPath);
			logger.info("idate: "+ idate);
			logger.info("opsum: "+ opsum);
%>
					<div>
						<div class="c">
							<div>
								<input type="checkbox" name="cnum" id="cnum" class="cnum" value=<%= cnum %>>
								<input type="hidden" name="opsum" id="opsum" class="opsum" value=<%= opsum %>>
								<img src="fileupload/product/<%= cphoto %>" width="25px" height="25px"/>
								<strong><%= cname %></strong>
							</div>
						
							<div style="text-align:right;">
								<em><%= cprice %></em> x 
								<em><%= ccnt %></em> 개
								<strong><%= opsum %> 원</strong>
							</div>
							
							<div style="text-align:right;">
								<button type="button" class="delBtn" name="delBtn" id="delBtn" value="<%= cnum %>">삭제</button>
							</div>
							<hr>
						</div>
					<%
		}//end of for
	}//end of else
					%>
					</div>
				</td>
			</tr>
			<td>
				<div class="de">
					<div  class="d">
						<div><h2>결제금액</h2></div>
						<div align="right"><h3>상품금액<div id="price" style="text-align:right; display: inline-block;"> 0 </div> 원</h3></div>
						<div align="right"><h3>배송비<div id="delivery" style="text-align:right; display: inline-block;"> 2500 </div> 원</h3></div><div><br/></div><hr>
						<div align="right"><h3>최종결제금액<div id="tPrice" style="text-align:right; display: inline-block;"> 0 </div> 원</h3></div>
					</div>
					<br/>
					<div class="e" style="text-align:center;">
						<input type="button" id="buyBtn" class="buyBtn">
					</div>
					<div class="f" style="text-align:center;">
						<div><input type="button" id="shopBtn" class="shopBtn"></div>
						<div><input type="button" id="orderInfo" class="orderInfo"></div><br/>
					</div>
				</div>
			</td>
		</tr>
	</table>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<jsp:include page="../include/footer.jsp" flush="true">
		<jsp:param name="url" value="produectSelectAll.jsp"/>
	</jsp:include> 		
</form>
</body>
</html>