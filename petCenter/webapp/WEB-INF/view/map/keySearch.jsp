<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0 maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	    <title>키워드로 장소검색하기</title>
	    <style>
			.info{font-size:20px;}
			
			.customoverlay {position:relative;bottom:52px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
			.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
			.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
			.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
			.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	
			
	    </style>
	    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	    <script type="text/javascript">
	    
	    	$(document).ready(function(){
	    
				// 지도가 이동, 확대, 축소로 인해 중심좌표가 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
			    kakao.maps.event.addListener(map, 'center_changed', function() {

			        // 지도의 중심좌표를 얻어옵니다 
			        var latlng = map.getCenter(); 
			        //var messageLevel = '지도레벨 '+ level;
			        var messageLat = '위도 ' + latlng.getLat();
			        var messageLon = '경도 ' + latlng.getLng();
			        //var result_level = document.getElementById('result-level');
			        var result_lat = document.getElementById('result-lat');
			        var result_lon = document.getElementById('result-lon');
			        //result_level.innerHTML = messageLevel;
			        result_lat.innerHTML = messageLat;
			        result_lon.innerHTML = messageLon;
			    });
				
				$("#search").click(function(){
					var keyw = document.getElementById('keyword').value;
				    var rang = document.getElementById('range').value;						
			        //var res_lat = document.getElementById('result-lat').value;
			        //var res_lon = document.getElementById('result-lon').value;
				    
					// 장소 검색 객체를 생성합니다
					//var ps = new kakao.maps.services.Places(map);

					removeMarker();

					if(customOverlay){
						customOverlay.setMap(null);
					}					
					
				    ps.keywordSearch( keyw, placesSearchCB, {
					    radius : rang,
					    //location: new kakao.maps.LatLng(res_lat, res_lon)
					    useMapCenter : true,
					    //x:res_lon,
					    //y:res_lat
					}); 					    
				    
				});
	    
	    	});
	    </script>
	    
	</head>
	<body>
		<jsp:include page="../include/header.jsp" flush="true">
			<jsp:param name="url" value="produectSelectAll.jsp"/>
		</jsp:include>
		<br><br>
		<div class="map_wrap">
			<div id="map" style="width:700px;height:600px;margin-left: auto; margin-right: auto;border:5px double #000;border-radius: 10px;"></div>
			<br>
		    <div id="menu_wrap" class="bg_white" style="text-align:center;">
		        <div class="option">
		            <div>
		                키워드 : <input type="text" value="동물병원" id="keyword" size="15">
		                반경 : <input type="text" value="1000" id="range" size="5">
		                <button type="button" id="search">검색하기</button>
		            </div>
		            <p id="result-level"></p>
		            <p id="result-lat"></p>
		            <p id="result-lon"></p>
		        </div>
		    </div>
		</div>
		<br><br><br>
		<jsp:include page="../include/footer.jsp" flush="true">
			<jsp:param name="url" value="produectSelectAll.jsp"/>
		</jsp:include>     		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e2a549944561293fdf3d307b172230ec&libraries=services"></script>
		<script>
		
		// 마커를 담을 배열입니다
		var markers = [];
		var circle;
		var customOverlay;
		
		
		// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
		/*
		var infowindow = new kakao.maps.InfoWindow({
			zIndex: 1,
			removable: true
		});
		*/
		
		var mapContainer = document.getElementById('map'); // 지도를 표시할 div
		var mapOption = {
		        center: new kakao.maps.LatLng(37.384875128912206, 127.12318057520164), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();
		// 지도 타입 컨트롤을 지도에 표시합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);		
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);		

		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(map); 
		
		// 키워드로 장소를 검색합니다
		var keyword = document.getElementById('keyword').value;
	    var range = document.getElementById('range').value;		

	    ps.keywordSearch( keyword, placesSearchCB, {
		    radius : range,
		    //location: new kakao.maps.LatLng(lat, lng)
		    useMapCenter : true,
		    //x:lng,
		    //y:lat
		}); 			
  
	    
		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {

		    	//최초 실행시에는 circle이 없을테니 예외처리를 해줍니다.
		        if (circle) { 
    				circle.setMap(null);
				}		    	
		    	
		      	//현시점 지도의 중심좌표
		        latlng = map.getCenter();
		        
		     	//지도에 표시할 원을 생성합니다
		        circle = new kakao.maps.Circle({
		            center : new kakao.maps.LatLng(latlng.getLat(), latlng.getLng()),  // 원의 중심좌표 입니다 
		            radius: document.getElementById('range').value, // 미터 단위의 원의 반지름입니다 
		            strokeWeight: 1, // 선의 두께입니다 
		            strokeColor: '#75B8FA', // 선의 색깔입니다
		            strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		            strokeStyle: 'dashed', // 선의 스타일 입니다
		            fillColor: '#CFE7FF', // 채우기 색깔입니다
		            fillOpacity: 0.4  // 채우기 불투명도 입니다   
		        }); 

		        // 지도에 원을 표시합니다 
		        circle.setMap(map); 			    	
		    	
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new kakao.maps.LatLngBounds();
		
		        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);    
		            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		        }       
		
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);

		        //var level = map.getLevel();
		        //console.log("level >>> ", level);
		        //map.setLevel(level+1);			        
		        
		    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

		        alert('검색 결과가 존재하지 않습니다.');
		        return;

		    } else if (status === kakao.maps.services.Status.ERROR) {

		        alert('검색 결과 중 오류가 발생했습니다.');
		        return;

		    }
		}
		
		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {
			
		    // 마커를 생성하고 지도에 표시합니다
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: new kakao.maps.LatLng(place.y, place.x) 
		    });
		
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
		    
		    // 마커에 클릭이벤트를 등록합니다
		    kakao.maps.event.addListener(marker, 'click', function() {
		        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
/*
				var itemStr = '<span class="info">id: ' + place.id + '<br/>';
				itemStr +=  'name: ' + place.place_name + '<br/>'; 
				//itemStr +=  'cname: ' + place.category_name + '<br/>'; 
				//itemStr +=  'cgcode: ' + place.category_group_code + '<br/>'; 
				//itemStr +=  'cgname: ' + place.category_group_name + '<br/>'; 
				itemStr +=  'phone: ' + place.phone + '<br/>'; 
				itemStr +=  'addr: ' + place.address_name + '<br/>'; 
				itemStr +=  'raddr: ' + place.road_address_name + '<br/>'; 
				//itemStr +=  'x(lon): ' + place.x + '<br/>'; 
				//itemStr +=  'y(lat): ' + place.y + '<br/>'; 
				itemStr +=  'dis: ' + place.distance + '<br/>'; 
				itemStr +=  'url: <a href=' + place.place_url + '>상세보기</a></span><br/>'; 
*/
				if(customOverlay){
					customOverlay.setMap(null);
				}
				
				var itemStr ='<div class="customoverlay">' +
				    '<a href="'+ place.place_url +'" target="_blank">' +
				    '<span class="title">'+ place.place_name+'<br>';
			    if(place.road_address_name){
			    	itemStr += place.road_address_name+'<br>'
			    }else{
			    	itemStr += place.address_name+'<br>'
			    }
			    
			    itemStr += place.phone+'<br></span>' +
				    '</a>' +
				    '</div>';				

			 	// 커스텀 오버레이가 표시될 위치입니다 
			    var pos = new kakao.maps.LatLng(place.y, place.x); 

			    // 커스텀 오버레이를 생성합니다
			    customOverlay = new kakao.maps.CustomOverlay({
			        map: map,
			        position: pos,
			        content: itemStr,
			        yAnchor: 1 
			    });				    
				    
				
		        //infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
		        //infowindow.setContent(itemStr);
		        //infowindow.open(map, marker);
		    });
		}
		
		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}		

		</script>
	</body>
</html>