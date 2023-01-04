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
	logger.info("productSelectAll.jsp 진입: ");
	
/*
일단 가장 큰 차이점은 둘의 리턴 타입이다.
getParameter()메서드의 경우 String타입을 리턴,
getAttribute()는 Object 타입을 리턴하기 때문에 주로 빈 객체나 다른 클래스를 받아올 때 사용된다.

getParameter()는 웹브라우저에서 전송받은 request영역의 값을 읽어오고
getAttribute()의 경우 setAttribute()속성을 통한 설정이 없으면 무조건 null값을 리턴한다.
*/

	Object mnum = session.getAttribute("KNUM");
// 	mnum = "";
	logger.info("mnum: "+ mnum);
	
	
// 	String mnum = (String)knum;
// 	mnum = request.getParameter("mnum");
// 	logger.info("mnum: "+ mnum);
	
	Object obj = request.getAttribute("listAll");//상품정보
	List<ProductVO> list = (List<ProductVO>)obj;
	int nCnt = list.size();
	logger.info("list.size(): "+ list.size());
// 	logger.info("list.get(0).getPnum(): "+ list.get(0).getPnum());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체상품목록</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">

	function cartPlz(){
		const mnum = "<%= mnum %>";
		alert("mnum: "+ mnum);
		if (confirm("장바구니 목록을 확인하시겠습니까?")){
		
			if(mnum == null || mnum == "null" || typeof(mnum)== "undefined" || mnum== ""){
				alert("로그인을 먼저 해주세요!");
	//				location.href="productSelectAll.pc?pcategory=21";
				return;
			}else{
				location.href="cartSelectAll.pc?mnum="+mnum;
			}
		}
	};

	$(document).ready(function(){
		
		$("#pcategory").change(function(){
	        const mnum = '<%= mnum %>';
			const pcategory = $("#pcategory").val();
	        alert("pcategory : "+ pcategory);
	        
	        location.href="productSelectAll.pc?pcategory="+pcategory;
// 	        location.href="productSelectAll.pc?mnum="+mnum+"&pcategory="+pcategory;
<%-- 	        location.href="cartInsert.pc?pname=<%= pname %>&pprice=<%= pprice %>&pphoto=<%= pphoto %>&ccnt="+cCnt; --%>
		});

	});
	//end of ready
</script>
<style>

tbody {
  display: inline-block;
  padding: 5px;
  border: 1px solid none;    
  background-color: none; 
}

table {
	align: center;
	
}

ul	{
	list-style:none;
}
</style>
</head>
<body>
<h3 align="center">PetCenter가 추천하는 내 아이 취향저격 상품</h3>
<form name="productList" id="productList">
<table border="1" align="center">

	<thead>
		<tr>
			<th>
				<ul>
				    <li>
					      <select id="pcategory">
							  <option id="pcategory" value="00">우리아이</option>
							  <option id="pcategory" value="21">고양이</option>
							  <option id="pcategory" value="11">강아지</option>
						  </select>
					      <input type="button" class="" id="pc21" value="사료"><!-- 카테고리 11 -->
					      <input type="button" class="" id="pc21" value="간식"><!-- 카테고리 12 -->
					      <input type="button" class="" id="pc21" value="용품"><!-- 카테고리 13 -->
				    </li>
	  			</ul>
			</th>
		</tr>
	</thead>
	
	
<%

	String pcategory = "";
	String pname = "";	
	String pprice = "";
	String pphoto = "";
	String pphotoPath = "";
	String pnum = "";
	
	for(int i=0; i<list.size(); i++){
// 	for(int i=0; i<16; i++){
		ProductVO pvo  = list.get(i);
// 		ProductVO pvo  = list.get(0);
		
		pname = pvo.getPname();
		pprice = pvo.getPprice();
		pprice = NumUtil.comma(pprice);//',' 추가
		pphoto = pvo.getPphoto();
		pphotoPath = CommonUtils.PRODUCT_IMG_UPLOAD_PATH;
		pnum = pvo.getPnum();
%>
	<td>
		<table>
			<tr>
				<td>
<%-- 					<a onclick="productSelect()" href="productSelect.pc?pnum=<%= pnum %>"> --%>
					<a href="productSelect.pc?pnum=<%= pnum %>">
<%-- 					<button onclick="productSelect()" id="pnum" value="<%= pnum %>"> --%>
						<img width="280px" height="280px" src="/petCenter/fileupload/product/<%= pphoto %>"/>
					</a>
				</td>
			</tr>
			<tr>
				<td align="right">
					<img src="/petCenter/img/icon/cart.png" width="30px" height="30px" onclick="cartPlz()"/>
				</td>
			</tr>
			<tr>
				<td>
					<%= pname %>
				</td>
			</tr>
			<tr>
				<td>
					가격: <%= pprice %> 원
				</td>
			</tr>
		</table>
	</td>
<%
		if(i%4 == 3){
			out.println("</tr>");
		}
	}//end of for
%>
</table>
<table>	
	<tfoot>
	</tfoot>
</table>
</form>
</body>
</html>