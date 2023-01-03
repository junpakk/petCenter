<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0 maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
		<title>Walk History</title>
		
		<link rel="stylesheet" href="/petCenter/calendar_datepicker/jquery-ui-1.12.1/jquery-ui.min.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="/petCenter/calendar_datepicker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
		
		<script src="/petCenter/calendar_datepicker/jquery-ui-1.12.1/datepicker-ko.js"></script>

		<script type="text/javascript">
			alert("javascript  >>> ");
			
			$(document).ready(function(){
				alert("ready >>> ");
				
				$("#delBtn").click(function(){
					alert("delBtn button click >>> ");

					let walkURL = "walkHisDel.pc";
					let reqType = "POST";
					
					let memberid = $("#memberid").val();
					if(memberid === null || typeof(memberid) === "undefined" || memberid === ""){
						alert("아이디를 기입해주세요");
						return false;
					}
					
					let sDate = $("#sDate").val();
					if(sDate === null || typeof(sDate) === "undefined" || sDate === ""){
						alert("시작날짜를  기입해주세요");
						return false;
					}
					
					let eDate = $("#eDate").val();
					if(eDate === null || typeof(eDate) === "undefined" || eDate === ""){
						alert("종료날짜를 기입해주세요");
						return false;
					}
					
					let dataParam = {
							mid:memberid,
							startDate:sDate,
							endDate:eDate
					};
					
					$.ajax({
						url : walkURL,
						type : reqType,
						data : dataParam,
						success : function(d){
							if("IYES" === d){
								alert("삭제되었습니다");
								console.log("삭제되었습니다");
							}else if("INO" == d){
								alert("삭제대상이 없습니다")
								console.log("삭제되지 않았습니다");
							}
						},
						error : function(e){
							console.log("e >>> "+e.responseText);
						}
					});
				});

				$("#sDate").datepicker({
					onSelect:function(dateText, inst) {
						console.log(dateText);
						console.log(inst);
					}
				});
				
				$("#eDate").datepicker({
					onSelect:function(dateText, inst) {
						console.log(dateText);
						console.log(inst);
					}
				});						

				
				$("#startDate").datepicker({
					onSelect:function(dateText, inst) {
						console.log(dateText);
						console.log(inst);
					}
				});
				
				$("#endDate").datepicker({
					onSelect:function(dateText, inst) {
						console.log(dateText);
						console.log(inst);
					}
				});						
				
				$("#searchBtn").click(function(){
					alert("searchBtn button click >>> ");

					$("#mapHisSearchForm").attr({"action":"walkHisSrch.pc","method":"GET"}).submit();
				});

			});
			/*
			showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다. 
			buttonImage: "/application/db/jquery/images/calendar.gif", // 버튼 이미지 
			buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다. 
			changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다. 
			changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다. 
			minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다. 
			nextText: '다음 달', // next 아이콘의 툴팁. 
			prevText: '이전 달', // prev 아이콘의 툴팁. 
			numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다. 
			stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
			yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가. 
			showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
			currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널 
			closeText: '닫기', // 닫기 버튼 패널 
			dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식. 
			showAnim: "slide", //애니메이션을 적용한다. 
			showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
			dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식. 
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식. 
			yearRange: "2010:2013" //연도 범위
			*/		
			
		</script>
		<style type='text/css'>
		.container{
			width:700px;
			margin:0 auto;
		}
		</style>		
			
	</head>
	<body>
	<div class='container'>
		<h3>지난산책로보기</h3>
		<form name="mapHisSearchForm" id="mapHisSearchForm">
			
			<input type="text" id="mid" name="mid" placeholder="아이디" required>&nbsp;&nbsp;
			
			<input type="text" id="startDate" name="startDate" size="12" placeholder="시작일" required>
			<input type="button" value="달력" onclick="$('#startDate').datepicker('show');" /> - 
			<input type="text" id="endDate" name="endDate" size="12" placeholder="종료일" required>
			<input type="button" value="달력" onclick="$('#endDate').datepicker('show');" />

			<br>
			<br>
			
			<input type="button" id="searchBtn" name="searchBtn" value="조회">
			<input type="reset" value="리셋">
			
		</form>
		
		<h3>지난산책로삭제</h3>
		<form name="mapHistoryForm" id="mapHistoryForm">
			
			<input type="text" id="memberid" name="memberid" placeholder="아이디" required>&nbsp;&nbsp;
			
			<input type="text" id="sDate" name="sDate" size="12" placeholder="시작일" required>
			<input type="button" value="달력" onclick="$('#sDate').datepicker('show');" /> - 
			<input type="text" id="eDate" name="eDate" size="12" placeholder="종료일" required>
			<input type="button" value="달력" onclick="$('#eDate').datepicker('show');" />
			
			<br>
			<br>
			
			<input type="button" id="delBtn" name="delBtn" value="삭제">
			<input type="reset" value="리셋">
			
		</form>		
	</div>

	</body>
</html>