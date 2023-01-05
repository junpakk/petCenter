<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%@ page import="main.pc.member.vo.MemberVO" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ����ȸ</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("memSelectAll.jsp >>> : ");
%>
<%
	// ����¡ ���� ����
	int pageSize = 0;
	int groupSize = 0;
	int curPage = 0;
	int totalCount = 0;
	
	// ���ǰ˻� ���� ����
	String searchFilter = null;
	String keyword = null;
// 	String startDate = null;
// 	String endDate = null;
	String str = null;
	
	Object objSearch = request.getAttribute("searchMVO");
	MemberVO smvo = (MemberVO)objSearch;
	
	searchFilter = smvo.getSearchFilter();
	keyword = smvo.getKeyword();
// 	startDate = smvo.getStartDate();
// 	endDate = smvo.getEndDate();
	
	
	logger.info("searchFilter >>> : " + searchFilter);
	logger.info("keyword >>> : " + keyword);
// 	logger.info("startDate >>> : " + startDate);
// 	logger.info("endDate >>> : " + endDate);
	
	if (searchFilter == null || searchFilter.length() == 0){
		searchFilter = "key_00";
	}
	if (keyword == null || keyword.length() == 0){
		keyword = "";
	}
// 	if (startDate == null || startDate.length() == 0){
// 		startDate = "";
// 	}
// 	if (endDate == null || endDate.length() == 0){
// 		endDate = "";
// 	}
	
	str = "searchFilter=" + searchFilter + "&"
			+ "keyword=" + keyword;
// 			+ "startDate=" + startDate + "&"
// 			+ "endDate=" + endDate;
	
%>

<script type="text/javascript">
	alert("javascript");
	
	$(function() {
		alert("jQuery");
		
		// mnum üũ�ڽ� üũ�Ҷ� �ٸ� mnum üũ�ڽ� ����
		$(document).on("click", "#mnum", function(){
			
			if($(this).prop('checked')){
				$('.mnum').prop('checked', false);
				$(this).prop('checked', true);
			}
		});
		
		var searchFilter = '<%= searchFilter %>';
		var keyword = '<%= keyword %>';
<%-- 		var startDate = '<%= startDate %>'; --%>
<%-- 		var endDate = '<%= endDate %>'; --%>
		
		if(searchFilter == null || searchFilter == 'null' || searchFilter == ""){
			$("#searchFilter").val("key_00");
		}else{
			$("#searchFilter").val(searchFilter);
		}
		if(keyword == null || keyword == 'null' || keyword == ""){
			$("#keyword").val("");
		}else{
			$("#keyword").val(keyword);
		}
// 		if(startDate == null || startDate == 'null' || startDate == ""){
// 			$("#startDate").val("");
// 		}else{
// 			$("#startDate").val(startDate);
// 		}
// 		if(endDate == null || endDate == 'null' || endDate == ""){
// 			$("#endDate").val("");
// 		}else{
// 			$("#endDate").val(endDate);
// 		}
		
		// ���ǰ˻�
		$("#searchFilter").change(function(){
			$("#keyword").val("");
		});
		
		$("#searchBtn").click(function(){
			alert("���ǰ˻� >>> : Ŭ��");
			
			$("#memSelectAll").attr({
				'action':'memSelectAll.pc',
				'method':'GET',
				'enctype':'application/x-www-form-urlencoded'
			}).submit();
		});
		
		// s
		$(document).on("click", "#selectBtn", function(){
			alert("selectBtn >>> : click() ");
			
			if($(".mnum:checked").length == 1){
				$("#memSelectAll").attr({
					'action':'memSelect.pc',
					'method':'GET',
					'enctype':'application/x-www-form-urlencoded'
				}).submit();
			}else{
				alert("��ȸ�� ��� �ϳ��� �����ϼ��� !!!");
			}
		});
		
		// u
		$(document).on("click", "#updateBtn", function(){
			alert("updateBtn >>> : click() ");
			
			if($(".mnum:checked").length == 1){
				$("#memSelectAll").attr({
					'action':'memSelectForm.pc',
					'method':'POST',
					'enctype':'application/x-www-form-urlencoded'
				}).submit();
			}else{
				alert("������ ��� �ϳ��� �����ϼ��� !!!");
			}
		});
		
		// d
		$(document).on("click", "#deleteBtn", function(){
			alert("deleteBtn >>> : click() ");
			
			if($(".mnum:checked").length == 1){
				$("#memSelectAll").attr({
					'action':'memDelete.pc',
					'method':'POST',
					'enctype':'application/x-www-form-urlencoded'
				}).submit();
			}else{
				alert("������ ��� �ϳ��� �����ϼ��� !!!");
			}
		});
		
		// SALL
		$(document).on("click", "#selectAllBtn", function(){
			alert("selectAllBtn >>> : click() ");
			location.href="memSelectAll.pc";
		});
		
	});
	
