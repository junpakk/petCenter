<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="org.apache.log4j.LogManager" %>  
<%@ page import="org.apache.log4j.Logger" %>   
    
<%@ page import="main.pc.fair.vo.FairVO" %>
<%@ page import="main.pc.fair.service.FairService" %>
<%@ page import="main.pc.fair.service.FairServiceImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
<% String mnum = (String)session.getAttribute("KNUM"); %>

		$(document).ready(function(){	 
				
			//사전등록
				$(document).on("click", "#bbtn", function(){
					
					let mmnum="<%=mnum%>";
					if(mmnum != null){
						alert("등록되었습니다.");
					}else{
						alert("로그인을 먼저 해주세요.");
					}
				});
			});
		
</script>
<style type="text/css">

  .ttd {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
  
  button {
    margin: 20px;
	}
	
	.w-btn {
	    display: inline-block;
	    border: none;
	    padding: 15px 400px;
	    border-radius: 50px;
	}
	
	
	.pink {
	    background-color: pink;
	    color: #1e6b7b;
	    
	}
</style>
<% request.setCharacterEncoding("UTF-8"); %>
<%
//
//		Object obj = request.getAttribute("listS");
//		List<FairVO> list = (List<FairVO>)obj;
//		if (list.size() > 0){
//			FairVO fvo = list.get(0);
	
		
%>
</head>
<body>
<jsp:include page="../include/header.jsp" flush="true">
			<jsp:param name="url" value="produectSelectAll.jsp"/>
	</jsp:include>
	<br><br>
<div align="center">
<form name="fairForm" id="fairForm">
	<table>
			<td>
				<img src="/petCenter/fileupload/fair/1.png" width="400" height="450"><br>
			</td>
			<td>
				<table>
					<tr>
						<td class="ttd"><h1>2023 케이펫페어 수원</h1></td>
					</tr>
					<tr>
						<td class="ttd">일 자&nbsp;&nbsp;2023.03.03(금) ~ 05(일)</td>
					</tr>
					<tr>
						<td class="ttd">장 소&nbsp;&nbsp;수원메쎄</td>
					</tr>
						<td class="ttd">시 간&nbsp;&nbsp;10:00~18:00 (입장마감 17:30)</td>
					<tr>
						<td class="ttd">가 격&nbsp;정가 10,000원</td>
					</tr>
					<tr>
	
						<td>※ 사전등록 기간 : ~2023년 3월 2일(목) 23시 59분까지<br>
							※ 취소가능 기간 : ~2023년 3월 2일(목) 23시 59분까지 *이후에는 취소 및 환불 불가<br>
							※ 1인당 최대 3매까지 구매 가능합니다.<br>
							※ 입장바코드는 양도가 불가하며, 신청자 본인만 사용 가능합니다.<br>
							※ 무료입장 대상 : 미취학 아동/ 65세 이상 경로 우대자/ 장애인(복지카드 소지자)/ 국가 유공자(신분증 소지자)<br>
							※ 본 박람회는 반려동물 동반 입장 가능합니다.<br>
							(목줄 또는 하네스 착용 필수, 이동장/슬링백/유모차 이용 적극 권장)	
						</td>
					</tr>
					<tr>
						<td>
							<input type="button" id="bbtn" class="w-btn pink" value="사전등록"/>
						</td>
					</tr>
				</table>
			</td>
	</table>



</form>
</div>
<br><br><br>
<jsp:include page="../include/footer.jsp" flush="true">
		<jsp:param name="url" value="produectSelectAll.jsp"/>
	</jsp:include>
</body>
</html>
<%
//		}
%>