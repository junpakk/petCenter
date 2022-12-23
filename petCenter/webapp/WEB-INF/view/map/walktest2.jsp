<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>선의 거리 계산하기</title>
		<style>
			.dot {overflow:hidden;float:left;width:12px;height:12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
			.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
			.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
			.number {font-weight:bold;color:#ee6152;}
			.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
			.distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
			.distanceInfo .label {display:inline-block;width:50px;}
			.distanceInfo:after {content:none;}
		</style>
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
				{lat:37.386245010039936, lon:127.12712931689654},
			];
		</script>
	</head>
	<body>
		<div id="map" style="width:1000px;height:900px;"></div>  
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e2a549944561293fdf3d307b172230ec"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		    mapOption = { 
		        //center: new kakao.maps.LatLng(37.384875128912206, 127.12318057520164), // 지도의 중심좌표
		        center: new kakao.maps.LatLng(33.452344169439975, 126.56878163224233), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		var polyline = new kakao.maps.Polyline({
		    map: map,
		    path: [
		        new kakao.maps.LatLng(33.452344169439975, 126.56878163224233),
		        new kakao.maps.LatLng(33.452739313807456, 126.5709308145358),
		        new kakao.maps.LatLng(33.45178067090639, 126.5726886938753) 
		    ],
		    strokeWeight: 3,
		    strokeColor: '#FF00FF',
		    strokeOpacity: 1,
		    strokeStyle: 'solid'
		});		
		
		/*		
        // 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
        clickLine = new kakao.maps.Polyline({
            map: map, // 선을 표시할 지도입니다 
            path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
            strokeWeight: 3, // 선의 두께입니다 
            strokeColor: '#db4040', // 선의 색깔입니다
            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid' // 선의 스타일입니다
        });
		

		
		setInterval(displayHello, 1000);

function displayHello() {
  document.getElementById("demo").innerHTML += "Hello";
}
		
		
		*/
		
		
		
		</script>
	
	</body>
</html>