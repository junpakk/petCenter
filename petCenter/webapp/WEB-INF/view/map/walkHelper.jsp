<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0 maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
		<title>산책도우미</title>
		<style>
			.dot {overflow:hidden;float:left;width:12px;height:12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
			.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:20px;font-weight:bold;padding:5px;background:#fff;}
			.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
			.number {font-weight:bold;color:#ee6152;}
			.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
			.distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
			.distanceInfo .label {display:inline-block;width:50px;}
			.distanceInfo:after {content:none;}
			
			#menu_wrap {position:absolute;top:20px;left:820px;bottom:0;width:250px;height:60px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:40px;font-weight:bold;border-radius: 10px;}
			.bg_white {background:#FF0000;}
			#menu_wrap .timeDisplay{text-align: center;}
			#map {width:700px;height:600px;}
			
		</style>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="/petCenter/resources/js/testdata.js"></script>
		<script src="/petCenter/resources/js/mapUtil.js"></script>
		<script type="text/javascript">

			//이동좌표를 저장할 리스트
			var paths = [];
			//테스트용 좌표이동을 위한 오프셋
			var shift = 0;
			//선을 그릴 객체 참조변수
			var polyline;
			//테스트로 시간을 빨리가도록 설정, 추후 1000으로 변경할것
			const DSTIME = 100;
			//콜백 인터벌, 추후 조정할것
			const INTERVAL = 1000;
			//지도 범위 재설정 변수
			var bounds;
			//거리를 나타날 오버레이
			var distanceOverlay;
			//거리표시 시간함수 id
			var timerId;
			//타이머 표시 함수
			var timerTid;
			//이용자 아이디
			var mid;			
			
			//시간표시 변수
	        var totalSeconds = 0;

	        $(document).ready(function(){
	        	
				//시간표시 타이머함수
		        function setTime(){
		            
		        	totalSeconds = totalSeconds + 1;
		            $("#seconds").text(pad(totalSeconds%60));
		            $("#minutes").text(pad(parseInt(totalSeconds/60)));
		            $("#hours").text(pad(parseInt(totalSeconds/(60*60))));
		        }	        	
	        	
		        $(document).on("click", "#start", function(){
		        	
		        	mid = $("#mid").val();
					if(mid === null || typeof(mid) === "undefined" || mid === ""){
						alert("아이디를 기입해주세요");
						return false;
					}			
					//지도위 오버레이와 선을 지운다
			    	if(distanceOverlay){
				        distanceOverlay.setMap(null);
				        distanceOverlay = null;			    		
			    	}

					if(polyline){
						polyline.setMap(null);
						polyline.setPath(paths);	    	
					}
					
					//타이머 초기화 재설정
					if(timerId){
						clearInterval(timerId);
						timerId = null;
					}
					timerId = setInterval(displayCallback, INTERVAL);

					if(timerTid){
						clearInterval(timerTid);
						timerTid = null;
					}
					totalSeconds = 0;
		            $("#hours").text("00");
		            $("#minutes").text("00");
		            $("#seconds").text("00");					

					shift = 0;
			    	paths = [];            
		            
					timerTid = setInterval(setTime, DSTIME);	        	
		        	
		        });
		        
				$(document).on("click","#stop", function(){
					
					if(timerId){
						clearInterval(timerId);
						timerId = null;
					}

					if(timerTid){
						clearInterval(timerTid);
						timerTid = null;
					}
					
					alert("산책이 종료되었습니다");
				});
				
				$("#reset").click(function(){
					
					//지도위 오버레이와 선을 지운다
			    	if(distanceOverlay){
				        distanceOverlay.setMap(null);
				        distanceOverlay = null;			    		
			    	}

					if(polyline){
						polyline.setMap(null);
						polyline.setPath(paths);	    	
					}
					
					//타이머 초기화 재설정
					if(timerId){
						clearInterval(timerId);
						timerId = null;
					}

					if(timerTid){
						clearInterval(timerTid);
						timerTid = null;
					}
					totalSeconds = 0;
		            $("#hours").text("00");
		            $("#minutes").text("00");
		            $("#seconds").text("00");	
		            
		            $("#mid").text("");
		            
					shift = 0;
			    	paths = [];

			    	location.reload();
				});	       		        
	        });
 
		</script>
	</head>
	<body>
	<%
		Object mnum_ = session.getAttribute("KNUM");
		Object mid_ = session.getAttribute("KID");
		
		String mnum = null;
		String mid = null;
		
		if(mnum_ != null) mnum = (String)mnum_;
		if(mid_ != null) mid = (String)mid_;

	%>
	<script>
		if(<%=mid%> === null || "<%=mid%>" === ""){
			alert("먼저 로그인 해주세요 "+ <%=mid%>);
			location.href="mainPage.pc";
		}
	</script>
	
	<jsp:include page="../include/header.jsp" flush="true">
		<jsp:param name="url" value="produectSelectAll.jsp"/>
	</jsp:include>
	<br><br>
	<div>
		<div id="map" style="margin-left: auto; margin-right: auto;border:5px double #000;border-radius: 10px;"></div>
	    <div id="menu_wrap" class="bg_white" >
	        <div class="timeDisplay">
				<label id="hours">00</label>
				<label class="colon">:</label>
				<label id="minutes">00</label>
				<label class="colon">:</label>
				<label id="seconds">00</label>
	        </div>
	    </div>
	    <br>
	    <div style="text-align:center;">
	    	<input type="text" name="mid" id="mid" value='<%= mid %>' readonly/>	    
	    	<button type="button" id="start">산책시작</button>
	    	<button type="button" id="stop">산책종료</button>
	    	<button type="button" id="reset">초기화</button>
	    	
	    </div>
	</div>
	<br><br><br>
	<jsp:include page="../include/footer.jsp" flush="true">
		<jsp:param name="url" value="produectSelectAll.jsp"/>
	</jsp:include>     
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e2a549944561293fdf3d307b172230ec"></script>
		
		<script>
		// 지도의 중심좌표 안드로이드 현재 위치정보로 대체할것
		const mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		    mapOption = { 
		        center: new kakao.maps.LatLng(37.384875128912206, 127.12318057520164), 
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		//선을 그릴 객체 생성
		polyline = new kakao.maps.Polyline({
		    map: map,
		    strokeWeight: 7,
		    strokeColor: '#FF0000',
		    strokeOpacity: 1,
		    strokeStyle: 'solid'
		});				
		
		//테스트 위치데이터 -> 안드로이드위치로 변경할것
		const lodata = rowdata[ Math.round( Math.random()*10 ) % 3];
		
		function displayCallback() {

			console.log("shift / lodata.length >>> ", shift, lodata.length);
	 
			//테스트 데이터 끝!
			if(shift >= lodata.length){
				if(timerId){
					clearInterval(timerId);
					timerId = null;
				}
				if(timerTid){
					clearInterval(timerTid);
					timerTid = null;
				}						
				shift = 0;
				paths = [];
				return false;
			}
			
			paths.push(new kakao.maps.LatLng(lodata[shift].lat, lodata[shift].lon));
			
			let walkURL = "walkInsert.pc";
			let reqType = "POST";
			let sLat = lodata[shift].lat+"";
			let sLon = lodata[shift].lon+"";
			let dataParam = {
					mid:mid,
					maplat:sLat,
					maplon:sLon,
					maplaps:totalSeconds
			};
			
			$.ajax({
				url : walkURL,
				type : reqType,
				data : dataParam,
				success : function(d){
					if("IYES" === d){
						console.log("입력되었습니다");
					}else if("INO" == d){
						console.log("입력이 되지 않았습니다");
					}
				},
				error : function(e){
					console.log("e >>> "+e.responseText);
				}
			});
			
			bounds = new kakao.maps.LatLngBounds();
			for(let i=0; i<paths.length; i++){
				bounds.extend(paths[i]);
			}
			
			//지도 범위를 재설정
			map.setBounds(bounds);
			
			shift += 1;
			
			if(polyline){
				polyline.setMap(null);
				polyline.setPath(paths);

				var distance = Math.round(polyline.getLength());
				console.log("distance >>> ", distance);
				contents = '<div class="dotOverlay">총거리 <span class="number">' + distance + '</span> m</div>'; // 커스텀오버레이에 추가될 내용입니다
				
				polyline.setMap(map);
				
			    if (distance > 0) {
			    	//이미 오버레이가 있으면 지웁니다.
			    	if(distanceOverlay){
				        distanceOverlay.setMap(null);
				        distanceOverlay = null;			    		
			    	}
			        // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
			        distanceOverlay = new kakao.maps.CustomOverlay({
			            content: contents,
			            position: paths[paths.length-1],
			            yAnchor: 1,
			            zIndex: 2
			        });
			
			        // 지도에 표시합니다
			        distanceOverlay.setMap(map);
			    }				
			}
		  
		}
		</script>
	
	</body>
</html>