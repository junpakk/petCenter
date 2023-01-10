<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List"%>
<%@ page import="main.pc.photo.vo.PhotoVO"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
			//alert("스크립트진입 >>> : ");
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
				//alert("제이쿼리진입 >>> : ");
				console.log("제이쿼리진입 >>> : ");
				
				
				$("#toMain").on("click", function(){
					location.href="mainPage.pc";
				});
				
				$("#pMain").on("click", function(){
					location.href="photoSelAll.pc";
				});
				
				// like_1 버튼 
				$(document).on("click", "#like_1", function(e){
					alert($("#likey").val());
		
					let boardLikeURL = "like1.pc";
					let reqType = "GET";
					let dataParam = {
						likey: $("#likey").val(),
						mnum: $("#mnum").val(),
						bpnum: $("#bpnum").val(),
					};
					
					dataParam = $("#Form").serialize();
					
					$.ajax({
						url: boardLikeURL,
						type: reqType,								
						data: dataParam,	            
						success: whenSuccess,		
						error: error1
					});
					
					function whenSuccess(resData){
						alert("resData : " + resData);
						console.log("resData : " + resData);			
						$("#disp_cnt_recom").text(resData);
						$("#likey").val(resData);
					}
					
					function error1(e){
						console.log(":" + e.responseText);
					}
					
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
			td.semi_title{text-align:center; white-space:nowrap;}
			td.gbuttons{text-align:center}
			.header{
			/* 	background-image:url("../../img/contact.png"); */
				diplay:flex;
				position:sticky;
				top:0%;
			  	background:orange;
				grid-area:header;
				text-align:center;
			}
			.upperH{width:100%;height:50px;background:pink;text-align:center;}
			.lowerH{width:100%;height:100px;background:yellow;text-align:center;}			
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
		<script>
			if(<%=mid%> === null || "<%=mid%>" === ""){
				alert("먼저 로그인 해주세요 "+ <%=mid%>);
				location.href="mainPage.pc";
			}
		</script>
		<div class="title">반려동물 자랑</div>
		<form action="Form" id="Form" name="Form">
			<input type="hidden" class="insert_1" id="mnum" name="mnum" value="<%=mnum %>" readonly/>
			<input type="hidden" class="insert_1" id="mid" name="mid" value="<%=mid %>" readonly/>
			<table class="table table-sm table-striped table-hover table-bordered" style="width:100%;">
			
			<% 
			Object obj = request.getAttribute("listS");
			if(obj == null) return;
			
			List<PhotoVO> list = (List<PhotoVO>)obj;
			int i = list.size();
			String bpnum = "";

			PhotoVO pvo = null;
			if(i == 1) { 
				 pvo = list.get(0);
				bpnum = pvo.getBpnum();

			}
			%>
				<tr>
					<td class="semi_title">글번호</td>
					<td class="insert"><%=pvo.getBpnum() %></td>
				</tr>
				<tr>
					<td class="semi_title">글제목</td>
					<td class="insert"><%=pvo.getBptitle() %></td>
				</tr>
				<tr>
					<td class="semi_title">작성자</td>
					<td class="insert"><%=pvo.getMid() %></td>
				</tr>
				
				<tr>
					<td class="semi_title">사진</td>
					<td class="insert"><img id="bImage" src="/petCenter/fileupload/photo/<%=pvo.getBpphoto() %>" width="500" height="500"  onerror="this.src='/petCenter/img/noImg.gif';"></td>
				</tr>
				<tr>
					<td align="center" colspan="2"> 추천  <%= pvo.getLikey() %>&nbsp; 조회 <%= pvo.getBphit() %> &nbsp; 작성일자 : <%= pvo.getUdate() %></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center" >
						<input type="button" class="like_1" name="like_1" id="like_1" value="추천">

							<img src='/petCenter/img/like/heart.png' style='width:12px; margin:3px 3px 0 0;'>
							<span id="disp_cnt_recom"><%= pvo.getLikey() %></span>
							<input type="hidden" name="bcnum" id="bcnum" value="<%=bpnum %>">
							<input type="hidden" name="likey"  id="likey" value="<%= pvo.getLikey()%>">

					</td>
				<tr>
				<tr>
					<td colspan="2" class="gbuttons">
						<input type="button" id="toMain" name="toMain" value="메인화면"/>
						<input type="button" id="pMain" name="pMain" value="글목록"/>
					</td>
				</tr>
			
			</table>
		</form>
		<div>
			<!-- 댓글 처리 하는 루틴  --> 
			<jsp:include page="/replyForm.pc">
				<jsp:param value="<%=bpnum%>" name="bpnum"/>
			</jsp:include>
		</div>
		</div>
		<jsp:include page="../include/footer.jsp" flush="true">
		<jsp:param name="url" value="produectSelectAll.jsp"/>
	</jsp:include>
	</body>
</html>