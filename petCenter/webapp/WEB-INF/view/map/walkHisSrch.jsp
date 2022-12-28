<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>

<%@ page import="main.pc.map.vo.MapVO" %>
    
<%@ page import="org.apache.log4j.LogManager" %>    
<%@ page import="org.apache.log4j.Logger" %>    
    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>walkHistorySearch</title>
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
			#map {width:700px;height:600px;}
			
		</style>		
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
			var paths = [];
		</script>
		
	</head>
	<body>
	<h3>walkHistorySearch</h3>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e2a549944561293fdf3d307b172230ec"></script>
	<div id="map"></div>
	<div class="container" >
	<% request.setCharacterEncoding("UTF-8"); %>
	<%
		Logger logger = LogManager.getLogger(this.getClass());
		logger.info("walkHisSrch.jsp >>> ");
	%>

		<table border="1" class="table-sm table-striped table-hover table-bordered" style="width:700px;">
			<thead>
				<tr>
					<th><input type="checkbox" id="chk0" name="chk0" class="chk0"></th>
					<th>맵번호</th>
					<th>아이디</th>
					<th>위도</th>
					<th>경도</th>
					<th>산책일</th>
				</tr>
			</thead>
			<%
				int totalCount = 0;
			
				Object obj = request.getAttribute("mList");
				if(obj == null) {return;}
				
				List<MapVO> mlist = (List<MapVO>)obj;
				logger.info("blist.size() >>> "+mlist.size());
				if(mlist.size() > 0){
					for(int i=0; i<mlist.size(); i++){
						MapVO mvo = mlist.get(i);
						
						totalCount = Integer.parseInt(mvo.getTotalCount());

			%>
			<script>
				//맵에 산책경로 그리기 위한 데이터
				paths.push(new kakao.maps.LatLng(Number(<%=mvo.getMaplat()%>), Number(<%=mvo.getMaplon()%>)));
			</script>
			<tbody>
				<tr>
					<td>
						<input type="checkbox" id="mapnum" name="mapnum" class="mapnum" value=<%= mvo.getMapnum() %>>
					</td>
					<td><%=mvo.getMapnum() %></td>
					<td><%=mvo.getMid() %></td>
					<td><%=mvo.getMaplat() %></td>
					<td><%=mvo.getMaplon() %></td>
					<td><%=mvo.getIdate() %></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td colspan="6">
						<jsp:include page="mapPaging.jsp" flush="true">
							<jsp:param name="url" value="walkHisSrch.pc"/>
							<jsp:param name="str" value="mid=${paging.mid}&startDate=${paging.startDate}&endDate=${paging.endDate}"/>
							<jsp:param name="pageSize" value="${paging.pageSize}"/>
							<jsp:param name="groupSize" value="${paging.groupSize}"/>
							<jsp:param name="curPage" value="${paging.curPage}"/>
							<jsp:param name="totalCount" value="<%=totalCount %>"/>
						</jsp:include>
					</td>
				</tr>
				<%
				}
				%>
<!-- 				<tr> -->
<!-- 					<td colspan="6" > -->
<!-- 						<input type="button" value="등록" id="I" class="sitebtn"> -->
<!-- 						<input type="button" value="글내용보기" id="contentsBtn" class="sitebtn" />	 -->
<!-- 						<input type="button" value="수정" id="U" class="sitebtn" > -->
<!-- 						<input type="button" value="삭제" id="D" class="sitebtn" >					 -->
<!-- 					</td> -->
<!-- 				</tr> -->
			</tbody>
		</table>
	</div>		

    <div id="menu_wrap" class="bg_white">
        <div class="timeDisplay">
			<label id="hours">00</label>
			<label class="colon">:</label>
			<label id="minutes">00</label>
			<label class="colon">:</label>
			<label id="seconds">00</label>
        </div>
    </div>
<!--     <div> -->
<!--     	<input type="text" name="mid" id="mid" placeholder="아이디"/>	     -->
<!--     	<button type="button" id="start">산책시작</button> -->
<!--     	<button type="button" id="stop">산책종료</button> -->
<!--     	<button type="button" id="reset">초기화</button> -->
    	
<!--     </div> -->


	

	<script>
	//선을 그릴 객체 참조변수
	var polyline;
	//지도 범위 재설정 변수
	var bounds;
	//거리를 나타날 오버레이
	var distanceOverlay;

	var hoursLabel = document.getElementById("hours");
	var minutesLabel = document.getElementById("minutes");
	var secondsLabel = document.getElementById("seconds");
	var totalSeconds = 0;
	
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

	bounds = new kakao.maps.LatLngBounds();
	for(let i=0; i<paths.length; i++){
		bounds.extend(paths[i]);
	}
	
	//지도 범위를 재설정
	map.setBounds(bounds);	
	
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
	

	

	</script>

		
	</body>
</html>