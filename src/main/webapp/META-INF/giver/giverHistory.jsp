<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>捐贈者歷史紀錄</title>

<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/softleader-iii-eeit78/css/giver.css">
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>
<style>
table, tr, th, td{
	border:1px solid black;
	margin:auto;
	height:40px;
	text-align:center;
}
form{
	text-align:left;
}
</style>

</head>
<body id="body">
	
	<jsp:include page="../../header.jsp" />
	
	<div>
	<h2>篩選條件:</h2><span>(可加入多重條件)</span>
	<div>
		<form action="<c:url value='/giverHistory/giverHistoryAction!selectByAllCondition' />" method="POST" onsumbit="loadByForm();">
			<p>依活動名稱(或關鍵字): <input type="text" name="allCondition.campaign_name" size="15"></p>
			<p>依金額範圍: <input type="text" name="allCondition.minAmount" size="10"> 到 <input type="text" name="allCondition.maxAmount" size="10"> 元</p>
			<p>依捐贈日範圍: <input type="date" name="allCondition.afterDate"> 到 <input type="date" name="allCondition.beforeDate"></p>
			<input type="submit" value="送出"><input type="button" value="清除" onclick="cleanForm();"><br /><hr />
		</form>
	</div>
	</div>
	<div>
	<h3>${sessionScope.giver.name}  您好，您的捐款紀錄如下:</h3>
		<table id="resultTable" class="resultTable">
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
	var url1 = '${pageContext.request.contextPath}/donate/giverDetailAllHistory!giverDetail';
	
 	$.getJSON(url1, {'thisId':"${giver.id}"}, loadAll);
	function loadAll(data){
		$.each(data, function(name, value){
			$('#resultTable').append("<tr>"	
										+ "<td>"+ value.campaignModel.id +"</td>"
										+ "<td>"+ value.campaignModel.name +"</td>"
										+ "<td>"+ value.amount +"</td>"
										+ "<td>"+ value.date +"</td>"
									+"</tr>");
		})
	}
	
 	function loadByForm(){
 		$.getJSON(url2, {'allCondition.giver_id':"${giver.id}",'':''}, loadAll);
 	}
	function cleanForm(){
		$("input:text").text("");
	}
</script>
</body>
</html>