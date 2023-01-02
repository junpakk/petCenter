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
	
	Object obj = request.getAttribute("listAll");
	
	String cnum = "";
	String mnum = "";
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
		  left: 50px;
		  width: 400px;
		  height: 50px;
		  border: 1px solid black;
	}
	
	div.c{
		  position: relative;
		  left: 50px;
		  width: 400px;
		  height: 80px;
		  border: 1px solid black;
	}
	
	div.d,.e{
		  position: relative;
		  margin-top: 30px;
		  left: 50px;
		  width: 400px;
		  height: 150px;
		  border: 1px solid black;
	}
	
	div.de{
		position: fixed;
	  	top: 180px;
	  	left: 450px;
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
		
		//오더 함수(선택한 항목만 가져가서 주문)
		$(document).on('click', '#buyBtn', function(){
			alert("#buyBtn 버튼 클릭: ");
			
			if($('.cnum:checked').length == 0){
				alert("주문한 상품 하나 이상을 선택하시오.");
				return;
			}
			
			var cnum = [];
			//each(), 다건 주문 대비
			$("input:checkbox[name='cnum']:checked").each(function(){
				//체크된 것만 값을 뽑아서 배열 cnum에 push
				cnum.push($(this).val());
				console.log(cnum);
			});//end of each
						
			$("#cartSelectAll").attr({ 	 "action":"orderInsertForm.pc"
										,"method":"GET"		
			}).submit();
		});
		

		
// 		//선택삭제
// 		$(document).on('click', '#delsBtn', function(){
// 			alert("#delsBtn 선택삭제 버튼 클릭");
// 			cart_delete();
// 		});
		
// 		//장바구니 전체 비우기
// 		$(document).on('click', '#delAllBtn', function(){
// 			alert("#delAllBtn 장바구니 전체 비우기 버튼 클릭");
// 			cart_delete();
// 		});
		
		
// 		//선택삭제 함수
// 		function cart_delete(){
			
// 			//선택을 하던지 전체를 비우던지 해야 삭제할 수 있음
// 			if($('.cnum:checked').length == 0){
// 				alert("삭제할 상품 하나 이상을 선택하세요.");
// 				return;
// 			}
			
// 			var cnum = [];
// 			//each()
// 			$("input:checkbox[name='cnum']:checked").each(function(){
// 				//체크된 것만 값을 뽑아서 배열 cnum에 push
// 				cnum.push($(this).val());
// 				console.log(cnum);
// 			});//end of each
			
// 			$("#productList").attr({ "action":"cartDeleteArray.pjb"
// 									,"method":"GET"			
// 			}).submit();
// 		}//end of cart_delete()
		
// 		$(document).on('click', '#shoppingBtn', function(){
// 			alert("#shoppingBtn 버튼 클릭: ");
// 			location.href="productSelectAll.pjb";
// 		});//end of #shoppingBtn
		
		
// 		//오더 함수(선택한 항목만 가져가서 주문)
// 		$(document).on('click', '#buyBtn', function(){
// 			alert("#buyBtn 버튼 클릭: ");
			
// 			if($('.cnum:checked').length == 0){
// 				alert("주문한 상품 하나 이상을 선택하시오.");
// 				return;
// 			}
			
// 			var cnum = [];
// 			//each(), 다건 주문 대비
// 			$("input:checkbox[name='cnum']:checked").each(function(){
// 				//체크된 것만 값을 뽑아서 배열 cnum에 push
// 				cnum.push($(this).val());
// 				console.log(cnum);
// 			});//end of each
						
// 			$("#productList").attr({ "action":"orderInsertForm.pjb"
// 									,"method":"GET"			
// 			}).submit();
// 		});//end of #buyBtn
	});//end of ready()

</script>
</head>
<body>
<form id="cartSelectAll" name="cartSelectAll">
	<table>
		<tr>
			<td><div class="c"><h1>장바구니</h1></div></td>
		</tr>
		<tr>
			<td>
				<div class="a">
					<div><input type="checkbox" name="chk" id="chk" class="chk">전체선택</div>
				</div>
			</td>
			<td><div> </div></td>
		</tr>
		<tr>
			<td>
				<div class="b" style="text-align:right;">[배송비 30000원 이상 무료]</div>
<%
	if(obj == null){
%>
		<tr>
			<td colspan="8" align="center">
				<h2>장바구니에 상품을 담으세요.</h2>
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
			mnum = cvo.getMnum();
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
%>
				<div>
					<div class="c">
						<div style="text-align:right;">
							<input type="hidden" name="mnum" id="mnum" class="mnum" value="<%= mnum %>">
							<button type="button" class="delBtn" name="delBtn" id="delBtn" value="<%= cnum %>">삭제
						</div>
						<div>
							<input type="checkbox" name="cnum" id="cnum" class="cnum" value=<%= cnum %>>
							<img src="fileupload/product/<%= cphoto %>" width="25px" height="25px"/>
							<em><%= cname %></em>
						</div>
						<div style="text-align:right;">
							<em><%= cprice %></em> x 
							<em><%= ccnt %></em> 개
							<em ><%= opsum %></em> 원
						</div>
					</div>
					<%
		}//end of for
	}//end of else
					%>
				</div>
			</td>
			<td>
				<div class="de">
					<div  class="d">
						<div><h3>결제금액</h3></div>
						<div style="text-align:right;">상품금액  0원</div>
						<div style="text-align:right;">배송비  2500원</div><hr>
						<div style="text-align:right;">최종결제금액 0원</div>
					</div>
					<div class="e" style="text-align:center;">
						<input type="button" id="buyBtn" class="buyBtn">
					</div>
				</div>
			</td>
		</tr>
	</table>		
</form>
</body>
</html>