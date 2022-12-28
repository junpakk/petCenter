<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>선의 거리 계산하기</title>
		<style>
			.dot {overflow:hidden;float:left;width:12px;height:12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
			.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:20px;font-weight:bold;padding:5px;background:#fff;}
			.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
			.number {font-weight:bold;color:#ee6152;}
			.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
			.distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
			.distanceInfo .label {display:inline-block;width:50px;}
			.distanceInfo:after {content:none;}
			
			#menu_wrap {position:absolute;top:280px;left:730px;bottom:0;width:250px;height:60px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:40px;font-weight:bold;border-radius: 10px;}
			.bg_white {background:#FF0000;}
			#menu_wrap .timeDisplay{text-align: center;}
			#map {width:1000px;height:900px;}
			
		</style>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
			//테스트용 위치 데이터		
			const lodata = [
				{lat:37.38625046472951, lon:127.12624291603392},
				{lat:37.38596203540181, lon:127.1263384127913},
				{lat:37.385539040016496, lon:127.12588321047316},
				{lat:37.38536358401065, lon:127.12565425991461},
				{lat:37.385134132114835, lon:127.12536311623847},
				{lat:37.384963213046454, lon:127.12510312361226},
				{lat:37.38483488315522, lon:127.12504080640684},
				{lat:37.384501937242575, lon:127.12463093353597},
				{lat:37.38390206582975, lon:127.12528484747126},
				{lat:37.38329898097863, lon:127.12471645096528},
				{lat:37.38240297521854, lon:127.12422944238908},
				{lat:37.381552958898766, lon:127.12499019240121},
				{lat:37.38088092548504, lon:127.1257173493216},
				{lat:37.38021537634821, lon:127.12669572764803},
				{lat:37.379538754225976, lon:127.12749059374279},
				{lat:37.38041376041101, lon:127.12863528595561},
				{lat:37.38091741173923, lon:127.12948015206571},
				{lat:37.380376107666656, lon:127.13010869282526},
				{lat:37.38017540337617, lon:127.13031440568618},
				{lat:37.38073965493482, lon:127.13134568772101},
				{lat:37.3803696359088, lon:127.1318841860083},
				{lat:37.38054058435312, lon:127.132104659699},
				{lat:37.381014256434106, lon:127.13153529193555},
				{lat:37.381652509087196, lon:127.13083353212251},
				{lat:37.38270504309897, lon:127.13232863725695},
				{lat:37.38368376255436, lon:127.13334658874406},
				{lat:37.38405085646203, lon:127.13139945202627},
				{lat:37.384580466347664, lon:127.12911947355579},
				{lat:37.38520314785883, lon:127.12822285188255},
				{lat:37.386245010039936, lon:127.12712931689654}
			];

	        var hoursLabel = document.getElementById("hours");
	        var minutesLabel = document.getElementById("minutes");
	        var secondsLabel = document.getElementById("seconds");
	        var totalSeconds = 0;

	        function setTime(){
	            
	        	totalSeconds = totalSeconds + 1;
	            secondsLabel.innerHTML = pad(totalSeconds%60);
	            minutesLabel.innerHTML = pad(parseInt(totalSeconds/60));
	            hoursLabel.innerHTML = pad(parseInt(totalSeconds/(60*60)));
	        }

	        function pad(val)
	        {
	            var valString = val + "";
	            if(valString.length < 2)
	            {
	                return "0" + valString;
	            }
	            else
	            {
	                return valString;
	            }
	        }			
			
		</script>
	</head>
	<body>
		<div id="map"></div>
	    <div id="menu_wrap" class="bg_white">
	        <div class="timeDisplay">
				<label id="hours">00</label>
				<label class="colon">:</label>
				<label id="minutes">00</label>
				<label class="colon">:</label>
				<label id="seconds">00</label>
	        </div>
	    </div>
	    <div>
	    	<input type="text" name="mid" id="mid" placeholder="아이디"/>	    
	    	<button type="button" id="start">산책시작</button>
	    	<button type="button" id="stop">산책종료</button>
	    	<button type="button" id="reset">초기화</button>
	    	
	    </div>
		    
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e2a549944561293fdf3d307b172230ec"></script>
		
		<script>
		
		//이동좌표를 저장할 리스트
		var paths = [];
		//테스트용 좌표이동을 위한 오프셋
		var shift = 0;
		//선을 그릴 객체 참조변수
		var polyline;
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

        var hoursLabel = document.getElementById("hours");
        var minutesLabel = document.getElementById("minutes");
        var secondsLabel = document.getElementById("seconds");
        var totalSeconds = 0;

        function setTime(){
            
        	totalSeconds = totalSeconds + 1;
            secondsLabel.innerHTML = pad(totalSeconds%60);
            minutesLabel.innerHTML = pad(parseInt(totalSeconds/60));
            hoursLabel.innerHTML = pad(parseInt(totalSeconds/(60*60)));
        }		
		
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		    mapOption = { 
		        center: new kakao.maps.LatLng(37.384875128912206, 127.12318057520164), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		//선을 그릴 객체 생성
		polyline = new kakao.maps.Polyline({
		    map: map,
		    strokeWeight: 7,
		    strokeColor: '#FF00FF',
		    strokeOpacity: 1,
		    strokeStyle: 'solid'
		});				
		
		var startBtn = document.getElementById("start");
		startBtn.addEventListener("click", function(){
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
            secondsLabel.innerHTML = "00";
            minutesLabel.innerHTML = "00";
            hoursLabel.innerHTML = "00";				

			shift = 0;
	    	paths = [];            
            
			timerTid = setInterval(setTime, 1000);

		});
		
		var stopBtn = document.getElementById("stop");
		stopBtn.addEventListener("click", function(){
			
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
		
		var resetBtn = document.getElementById("reset");
		resetBtn.addEventListener("click", function(){
			
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
            secondsLabel.innerHTML = "00";
            minutesLabel.innerHTML = "00";
            hoursLabel.innerHTML = "00";				
			
            document.getElementById("mid").textContent = "";
            
			shift = 0;
	    	paths = [];

	    	location.reload();
		});
		
		function displayCallback() {

			console.log("shift / lodata.length >>> ", shift, lodata.length);
			
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
					maplon:sLon
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