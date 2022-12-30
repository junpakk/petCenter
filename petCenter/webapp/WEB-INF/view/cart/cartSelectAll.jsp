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
	List<CartVO> list = (List<CartVO>)obj;
	int nCnt = list.size();
	logger.info("list.size(): "+ list.size());
	
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
		  border: 3px solid blue;
	}
	
	div.c{
		  position: relative;
		  left: 50px;
		  width: 400px;
		  height: 80px;
		  border: 3px solid blue;
	}
	
	div.d,.e{
		  position: relative;
		  margin-top: 30px;
		  left: 50px;
		  width: 400px;
		  height: 150px;
		  border: 3px solid blue;
	}
	
	div.de{
		position: fixed;
	  	top: 180px;
	  	left: 450px;
	}
	
	.btn_submit{
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
[출처] [css] input type="submit" 에 이미지 넣기|작성자 쏼루
</style>
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
					<div><input type="checkbox">전체선택</div>
					<div style="text-align:right;"><input type="button" value="선택삭제"></div>
				</div>
			</td>
			<td><div> </div></td>
		</tr>
		<tr>
			<td>
				<div class="b" style="text-align:right;">[배송비 30000원 이상 무료]</div>
				<div>
					<%
						 for(int i=0; i<list.size(); i++){
							CartVO cvo = list.get(i);
							 
							cnum = cvo.getCname();
							mnum = cvo.getMnum();
							cname = cvo.getCname();
							ccnt = cvo.getCcnt();
							cprice = cvo.getCprice();
							cphoto = cvo.getCphoto();
							opsum = Integer.valueOf(ccnt)*Integer.valueOf(cprice);							
// 							cphotoPath = CommonUtils.PRODUCT_IMG_UPLOAD_PATH;
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
					<div class="c">
						<div>
							<input type="checkbox">
							<input type="hidden" value="cnum">
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
						}
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
						<input type="submit" class="btn_submit" value="">
					</div>
				</div>
			</td>
		</tr>
	</table>		
</form>
</body>
</html>