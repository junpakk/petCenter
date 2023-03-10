<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0 maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	    <title>클릭한 위치에 마커 표시하기</title>
	</head>
	<body>
		<div id="map" style="width:1200px;height:700px;"></div>
		<p><em>지도를 클릭해주세요!</em></p> 
		<div id="clickLatlng"></div>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e2a549944561293fdf3d307b172230ec"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
			
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			// 지도를 클릭한 위치에 표출할 마커입니다
			var marker = new kakao.maps.Marker({ 
			    // 지도 중심좌표에 마커를 생성합니다 
			    position: map.getCenter() 
			}); 
			// 지도에 마커를 표시합니다
			marker.setMap(map);
			
			// 지도에 클릭 이벤트를 등록합니다
			// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
			kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
			    
			    // 클릭한 위도, 경도 정보를 가져옵니다 
			    var latlng = mouseEvent.latLng; 
			    
			    // 마커 위치를 클릭한 위치로 옮깁니다
			    marker.setPosition(latlng);
			    
			    var message = "{lat:"+latlng.getLat() + ', lon:'+latlng.getLng()+"},";
			    
			    var resultDiv = document.getElementById('clickLatlng'); 
			    resultDiv.innerHTML = message;
			    
			});
		</script>
	</body>
</html>