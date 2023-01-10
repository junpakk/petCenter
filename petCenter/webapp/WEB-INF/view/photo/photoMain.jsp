<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List"%>
<%@ page import="main.pc.photo.vo.PhotoVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
		request.setCharacterEncoding("UTF-8");
		Object obj = request.getAttribute("photoList");
		if(obj == null) return;
		
		List<PhotoVO> list = (List<PhotoVO>)obj;

		%>
		
		<form id="photomain" name="photomain">
			<table>
			<% 
				for (int i=0; i < 4; i++){
				PhotoVO pvo = list.get(i);

				%>	
				<td>
					<a href="/petCenter/photoSelForm.pc?bpnum=<%=pvo.getBpnum() %>"><img src="/petCenter/fileupload/photo/<%=pvo.getBpphoto()%>" width="280" height="350"></a>			
				</td>
			<%
				}
			%>
			</table>
		
		</form>
</body>
</html>