<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>捐贈者歷史紀錄</title>
</head>
<body>
	<div><a href="http://localhost:8080/softleader-iii-eeit78/index.jsp">回首頁</a></div>
	<div>
	<h2>搜尋條件(可多重查詢):</h2><br />
		<form action="">
			<h3>依活動ID: <input type="text" id="campaignId"></h3><br />
			<h3>依活動名稱(或關鍵字): <input type="text" id="campaignName"></h3><br />
			<h3>依金額範圍: <input type="text" id="minAmount">到<input type="text" id="maxAmount">元</h3><br />
			<h3>依捐贈日範圍: <input type="date" id="afterDate">到<input type="date" id="beforeDate"></h3><br />
			
		</form>
	</div>
	<div>
	<h2>${sessionScope.giver.name} 您好, 您的捐款細目如下:</h2>
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
	
	function loadAllByGiver_id(){
		$.getJSON('/softleader-iii-eeit78/tw.org.iiiedu.thegivers.web/GiverHistoryAction!selectAll',{},function(data){
			$(data).each(function(index, value){
				$('#resultTable').append(childTr);
				$(value).each(function(index2, value2){
					
				})
			})
		})
	}
</script>
</body>
</html>