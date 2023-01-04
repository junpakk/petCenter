<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버로그인</title>
</head>
<body>
<%
	String clientId = "F2JhUJ5_BUtYEkqpaC9U";//애플리케이션 클라이언트 아이디값";
	String clientSecret = "NCftYclFRN";//애플리케이션 클라이언트 시크릿값";
	
	String code = request.getParameter("code");
	String state = request.getParameter("state");
	
	String redirectURI = URLEncoder.encode("http://localhost:8088/petCenter/naverCallback.pc", "UTF-8");
	String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
					+ "&client_id=" + clientId
					+ "&client_secret=" + clientSecret
					+ "&redirect_uri=" + redirectURI
					+ "&code=" + code
					+ "&state=" + state;
	String access_token = "";
	String refresh_token = "";

	try {
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
		con.setRequestMethod("GET");
		
		int responseCode = con.getResponseCode();
		
		BufferedReader br;
		if (responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else {  // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		
		String inputLine;
		StringBuilder res = new StringBuilder();
		
		while ((inputLine = br.readLine()) != null) {
			res.append(inputLine);
		}
		
		br.close();
		
		if (responseCode == 200) {
			out.println(res.toString());
		}
		
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(res.toString());
		
		access_token = (String)jsonObject.get("access_token");
		System.out.println("access_token >>> : " + access_token);
		request.setAttribute("access_token", access_token);
		
		RequestDispatcher rd = request.getRequestDispatcher("/naverLogin.pc");
		rd.forward(request, response);
		
	} catch (Exception e) {
		System.out.println("네이버 로그인 에러" + e.getMessage());
	}
%>
</body>
</html>