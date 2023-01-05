<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ page import="main.pc.reply.vo.ReplyVO" %> 
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>

<%@ page import=" org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("reply.jsp >>> : ");
	
	String bcnum = request.getParameter("bcnum");
	String mid = (String)session.getAttribute("KID");
	String mnum = (String)session.getAttribute("KNUM");

	logger.info("replyForm bcnum : " + bcnum);
	logger.info("replyForm mid : " + mid);
%>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		
		

		//brcontent 길이 제한 200byte
		$("#brcontent").keydown(function(){
			cut_200(this);
		});
		
		// 댓글 전체 불러오기 
		selectAll();
		
		
<%-- 		$(function(){
			var a = $('#replylist[class="mnum"]').val();
			if(<%=mnum%>!=a){
				$("#deleteBtn".hide());
			}
		}); --%>

		
		// 댓글 등록
		$(document).on("click", "#insert1Btn", function(){
			console.log("insert1Btn : ");
			
			let insertURL = "replyInsert.pc";		
			let method = "POST";
			let dataParam = {
				bcnum: $("#bcnum").val(),
				mid: $("#mid").val(),
				brcontent: $("#brcontent").val(),
			};
			dataParam = $("#replyForm").serialize();
			console.log("dataParam : " + dataParam);
			
			$.ajax({
				url: insertURL,
				type: method,
				data: dataParam,
				success: whenSuccess,
				error: whenError
			});
			
			function whenSuccess(resData){	
				alert("resData : " + resData);	
				if ("GOOD" == resData){
					// 입력데이터 초기화 함수호출 
					rboardFormData();
					location.reload();
					selectAll();
				}
			}
			function whenError(e){
				alert("e : " + e.responseText);
			}

		});
		
		// 댓글 삭제		
		$(document).on("click", ".deleteBtn", function(){
			console.log("D : ");
			
			var mmnum = $(this).parents("li").children("input:eq(0)").val();
			var nnum = "<%=mnum%>";
			

			if(nnum != mmnum){
				alert("정보가 일치하지 않습니다.");
				return false;
			}
			
			var brnumV = $(this).parents("li").attr("dataNum");
			alert("brnumV : " + brnumV);
			console.log("brnumV : " + brnumV);

			var target = $(this).parents(".brmemoItem");
			alert("target : " + target);
			console.log("target : " + target);
			
			let deleteURL = "replyDelete.pc";
			let method = "POST";
			let dataParam = {
				brnum: $('#brnum').val(brnumV),	

			};		
			dataParam = $("#replyForm").serialize();
			console.log("dataParam : " + dataParam);
			
					
			$.ajax({
				url: deleteURL,
				type: method,
				data: dataParam,
				success: whenSuccess,
				error: whenError
			});
			
			function whenSuccess(resData){					
				console.log("resData : " + resData);				
				if ("GOOD" == resData){
					alert("댓글이 삭제되었습니다.");
					target.remove();
				}	
			}
			function whenError(e){
				console.log("e : " + e.responseText);
			}
		});
	});
	
	// 게시글 번호로 댓글 전체조회 ============================================
	function selectAll(){

		let selectAllURL = "replySelectAll.pc";
		let method = "POST";
		let dataParam = {
			bcnum: $("#bcnum").val(),				
		};		
		dataParam = $("#replyForm").serialize();
		console.log("dataParam : " + dataParam);
		
		$.ajax({
			url: selectAllURL,
			type: method,
			data: dataParam,
			success: whenSuccess,
			error: whenError
		});

		function whenSuccess(resData){	
			console.log("whenSuccess replySelectAll resData : " + resData);

			if(isEmpty(resData)){
				return false;
			}
			
			
			let v = resData.split("&");
			for(let i=0; i < v.length; i++){
				console.log(v[i]);
				let vv = v[i].split(",");
				let j=0
				for (; j < vv.length-1; j++){
					console.log("vv[0] : " + vv[0]);
					console.log("vv[1] : " + vv[1]);
					console.log("vv[2] : " + vv[2]);
					console.log("vv[3] : " + vv[3]);					
				}
				addNewItem(vv[0], vv[1], vv[2], vv[3], vv[4]);
			}
		}
		function whenError(e){
			console.log("e : " + e.responseText);
		}	
	}
	
	//새로운 글 화면에 추가	=================================================
	function addNewItem(num, writer, content, datetime, mnum){
		
		//데이터 체크
		if(isEmpty(num)) return false;
		
		// 새로운 글이 추가될 li태그 
		var newLi = $("<li>");
		newLi.attr("dataNum", num);
		newLi.addClass("brmemoItem");
		// 작성자 정보가 지정될 <p> 태그 
		var writerP = $("<p>");
		writerP.addClass("writer");
		// 작성자 정보의 이름 
		var nameSpan = $("<span>");
		nameSpan.addClass("name");
		nameSpan.html(decodeURIComponent(writer) + "님");
		// 작성일시 
		var dateSpan = $("<span>");
		dateSpan.html(" / " + datetime + " ");
		// 삭제 버튼 
		var delInput = $("<input>");
		delInput.attr({"type":"button", "value":"삭제하기"});
		delInput.addClass("deleteBtn");
		// 회원번호 
		var num = $("<input>");
		num.attr({"type":"hidden", "value":"" + mnum + ""});
		num.addClass("mmnum");
		// 내용
		var contentP = $("<p>");
		contentP.html(decodeURIComponent(content));
		
		// 조립하기
		writerP.append(nameSpan).append(dateSpan).append(delInput);
		newLi.append(writerP).append(contentP).append(num);
		$("#replylist").append(newLi);
	}
	
	// 댓글 길이 체크  ========================================================
	//한글 포함 문자열 길이
	function getTextLength(s){
		var len = 0;
		for(var i=0; i < s.length; i++){
			if(escape(s.charAt(i)).length == 6){
				len++;
			}
			len++;
		}
		return len;
	}
	function cut_200(obj){
		var t = $(obj).val();
		var l = t.length;
		while(getTextLength(t) > 200){
			l--;
			t= t.substring(0, l);
		}
		$(obj).val(t);
		$('.bytes').text(getTextLength(t));
	}
	
	//댓글 등록 후 입력창 초기화
	function rboardFormData(){
		$("#brcontent").val("");
	}
	
	//데이터 체크
	function isEmpty(val){
		if(typeof val=="undefined" || val==null || val==""){
			return true;
		}else{
			return false;
		}
	}
	
		
</script>
</head>
<body>
<div id="container" align="center">
<form name="replyForm" id="replyForm">
<table border="1">
<h3>댓글</h3>


		<tr>

			<td colspan="2">
				<%=mid %> 님
				<input type="hidden" name="mid" id="mid" value="<%=mid%>"/>
				<input type="hidden" name="bcnum" id="bcnum" value="<%=bcnum%>">
				<input type="hidden" name="mnum" id="mnum" value="<%=mnum %>">
				<input type="hidden" name="brnum" id="brnum">
			    <input type="button" value="등록" id="insert1Btn">
			</td>
		</tr>
		<tr>
			<td>댓글 내용</td>
			<td>
				<textarea name="brcontent" id="brcontent" rows="5" cols="50" style="resize: none"></textarea>	
				<span class="bytes">0</span>bytes
			</td>	
		</tr>
		<tr>
			<td colspan="2">
				<ul name="replylist" id="replylist">
				<!-- 여기에 동적 생성 요소가 들어온다. -->
			
				</ul>
			</td>
		</tr>
</table>
</form></div>
</body>
</html>