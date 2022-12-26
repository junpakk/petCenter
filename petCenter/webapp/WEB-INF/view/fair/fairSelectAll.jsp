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
</script>
</head>
<body>
<div class="container" align="center" style="border-color:black">
	<h3>[ BabMenu ]</h3>
	<hr>
	<talble>
		<tr>
			<table border="5" border-collapse: collapse>
			<% request.setCharacterEncoding("UTF-8"); %>
			<%
			Object obj = request.getAttribute("fairAll");
			List<FairVO> list = (List<FairVO>)obj;
	
			if (list.size() > 0){
			int count = 0;	 
			
			for (int i=0; i < list.size(); i++){
				count ++;
				FairVO fvo = list.get(i);
				if (i % 3==0){
					out.println("<tr align='center'>");
				}
			%>	
				<td>
					<table>
						<tr align="center">
							<td>
								<button type="button" onclick=><img src="/petCenter/fileupload/pet/<%=fvo.getBfphoto()%>" width="150" height="150"></button>
							</td>
						</tr>
					</table>
				</td>
<%
			}
		}
%>
			</table>
		</tr>
	</talble>
</div>
				
</body>
</html>