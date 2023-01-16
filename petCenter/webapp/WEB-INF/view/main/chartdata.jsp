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
	sb.append("COUNT(CASE WHEN A.MPET LIKE '%mp0%' AND A.DELYN = 'Y' THEN 1 END) AS DOG, ");
	sb.append("COUNT(CASE WHEN A.MPET LIKE '%mp1%' AND A.DELYN = 'Y' THEN 1 END) AS CAT, ");
	sb.append("COUNT(CASE WHEN A.MPET LIKE '%mp2%' AND A.DELYN = 'Y' THEN 1 END) AS BIRD, ");
	sb.append("COUNT(CASE WHEN A.MPET LIKE '%mp3%' AND A.DELYN = 'Y' THEN 1 END) AS REPTILE, ");
	sb.append("COUNT(CASE WHEN A.DELYN = 'Y' THEN 1 END) AS COUNT ");
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

</head>
<body>
<script>
	alert("차트 데이터 업데이트 완료");
	
	location.href="mainPage.pc";
	
</script>

</body>
</html>