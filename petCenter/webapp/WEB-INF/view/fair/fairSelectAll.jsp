<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">

		$(document).ready(function(){	 
		
			// 사전등록
			$(document).on("click", "#selectBtn", function(){
				alert("등록");
				let num = $(this).val();
				alert(num);
				
				$("#bfnum").val(num);
				
				if ($('#bfnum').val() != "BF2212290001" ){
					alert("사전등록은 일주일 전부터 가능합니다. ");
					return;
				}
				
				$('#fairList').attr({
					'action':'fairSelect.pc',
					'method':'GET',
					'enctype':'multipart/form-data'
				}).submit();

			});
			
		});


</script>

<style type="text/css">



</style>
</head>
<body>
<div class="container" align="center" style="border-color:black">
	<h3>박람회 예정</h3>
	<hr>
	<form name="fairList" id="fairList">
	<talble>
		<tr>
			<table>
			<% request.setCharacterEncoding("UTF-8"); %>
			<%
			Object obj = request.getAttribute("fairAll");
			List<FairVO> list = (List<FairVO>)obj;
	
			if (list.size() > 0){

			for (int i=0; i < list.size(); i++){

				FairVO fvo = list.get(i);
				if (i % 3==0){
					out.println("<tr align='center'>");
				}
			%>	
				<td>
					<table>
						<tr align="left">
							<td>
								<img src="/petCenter/fileupload/fair/<%=fvo.getBfphoto()%>" width="300" height="300"><br>
								<%=fvo.getBfname() %><br>
								<p style="font-size:13px"><%=fvo.getBfdate() %><br>
									<%=fvo.getBfplace() %></p><br>
<%-- 								<input type="hidden" name="bfnum" id="bfnum" value="<%=fvo.getBfnum() %>" > --%>
								<button type="button" id="selectBtn" value="<%=fvo.getBfnum() %>" style="width:225pt;height:20pt;">사전등록 바로가기</button>
							</td>
						</tr>
					</table>
				</td>
<%
	if (i%3==2){
	out.println("</tr>");
			}
		}
	
%>
			</table>
		</tr>
	</talble>
	<input type="hidden" name="bfnum" id="bfnum"  >
	</form>
</div>
				
</body>
</html>
<%
	}
%>