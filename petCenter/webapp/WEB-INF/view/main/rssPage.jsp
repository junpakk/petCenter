<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.io.BufferedReader" %>
<%@ page import = "java.io.InputStreamReader" %>
<%@ page import = "java.net.URL" %>
<%@ page import = "java.io.File" %>
<%@ page import = "java.io.FileWriter" %>

<%@ page import = "org.apache.log4j.Logger" %>
<%@ page import = "org.apache.log4j.LogManager" %>

<%
	Logger logger = LogManager.getLogger(getClass());
	logger.info("rss");
	
	String strLine = "";
	try {
		String strUrl = "http://www.animalrights.kr/rss/allArticle.xml";
		
		BufferedReader br = new BufferedReader(
				new InputStreamReader((new URL(strUrl))
						.openConnection().getInputStream(),"UTF-8"));
		
		//String filePath = "C:\\00.KOSMO120\\30.web\\el_pc_work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\petCenter\\WEB-INF\\view\\main";
		String filePath = "C:\\00.KOSMO120\\30.web\\el_pc_work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\petCenter";
		String fileName = "ajax_pc_rss.xml";
		File xmlFile = new File(filePath + "/" + fileName);
		
		FileWriter fw = new FileWriter(xmlFile);
		while ((strLine = br.readLine()) != null) {
			//logger.info(strLine);
			fw.write(strLine);
		}
		
		fw.flush();
		fw.close();
		
	}catch(Exception e) {
		throw e;
	}
%>

<style type="text/css">


  .rsh {
  	 	 padding: 15px 60px;
  }
  .rd {
  		padding: 10px 15px;
		


  }
  
  .rss li{
  		padding: 10px 200px 10px 20px;
  		border-bottom: 1px solid #adacac;

  		text-align: left;
  
  }
  .rstd {
  		white-space : nowrap;
  		padding: 10px 320px 10px 320px;
  		background-color: #e8e8e8;
  }
  
 
  
</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RSS 읽기</title>
<!-- jQuery CDN 불러오기  -------------------------------------------->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	//console.log("javascript");
	
	$(document).ready(function() {

		
		$(function() {
			
			let urlV = "/petCenter/ajax_pc_rss.xml";
			let dtV = "xml";
			
			$.ajax({
				url: urlV,
				dataType: dtV,
				success: function(data) {
					

					console.log("data >>> : " + data);
					
					var $items = $(data).find("item");

					
					if ($items.length > 0) {
						
						$items = $items.slice(0, 5);
						
						var $ulTag = $("<ul />");
						
						$.each($items, function(i, item_data) {
							
							var $title = $(item_data).find('title').text();
							var $link = $(item_data).find('link').text();
							
							var $aTag = $("<a />").attr({
								"href":$link,
								"target":"_blank"
							}).text($title);
							
							var $liTag = $("<li />").append($aTag);
							
							$ulTag.append($liTag);
							
						});
						$('.rss').append($ulTag);
					}
				},
				error: function(e) {
					alert(e.responseText);
				}
			});
		});
	});
	
</script>
</head>
<body>

<br>
<div align="left">
	
	<h1 class="rsh" align="left">애니멀라이트 뉴스기사</h1><br>
	<div class="rd">
	<table>
		<tr>
			<td class="rstd"> 제목 </td>
			<td rowspan="2"><a href="http://www.animalrights.kr/"><img src="/petCenter/img/news.PNG" width="500" height="280"/></a></td>
		</tr>
		<tr>
			<td  class="rss">
			</td> 
		</tr>
	</table>
	</div>
</div>
</body>
</html>