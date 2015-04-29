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
		<form name="conditionForm" action="<c:url value='/giverHistory/giverHistoryAction!selectByAllCondition' />" method="POST">
			<p>依活動ID: <input type="text" name="allCondition.campaign_id" size="10"></p>
			<p>依活動名稱(或關鍵字): <input type="text" name="allCondition.campaign_name" size="15"></p>
			<p>依金額範圍: <input type="text" name="allCondition.minAmount" size="10"> 到 <input type="text" name="allCondition.maxAmount" size="10"> 元</p>
			<p>依捐贈日範圍: <input type="date" name="allCondition.afterDate"> 到 <input type="date" name="allCondition.beforeDate"></p>
			<input type="submit" value="送出條件"><input type="button" value="清除條件" onclick="cleanForm"><br /><hr />
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
	var childTr = $('<tr></tr>');
	var childTd = $('<td></td>');
	var url1 = '${pageContext.request.contextPath}/giverHistory/giverHistoryAction!selectAll';
	var url2 = '/softleader-iii-eeit78/giverHistory/giverHistoryAction!selectByAllCondition';
	var url3 = '/softleader-iii-eeit78/giverHistory/giverHistoryAction!selectByAllConditionCount';
	
	$.getJSON(url1, {'allCondition.giver_id':"${giver.id}"}, loadAll);
	$.getJSON(url2, {'allCondition.giver_id':"${giver.id}"}, loadAll);
	
	function loadAll(data){
		$.each(data, function(name, value){
			console.log(value);
			$('#resultTable').after(childTr);
			$.each(value,function(){
				$("tr:last").prepend(childTd);
				$("td:last").prepend(value);
			})
		})
	}
	
	function cleanForm(){
		$("input:text,date").text("");
	}
</script>
</body>
</html>