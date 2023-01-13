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
	logger.info("productSelectAll2.jsp 진입: ");
	
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
 	logger.info("list.get(0).getPcategory(): "+ list.get(0).getPcategory());
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
			const pcategory = $(this).val();
	        alert("pcategory : "+ pcategory);
	        
<%-- 	        if(<%= list.get(0).getPcategory() %> == '21'){ --%>
// 	        	$("input:checkbox[value='21']").prop("checked",true);
	        	
// 	        }
	        
<%-- 	        if(<%= list.get(0).getPcategory() %> == '11'){ --%>
// 	        	$("input:checkbox[value='11']").prop("checked",true);
// 	        }
	        
	        
	        location.href = "productSelectAll.pc?pcategory="+pcategory;
// 	        location.href="productSelectAll.pc?mnum="+mnum+"&pcategory="+pcategory;
<%-- 	        location.href="cartInsert.pc?pname=<%= pname %>&pprice=<%= pprice %>&pphoto=<%= pphoto %>&ccnt="+cCnt; --%>
		});
		
		$("#cBtn1").click(function(){
			
			const pcategory = $(this).val();
			alert("::" + pcategory);
			location.href = "productSelectAll.pc?pcategory="+pcategory;
		});
		$("#cBtn2").click(function(){
			
			const pcategory = $(this).val();
			alert("::" + pcategory);
			location.href = "productSelectAll.pc?pcategory="+pcategory;
		});
		$("#cBtn3").click(function(){
			
			const pcategory = $(this).val();
			alert("::" + pcategory);
			location.href = "productSelectAll.pc?pcategory="+pcategory;
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
<form name="productList" id="productList">
	<jsp:include page="../include/header.jsp" flush="true">
		<jsp:param name="url" value="produectSelectAll.jsp"/>
	</jsp:include>
<h2 align="center" style="margin:20px;">PetCenter가 추천하는 내 아이 취향저격 상품</h2>
<table border="1" style="margin:0 auto;">

	<thead>
		<tr>
			<th>
				<ul>
				    <li style="padding:10px;">
					      <select id="pcategory">
				      		  <option id="pcategory" value="00">우리아이</option>	
							  <option id="pcategory" value="21" selected>고양이</option>
							  <option id="pcategory" value="11">강아지</option>
						  </select>
					      <button type="button" class="" id="cBtn1" value="21" >고양이사료</button><!-- 카테고리 11 -->
					      <button type="button" class="" id="cBtn2" value="22">고양이간식</button><!-- 카테고리 12 -->
					      <button type="button" class="" id="cBtn3" value="23">고양이용품</button><!-- 카테고리 13 -->
				    </li>
	  			</ul>
			</th>
		</tr>
	</thead>
	
	<tbody>
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
				<td style="text-align:left;">
					&nbsp;&nbsp;&nbsp;<%= pname %>
				</td>
			</tr>
			<tr>
				<td style="text-align:right">
					가격: <%= pprice %> 원&nbsp;&nbsp;&nbsp;
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
	</tbody>
</table>
	<br/>
	<jsp:include page="../include/footer.jsp" flush="true">
		<jsp:param name="url" value="produectSelectAll.jsp"/>
	</jsp:include> 
</form>
</body>
</html>