<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List"%>
<%@ page import="main.pc.communities.vo.CommunitiesVO"%>
    
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
				
				$("#cMain").on("click", function(){
					location.href="comSelAll.pc";
				});
				
				// like_1 버튼 
				$(document).on("click", "#like_1", function(e){
					alert($("#likey").val());
		
					let boardLikeURL = "like1.pc";
					let reqType = "GET";
					let dataParam = {
						likey: $("#likey").val(),
						mnum: $("#mnum").val(),
						bcnum: $("#bcnum").val(),
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
				
				// like_2 버튼 
				$(document).on("click", "#like_2", function(e){
					alert($("#haty").val());
					
					let boardLikeURL = "hate1.pc";
					let reqType = "GET";
					let dataParam = {
						hate: $("#haty").val(),
						mnum: $("#mnum").val(),
						bcnum: $("#bcnum").val(),
					};
					
					dataParam = $("#Form").serialize();
					
					$.ajax({
						url: boardLikeURL,
						type: reqType,								
						data: dataParam,	            
						success: whenSuccess				
					});
					
					function whenSuccess(resData){
						alert("resData : " + resData);
						console.log("resData : " + resData);			
						$("#disp_cnt_stop").text(resData);
						$("#haty").val(resData);
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
			td.semi_title{text-align:center;}
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
		<div class="header">
		<div class="upperH">링크1 / 링크2 / 링크3 / 링크4 / 링크 5  &nbsp; 마이페이지
			<div>
			<%
				String mnum = null;
				String mid = null;
				Object objMnum = session.getAttribute("KNUM");
				Object objMid = session.getAttribute("KID");
				
				if (objMnum != null) {
					mnum = (String)objMnum;
					mid = (String)objMid;
			%>
				<p>
					<%= mid %>(<%= mnum %>) 님 안녕하세요!! 
					<a href="logout.pc">로그아웃</a> | 
					<a href="calendar.pc" >캘린더</a> |
					<a href="memInsertForm.pc" >회원가입</a>
					<% String link =  "memSelect.pc?mnum=" + mnum;%>
					<a href="<%= link %>">회원정보</a>
				</p>
			<% 
				}else{
			%>
				<p>
					<a href="loginForm.pc" >로그인</a> |
					<a href="memInsertForm.pc" >회원가입</a>
					
				</p>
			<%
				}
			%>		
			</div>
		
		</div>
		<div class="lowerH">로고 / 박람회(버튼) 커뮤니티(버튼) 쇼핑몰(버튼) 지도(버튼) 공지사항(버튼)</div>
		</div>
		<div class="container">
		<script>
			if(<%=mid%> === null || "<%=mid%>" === ""){
				alert("먼저 로그인 해주세요 "+ <%=mid%>);
				location.href="mainPage.pc";
			}
		</script>
		<div class="title">커뮤니티</div>
		<form action="Form" id="Form" name="Form">
			<input type="hidden" class="insert_1" id="mnum" name="mnum" value="<%=mnum %>" readonly/>
			<input type="hidden" class="insert_1" id="mid" name="mid" value="<%=mid %>" readonly/>
			<table class="table table-sm table-striped table-hover table-bordered" style="width:100%;">
			
			<% 
			Object obj = request.getAttribute("listS");
			if(obj == null) return;
			
			List<CommunitiesVO> list = (List<CommunitiesVO>)obj;
			int i = list.size();
			String bcnum = "";

			CommunitiesVO cvo = null;
			if(i == 1) { 
				 cvo = list.get(0);
				bcnum = cvo.getBcnum();

			}
			%>
				<tr>
					<td class="semi_title" style="width:130pt;height:40pt;">글번호</td>
					<td class="insert"><%=cvo.getBcnum() %></td>
					<input type="hidden" name="bcnum" id="bcnum" value="<%=bcnum %>">
					<input type="hidden" name="likey"  id="likey" value="<%= cvo.getLikey()%>">
					<input type="hidden" name="hate"  id="haty" value="<%= cvo.getHate() %>">
					<td class="insert" rowspan='4'><img id="bImage" src="/petCenter/fileupload/com/<%=cvo.getBcphoto() %>" width="400" height="400"  onerror="this.src='/petCenter/img/noImg.gif';"></td>
				</tr>
				<tr>
					<td class="semi_title">카테고리</td>
					<td class="insert"><%=cvo.getBcc() %></td>	
				</tr>
				<tr>
					<td class="semi_title">글제목</td>
					<td class="insert"><%=cvo.getBctitle() %></td>
				</tr>
				<tr>
					<td class="semi_title">작성자</td>
					<td class="insert"><%=cvo.getMid() %></td>
				</tr>
				<tr>
					<td align="center" colspan="3"> 추천  <%= cvo.getLikey() %>&nbsp; 반대  <%= cvo.getHate() %>&nbsp; 조회 <%= cvo.getBchit() %> &nbsp; 작성일자 : <%= cvo.getUdate() %></td>
				</tr>
				<tr>
					<td class="semi_title">글내용</td>
					<td class="insert" colspan='2'><textarea class="insert_1" id="bccontent" name="bccontent" rows="10"  required readonly><%=cvo.getBccontent() %></textarea></td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:center" >
						<input type="button" class="like_1" name="like_1" id="like_1" value="추천">

							<img src='/petCenter/img/like/heart.png' style='width:12px; margin:3px 3px 0 0;'>
							<span id="disp_cnt_recom"><%= cvo.getLikey() %></span>

						<input type="button" class="like_2" name="like_2" id="like_2" value="반대">

							<img src='/petCenter/img/like/thumb_rev.png' style='width:12px; margin:3px 3px 0 0;'>
							<span id="disp_cnt_stop"><%= cvo.getHate() %></span>

					</td>
				<tr>
				<tr>
					<td colspan="3" class="gbuttons">
						<input type="button" id="toMain" name="toMain" value="메인화면"/>
						<input type="button" id="cMain" name="cMain" value="글목록"/>
					</td>
				</tr>
			
			</table>
		</form>
		<div>
			<!-- 댓글 처리 하는 루틴  --> 
			<jsp:include page="/replyForm.pc">
				<jsp:param value="<%=bcnum%>" name="bcnum"/>
			</jsp:include>
		</div>
		</div>
	</body>
</html>