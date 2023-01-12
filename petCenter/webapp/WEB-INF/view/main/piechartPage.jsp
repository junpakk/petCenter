<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.ResultSetMetaData" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.DriverManager" %>

<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>

<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>

<%@ page import="java.io.BufferedWriter" %>

<%@ page import="java.io.File" %>
<%@ page import="java.io.FileWriter" %>
<%@ page import="java.io.IOException" %> 

<%@ page import=" org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>   

<%@ page import="java.util.ArrayList" %>

<% request.setCharacterEncoding("UTF-8"); %>    
<%
	
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("piechart.jsp 페이지 : ");
	
	StringBuffer sb = new StringBuffer();
	sb.append("SELECT ");
	sb.append("COUNT(CASE WHEN A.MPET LIKE '%mp0%' THEN 1 END) AS DOG, ");
	sb.append("COUNT(CASE WHEN A.MPET LIKE '%mp1%' THEN 1 END) AS CAT, ");
	sb.append("COUNT(CASE WHEN A.MPET LIKE '%mp2%' THEN 1 END) AS BIRD, ");
	sb.append("COUNT(CASE WHEN A.MPET LIKE '%mp3%' THEN 1 END) AS REPTILE ");
	sb.append("FROM PC_MEMBER A");
	
	logger.info(sb.toString());
	
	
	Context ct = new InitialContext();			
	DataSource ds = (DataSource) ct.lookup("java:comp/env/jdbc/jndi_spring_orclKSH00");	
	Connection conn = ds.getConnection();
	
	PreparedStatement stmt = conn.prepareStatement(sb.toString());
	
	ResultSet rsRs = stmt.executeQuery();	
	
	ResultSetMetaData resultMeta = rsRs.getMetaData();
	int colCount = resultMeta.getColumnCount();
	
	String jArrStr = "";	
						
	JSONArray jArr = new JSONArray();
	JSONObject jObj = null;
	
	while (rsRs.next()){
		
		jObj = new JSONObject();
		
		for (int i=0; i < colCount; i++){
			String columnName = resultMeta.getColumnName(i+1);
			String dataName = rsRs.getString(i+1);
		
			jObj.put(columnName, dataName);
		}
		
		if (jObj !=null){
			jArr.add(jObj);
			jArrStr = jArr.toString();
		}
	}
	
	String json_file_path = "C:\\00.KOSMO120\\30.web\\el_pc_work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\petCenter";
	String jsonFileName = "json_".concat("piechart").concat(".json").toLowerCase();
	logger.info("jsonFileName >>> : " + jsonFileName);
	File jsonFile = new File(json_file_path + "/" + jsonFileName);
	BufferedWriter bw = new BufferedWriter(new FileWriter(jsonFile));
	bw.write(jArrStr);
	bw.flush();
	bw.close(); 
	
	
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
	//구글 시각화 API를 로딩하는 메소드
  	google.charts.load('current', {packages: ['corechart']});

  	
  	// 버튼 동작
  	$(document).ready(function(){
  		
  		
    	$(function(){
        
     	var jsonUrl = "/petCenter/json_piechart.json";
        
        $.ajax({
        	url : jsonUrl,
           	type: "POST",         
           	dataType: "text",
           	success: whenSuccess
    	});
        
        function whenSuccess (data){                           
        	var vv = JSON.parse(data);   // JSON 형식의 문자열을 자바스크립트 객체로 변환함.

             // 파이 차트 1
             function drawChart() {
             	// 버튼 클릭 시 ajax를 사용하여 서버로부터 json 배열 객체를 가져왔다고 가정함
             	var arr = [
             				  ['동물','좋아하는사람'],
             				  ['강아지', Number(vv[0].DOG)],
             				  ['고양이', Number(vv[0].CAT)],
             				  ['새', Number(vv[0].BIRD)],
             				  ['파충류', Number(vv[0].REPTILE)]
                         ];
                 
                 // 실 데이터를 가진 데이터테이블 객체를 반환하는 메소드
                 var dataTable = google.visualization.arrayToDataTable(arr);
                 
                 // 옵션객체 준비
                 var options = {
                             title: '회원 동물 선호도'
                             
                             
                            };
                 var chart = new google.visualization.PieChart(document.getElementById('piechart'));
                	chart.draw(dataTable, options);
                 
              } // drawColumnChart1()의 끝

             google.charts.setOnLoadCallback(drawChart);

           }
       	});
    	
    	
	    $("#btn").on('click', function(){
	
				
				let city = $('#city').val();
				let appid = "5ff7484cc271679ce86712bca5d06803";
				
				/* 검색 */
				let url = "https://api.openweathermap.org/data/2.5/weather?q="+city+"&appid="+appid+"&units=metric";
	
				fetch(url)
					.then((response) => {
				    	return response.json();
				  	})
				  	.then((json) => {
				    	console.log(json);
				
				    	let result = "온도 : " + Math.floor(json.main.temp) + "ºC<br>" //소수점 버림 온도를 찍어줌
					                + "습도 : " + json.main.humidity + "%<br>" //습도를 찍어줌
					                + "바람 : " + json.wind.speed + "m/s<br>" //풍속을 찍어줌
					                + "최고온도 : " +Math.floor(json.main.temp_max) + "C<br>" //소수점 버림 온도를 찍어줌
					                + "최저온도 : " +Math.floor(json.main.temp_min)  + "ºC" //소수점 버림 온도를 찍어줌
				    	let icon = json.weather[0].icon; //아이콘 받아옴
				    	document.getElementById("cityname").innerHTML = city; //result를 humidity라는 id를 가진 span에 innerHTML로 표시
					  	document.getElementById("humidity").innerHTML = result; //result를 humidity라는 id를 가진 span에 innerHTML로 표시
					  	let iconurl = document.getElementById('ic'); //img id를 iconurl이라는 이름으로 받아옴
					  	iconurl.src = "http://openweathermap.org/img/wn/" + icon + ".png"; //iconurl로 src를 설정해줌
				  });			
		});
	    
	    //최초 서울날씨
		fetch("https://api.openweathermap.org/data/2.5/weather?q=seoul&appid=5ff7484cc271679ce86712bca5d06803&units=metric")
			.then((response) => {
		    	return response.json();
		  	})
		  	.then((json) => {
		    	console.log(json);
		
		    	let result = "온도 : " + Math.floor(json.main.temp) + "ºC<br>" //소수점 버림 온도를 찍어줌
			                + "습도 : " + json.main.humidity + "%<br>" //습도를 찍어줌
			                + "바람 : " + json.wind.speed + "m/s<br>" //풍속을 찍어줌
			                + "최고온도 : " +Math.floor(json.main.temp_max) + "C<br>" //소수점 버림 온도를 찍어줌
			                + "최저온도 : " +Math.floor(json.main.temp_min)  + "ºC" //소수점 버림 온도를 찍어줌
		    	let icon = json.weather[0].icon; //아이콘 받아옴
		    	document.getElementById("cityname").innerHTML = "seoul"; //result를 humidity라는 id를 가진 span에 innerHTML로 표시
			  	document.getElementById("humidity").innerHTML = result; //result를 humidity라는 id를 가진 span에 innerHTML로 표시
			  	let iconurl = document.getElementById('ic'); //img id를 iconurl이라는 이름으로 받아옴
			  	iconurl.src = "http://openweathermap.org/img/wn/" + icon + ".png"; //iconurl로 src를 설정해줌
		  });		

	});
