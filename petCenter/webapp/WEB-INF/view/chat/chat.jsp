<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		
	
		//채팅서버주소
		let url = "ws://192.168.219.105:8088/petCenter/chatserver";
		//웹소켓
		let ws;
		//연결하기
		$("#connectChat").click(function(){
			alert("#connectChat 버튼 클릭");
			//유저명 확인
			if($("#user").val().trim() != ""){
				//연결
				ws = new WebSocket(url);
				
				//소켓 이벤트 매핑
				ws.onopen = function(evt){
					console.log("서버 연결 성공");
					print($("#user").val(), "입장했습니다.");
					
					//현재 사용자가 입장하면 서버에게 통지(유저명 전달)
					ws.send("1#" + $("#user").val() + "#");
					$("#user").attr("readonly", true);
					$("#connectChat").attr("disabled", true);
					$("#disconnectChat").attr("disabled", false);
					$("#msg").attr("disabled", false);
					$("#msg").focus();
				};
				
				ws.onmessage = function(evt){
					alert(""+ evt.data);
					let index = evt.data.indexOf("#", 2);
					console.log("index: "+ index);
					let no = evt.data.substring(0,1);
					console.log("no: "+ no);
					let user = evt.data.substring(2, index);
					console.log("user: "+ user);
					let txt = evt.data.substring(index + 1);
					console.log("txt: "+ txt);
					
					if(no == "1"){
						print2(user);
					}else if(no == "2"){
						print(user, txt);
					}else if(no == "3"){
						print3(user);
					}
					$("#listChat").scrollTop($("#listChat").prop("scrollHeight"));
				};
				
				ws.onclose = function(evt){
					console.log("소켓이 닫힙니다.");
				};
				
				ws.onerror = function(evt){
					console.log(evt.data);
				};
			}else{
				alert("유저명을 입력하세요.");
				$("#user").focus();
			}
		});
		
		//메시지 전송 및 아이디
		function print(user, txt){
			let temp = "";
			temp += "<div style='margin-bottom:3px;'>";
			temp += "["+ user +"]";
			temp += txt;
			temp += " <span style='font-size:11px; color:#777;'>"
				 + new Date().toLocaleTimeString()
				 + "</span>";
			temp += "</div>";
			
			$("#listChat").append(temp);
		}
		
		//다른 클라이언트도 접속
		function print2(user){
			let temp = "";
			temp += "<div style='margin-bottom:3px;'>";
			temp += "'"+ user +"' 이(가) 접속했습니다.'";
			temp += " <span style='font-size:11px; color:#777;'>"
				 + new Date().toLocaleTimeString()
				 + "</span>";
			temp += "</div>";
			
			$("#listChat").append(temp);
		}
		
		//클라이언트 접속 종료
		function print3(user){
			let temp = "";
			temp += "<div style='margin-bottom:3px;'>";
			temp += "'"+ user +"'이(가) 종료했습니다.";
			temp += " <span style='font-size:11px; color:#777;'"
				 + new Data().toLocaleTimeString()
				 + "</span>";
			temp += "</div>";
			
			$("#listChat").append(temp);			
		}
		
		$("#user").keydown(function(){
			if(event.keyCode == 13){
				$("#connectChat").click();
			}
		});
		
		$("#msg").keydown(function(){
			if(event.keyCode == 13){
				//서버에게 메시지 전달
				//2#유저명#메시지
				ws.send("2#" + $("#user").val()+ "#" +$(this).val());//서버에게 전달
				print($("#user").val(), $(this).val());//본인 대화창에
				
				$("#msg").val("");
				$("#msg").focus();
			}
		});
		
		$("#disconnectChat").click(function(){
			ws.send("3#"+ $("#user").val() +"#");
			ws.close();
			
			$("#user").attr("readonly", false);
			$("#user").val("");
			
			$("#connectChat").attr("disabled", false);
			$("#disconnectChat").attr("disabled", true);
			
			$("#msg").val("");
			$("#msg").attr("disabled", true);
		});
	});//end of ready()
	
</script>
<style type="text/css">
		/*500px*/
		.containerChat{
			width:400px;
		}
		
		.listChat{
			height: 300px;
			padding: 15px;
			overflow: auto;
		}
		
</style>
</head>
<body>
<div class="containerChat">
	<h1 class="headerChat">PC Chat</h1>
	<table class="tableChat">
		<tr>
			<td>
				<input type="text" name="user" id="user" class="" placeholder="유저명">
			</td>
			<td>
				<button type="button" class="" id="connectChat">연결</button>
				<button type="button" class="" id="disconnectChat">종료</button>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="listChat" id="listChat"></div>
			</td>		
		</tr>
		<tr>
			<td colspan="2">
				<input type="text" class="controlChat" name="msg" id="msg" placeholder="대화 내용을 입력하세요." disabled>
			</td>
		</tr>
	</table>
</div>
</body>
</html>