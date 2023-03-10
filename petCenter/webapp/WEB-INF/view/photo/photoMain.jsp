<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List"%>
<%@ page import="main.pc.photo.vo.PhotoVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		let url = "photoMainAjax.pc";
		let type = "GET";
		let dataType = "text";
		
		$.ajax({
			url: url,
			type: type,
			dataType: dataType,
			success: whenSuccess,
			error: whenError
		});
		
		function whenSuccess(resData){
			//alert("resData >>> : " + resData);
			
			var vv = JSON.parse(resData);   // JSON 형식의 문자열을 자바스크립트 객체로 변환함.
// 			alert (vv[0].bpnum + " : " + vv[0].bpphoto);
// 			alert (vv[1].bpnum + " : " + vv[1].bpphoto);
// 			alert (vv[2].bpnum + " : " + vv[2].bpphoto);
// 			alert (vv[3].bpnum + " : " + vv[3].bpphoto);
			
			let photo = "";
			
			for (let i=0; i < 4; i++) {
				
				photo += '<td>';
				photo += '<a href="/petCenter/photoSelForm.pc?bpnum=' + vv[i].bpnum + '">';
				photo += '<img src="/petCenter/fileupload/photo/' + vv[i].bpphoto + '" width="280" height="350"'
				photo += 'onerror="this.src=';
				photo += "'/petCenter/img/noImg.gif'";
				photo += ';"';
				photo += ' ></a>';
				photo += '</td>';
				
			}
			
			document.getElementById("photo").innerHTML = photo;
			
		}
		function whenError(e){
			alert("e >>> : " + e.responseText);
		}
		
	});

</script>
<style type="text/css">

  .rsh1 {
  	 	 padding: 15px 60px;
  }
  .rd1 {
  		padding: 10px 30px;
  }
  
  tr.photo td {
  		padding: 10px;
  }
  
  img{
  		border-radius:7px;
  }
</style>
</head>

<body>
<table style="padding: 15px 40px;">
	<tr>
		<td colspan="4">
			<h1 class="rsh1" align="left">반려동물 자랑</h1><br>
		</td>
	</tr>
	<div class="rd1">
	<tr class="photo" id="photo">
	</tr>
</div>
</table>
</body>
</html>