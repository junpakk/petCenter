<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
			alert("스크립트진입 >>> : ");
			console.log("스크립트진입 >>> : ");

			const clickImg = function(imgsrc, pageName){
				var file = imgsrc.files[0];
				imageWin = window.open("#","","width=300px, height=300px");
				imageWin.document.write("<html><body style='margin:0'>");
				imageWin.document.write("<img src='" +URL.createObjectURL(file)+ "' border=0>");
				imageWin.document.write("</body></html>");
				imageWin.document.title = pageName;
			}			
			
			$(document).ready(function() {
				alert("제이쿼리진입 >>> : ");
				console.log("제이쿼리진입 >>> : ");
				
				$("#fBtn").on("click", function() {
					alert("버튼눌림 >>> : ");
					
					$("#Form").attr({
						"action":"photoIns.pc",
						"method":"POST",
						"enctype":"multipart/form-data"
					}).submit();
				});
				
				$("#toMain").on("click", function(){
					location.href="mainPage.pc";
				});
			});
		</script>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>				
	
		<style>
			.title{text-align:center;font-size:2rem;font-weight:bold;}
			td.insert{width:85%;}
			input.insert_1{width:100%;border:none;}
			textarea.insert_1{width:100%;border:none;}
			td.semi_title{text-align:center;}
			td.gbuttons{text-align:center}
				
		</style>
	
	</head>
	<body>
	<jsp:include page="../include/header.jsp" flush="true">
			<jsp:param name="url" value="produectSelectAll.jsp"/>
	</jsp:include>
	<br><br>
	

			<%
				String mnum = null;
				String mid = null;
				Object objMnum = session.getAttribute("KNUM");
				Object objMid = session.getAttribute("KID");
				
				if (objMnum != null) {
					mnum = (String)objMnum;
					mid = (String)objMid;

				}
			%>		

		

		<div class="container">
		<div class="title">반려동물 자랑</div>
		<form action="Form" id="Form" name="Form">
			<input type="hidden" class="insert_1" id="mnum" name="mnum" value="<%=mnum %>" readonly/>
			<input type="hidden" class="insert_1" id="mid" name="mid" value="<%=mid %>" readonly/>
			<table class="table-sm table-striped table-hover table-bordered" style="width:100%;">
				<tr>
					<td class="semi_title">글번호</td>
					<td class="insert"><input type="text" class="insert_1" id="bpnum" name="bpnum" placeholder="자동생성" readonly/></td>
				</tr>
				<tr>
					<td class="semi_title">글제목</td>
					<td class="insert"><input type="text" class="insert_1" id="bptitle" name="bptitle" required/></td>
				</tr>
				<tr>
					<td class="semi_title">사진</td>
					<td class="insert"><input type="file" class="insert_1" name="bpphoto" id="bpphoto" style="height:30px;" onchange="clickImg(this,'이미지');"></td>
				</tr>
				
				<tr>
					<td colspan="2" class="gbuttons">
						<input type="button" id="fBtn" name="fBtn" value="입력"/>
						<input type="button" id="toMain" name="toMain" value="메인화면"/>
						<input type="reset" value="리셋">
					</td>
				</tr>
			
			</table>
		</form>
		</div>
		<br><br>
	<jsp:include page="../include/footer.jsp" flush="true">
		<jsp:param name="url" value="produectSelectAll.jsp"/>
	</jsp:include>
	</body>
</html>