<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	alert("��ũ��Ʈ���� >>> : ");
	$(document).ready(function() {
		alert("������������ >>> : ");
		$("#fBtn").on("click", function() {
			$("#Form").attr({
				"action":"communityInsert.pc",
				"method":"GET",
				"enctype":"application/x-www-form-urlencoded"
			}).submit();
			
		});
		
	});
	</script>
</head>
<body>
<h3>Ŀ�´�Ƽ�Է���</h3>
<form action="Form" id="Form" name="Form">
<table border="1" align="center">
<tr>
<td>�۹�ȣ</td>
<td><input type="text" id="bcnum" name="bcnum" readonly/></td>
</tr>
<tr>
<td>��ī�װ�</td>
<td><input type="text" id="bcc" name="bcc"/></td>
</tr>
<tr>
<td>ȸ�����̵�</td>
<td><input type="text" id="mid" name="mid"/></td>
</tr>
<tr>
<td>������</td>
<td><input type="text" id="bctitle" name="bctitle"/></td>
</tr>
<tr>
<td>�۳���</td>
<td><input type="text" id="bccontent" name="bccontent"/></td>
</tr>

<tr>
<td colspan="2">
<input type="button" id="fBtn" name="fBtn" value="�Է�"/>
</td>
</tr>

</table>
</form>
</body>
</html>