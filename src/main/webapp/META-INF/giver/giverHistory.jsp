<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<title>捐贈者歷史紀錄</title>
</head>
<body>
	<div><a href="http://localhost:8080/softleader-iii-eeit78/index.jsp">回首頁</a></div>
	<div>
	<h2>篩選條件(可多重查詢):</h2>
		<form action="<c:url value='/giverHistory/giverHistoryAction!selectByAllCondition' />" method="POST">
			<p>依活動ID: <input type="text" name="allCondition.campaign_id" size="10"></p>
			<p>依活動名稱(或關鍵字): <input type="text" name="allCondition.campaign_name" size="15"></p>
			<p>依金額範圍: <input type="text" name="allCondition.minAmount" size="10"> 到 <input type="text" name="allCondition.maxAmount" size="10"> 元</p>
			<p>依捐贈日範圍: <input type="date" name="allCondition.afterDate"> 到 <input type="date" name="allCondition.beforeDate"></p>
			<input type="submit" value="送出" onclick="loadByForm"><input type="button" value="清除" onclick="cleanForm"><br /><hr />
		</form>
	</div>
	<div>
	<h2>${sessionScope.giver.name} 您好, 您的捐款紀錄如下:</h2>
		<table id="resultTable">
			<tr>
				<th>活動ID</th>
				<th>活動名稱</th>
				<th>捐款金額</th>
				<th>捐款日期</th>
			</tr>
		</table>
	</div>
<script>
	var campaignId = null;
	var campaign = null;
	var url1 = '${pageContext.request.contextPath}/giverHistory/giverHistoryAction!selectAll';
	var url2 = '${pageContext.request.contextPath}/giverHistory/giverHistoryAction!selectByAllCondition';
	var url3 = '${pageContext.request.contextPath}/giverHistory/giverHistoryAction!selectByAllConditionCount';
	var url4 = '${pageContext.request.contextPath}/campaign/campaignAction!selectByAllCondition';
	
 	$.getJSON(url1, {'allCondition.giver_id':"${giver.id}"}, loadAll);
 	function loadByForm(){
 		$.getJSON(url2, {'allCondition.giver_id':"${giver.id}",'':''}, loadAll);
 	}
 	
	function loadAll(data){
		$.each(data, function(name, value){
			campaignId = value.campaign_id;
			$.getJSON(url4, {'campaignForm.id':campaignId}, function(data){
				campaign = data.get(0);
			})
			console.log("campaign="+campaign);
			$('#resultTable').append("<tr>"	
										+ "<td>"+ value.campaign_id +"</td>"
										+ "<td>"+ campaign.name +"</td>"
										+ "<td>"+ value.amount +"</td>"
										+ "<td>"+ value.date +"</td>"
									+"</tr>");
		})
	}
	
	function cleanForm(){
		$("input:text").text("");
	}
</script>
</body>
</html>