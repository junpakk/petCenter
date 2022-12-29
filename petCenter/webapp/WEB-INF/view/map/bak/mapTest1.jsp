<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>지도 레벨 바꾸기</title>
	</head>
	<body>
		<div id="map" style="width:100%;height:350px;"></div>
		<p>
		    <button onclick="zoomIn()">지도레벨 - 1</button>
		    <button onclick="zoomOut()">지도레벨 + 1</button>
		    <span id="maplevel"></span>
		</p>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e2a549944561293fdf3d307b172230ec"></script>
		<script type="text/javascript">
		
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
	
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
			// 지도 레벨을 표시합니다
			displayLevel();
			 
			// 지도 레벨은 지도의 확대 수준을 의미합니다
			// 지도 레벨은 1부터 14레벨이 있으며 숫자가 작을수록 지도 확대 수준이 높습니다
			function zoomIn() {        
			    // 현재 지도의 레벨을 얻어옵니다
			    var level = map.getLevel();
			    
			    // 지도를 1레벨 내립니다 (지도가 확대됩니다)
			    map.setLevel(level - 1);
			    
			    // 지도 레벨을 표시합니다
			    displayLevel();
			}    
		
			function zoomOut() {    
			    // 현재 지도의 레벨을 얻어옵니다
			    var level = map.getLevel(); 
			    
			    // 지도를 1레벨 올립니다 (지도가 축소됩니다)
			    map.setLevel(level + 1);
			    
			    // 지도 레벨을 표시합니다
			    displayLevel(); 
			}    
			 
			function displayLevel(){
			    var levelEl = document.getElementById('maplevel');
			    levelEl.innerHTML = '현재 지도 레벨은 ' + map.getLevel() + ' 레벨 입니다.';
			}		
	
		</script>
	</body>
</html>