</script>

<style type="text/css">

	.tt, .head {
		text-align: center;
	}
	
</style>

</head>
<body>
<div class="container">

<form name="memSelectAll" id="memSelectAll">
<table border="1" align="center" class="table table-sm table-striped table-hover table-bordered" >
<!-- <table border="1" align="center" class="table table-sm table-bordered w-auto" > -->
<thead>
<tr>
	<td colspan="8" >
	<h3 style="text-align: center;">Pet Center ȸ�����</h3>
	</td>
</tr>

<tr>
	<td colspan="8" >
		<select id="searchFilter" name="searchFilter" >
			<option value="key_00">��ü-----------</option>
			<option value="key_01">ȸ����ȣ</option>
			<option value="key_02">���̵�</option>
		</select>
		<input type="text" id="keyword" name="keyword" placeholder="�˻��� �Է�" >
<!-- 		<input type="text" id="startDate" name="startDate" size="10" placeholder="������" > -->
<!-- 		<input type="text" id="endDate" name="endDate" size="10" placeholder="������" > -->
		<input type="button" id="searchBtn" name="searchBtn" class="btn btn-primary btn-sm" value="�˻�">
		<input type="reset" id="resetBtn" name="resetBtn" class="btn btn-secondary btn-sm" value="����">
		<input type="button" id="selectAllBtn" name="selectAllBtn" class="btn btn-success btn-sm" value="��ü��ȸ">
	</td>
</tr>

<tr>
	<th class="head"></th>
	<th class="head">ȸ����ȣ</th>
	<th class="head">���̵�</th>
	<th class="head">�̸�</th>
	<th class="head">�ڵ���</th>
	<th class="head">�̸���</th>
	<th class="head">�����</th>
</tr>
</thead>

<%

	
	Object obj = request.getAttribute("listAll");
	if (obj == null) {return;}
	
	List<MemberVO> list = (List<MemberVO>)obj;
	if(list.size() > 0){
		
		pageSize = Integer.parseInt(smvo.getPageSize());
		groupSize = Integer.parseInt(smvo.getGroupSize());
		curPage = Integer.parseInt(smvo.getCurPage());
		totalCount = Integer.parseInt(list.get(0).getTotalCount());
		
		
		for (int i=0; i < list.size(); i++){
			MemberVO mvo = list.get(i);
			String mnum = mvo.getMnum();
			String mid = mvo.getMid();
			String mname = "";
			if(mvo.getMname() != null) mname = mvo.getMname();
			String mhp = "";
			if(mvo.getMhp() != null) mhp = mvo.getMhp();
			String memail = mvo.getMemail();
			String idate = mvo.getIdate();
%>
<tbody>
<tr>
	<td class="tt">
		<input type="checkbox" id="mnum" name="mnum" class="mnum" 
				value="<%= mnum %>" />
	</td>
	<td class="tt"><%= mnum %></td>
	<td class="tt"><%= mid %></td>
	<td class="tt"><%= mname %></td>
	<td class="tt"><%= mhp %></td>
	<td class="tt"><%= memail %></td>
	<td class="tt"><%= idate %></td>
</tr>
</tbody>
<%
		}//end of for
%>
<tr>
	<td colspan="8" >
	<jsp:include page="memPaging.jsp" flush="true">
		<jsp:param name="url" value="memSelectAll.pc" />
		<jsp:param name="str" value="<%=str %>" />
		<jsp:param name="pageSize" value="<%=pageSize %>" />
		<jsp:param name="groupSize" value="<%=groupSize %>" />
		<jsp:param name="curPage" value="<%=curPage %>" />
		<jsp:param name="totalCount" value="<%=totalCount %>" />
	</jsp:include>
	</td>
</tr>
<%
	}//end of if
%>

<tr>
	<td colspan="8" align="right">
<!-- 		<input type="button" value="���" id="insertBtn"> -->
		<input type="button" value="��ȸ" id="selectBtn" class="btn btn-success btn-sm">
		<input type="button" value="����" id="updateBtn" class="btn btn-warning btn-sm">
		<input type="button" value="����" id="deleteBtn" class="btn btn-danger btn-sm">
	</td>
</tr>


<caption style="text-align:right">��ȸ�� ȸ���� : <%= totalCount %> ��</caption>
</table>
</form>



</div>
</body>
</html>