</script>
<style type="text/css">


  .charth {
  	 	 padding: 15px 40px;
  }
  
  .weatherh {
  	 	 margin-left: 100px;
  }
  

  .card {
    margin-top: 20px;
    margin-left: 100px;
    width: 300px;
    height: 350px;
    background-color: white;
    text-align: center;
  }
  #humidity {
    line-height: 50px;
    font-size: x-large;
  }
  #ic {
    width: 70px;
    height: 70px;
  }

  
</style>
</head>
<body>
	<table>
		<tr>
			<td>
				<h1 class="charth" align="left">Pet Center 동물 선호도 조사</h1>
			</td>
			<td>
				<h1 class="weatherh">오늘의 날씨 검색</h1>
			</td>
		</tr>
		<tr>
			<td>
				<div id="piechart" style="width:600px; height:400px;" align="center"></div>
			</td>
			<td>
				<div class="weatherh">
					<form name="weatherForm" id="weatherForm">
					도시명 : <input type="text" name="city" id="city" placeholder="ex) seoul" />
							<input type="button" id="btn" value="검색"><img src="/petCenter/img/weather.png" width="30px" height="30px">
					</form>
				</div>
				<div class="card">
					<h3 id="cityname"></h3>
					<img id="ic" src="">
					<br>
					<span id="humidity">검색해주세요</span>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>