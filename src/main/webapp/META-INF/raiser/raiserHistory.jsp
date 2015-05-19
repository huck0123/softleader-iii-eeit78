<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>
<script src="/softleader-iii-eeit78/js/useful.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>團體發起活動紀錄</title>
</head>
<body id="body">
	<div class="tab-pane fade" id="raiserHistory">
			<h3>複合查詢系統</h3>
			<br />
			<div>
				<form class="form-horizontal">
					<div class="form-group">
						<label for="keywordRH" class="col-sm-3 control-label">關鍵字搜尋</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="keywordRH"
								placeholder="輸入活動名稱 、類型、及地點">
						</div>
					</div>
					<div class="form-group">
						<label for="minAmountRH" class="col-sm-3 control-label">依金額範圍</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="minAmountRH"
								placeholder="輸入較小金額">
						</div>
						<label for="maxAmountRH" class="col-sm-1 control-label">到</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="maxAmountRH"
								placeholder="輸入較大金額">
						</div>
					</div>
					<div class="form-group">
						<label for="afterDateRH" class="col-sm-3 control-label">依日期範圍</label>
						<div class="col-sm-4">
							<input type="datetime-local" class="form-control" id="afterDateRH"
								placeholder="選擇較小日期">
						</div>
						<label for="beforeDateRH" class="col-sm-1 control-label">到</label>
						<div class="col-sm-4">
							<input type="datetime-local" class="form-control" id="beforeDateRH"
								placeholder="選擇較大日期">
						</div>
					</div>
				</form>
			</div>
			<br />
			<button type="button" class="btn btn-primary" onclick="loadByForm();">送出篩選</button>
			<button type="button" class="btn btn-warning" onclick="cleanForm();">清除條件</button>

			<div>
				<br />
				<hr />
				<br />
				<h3 style="display: inline-block;">${raiser.name}您好，您曾發起過的活動紀錄如下</h3>
				<button type="button" class="btn btn-success btn-xs"
					onclick="showAll();">顯示所有紀錄</button>
				<br /> <br />
				<table id="resultTableRH" class="table table-hover">
					<thead>
						<tr>
							<th>活動名稱</th>
							<th>活動類型</th>
							<th>活動地點</th>
							<th>目標金額</th>
							<th>當前金額</th>
							<th>發起時間</th>
							<th>截止日期</th>
						</tr>
					</thead>
					<tbody id="tbodyRH">
					</tbody>
				</table>
			</div>
		</div>
	<script>
		var urlForRaiserHistory = '${pageContext.request.contextPath}/raiser/raiserSelectAll!getRaiserHistory';
		$.post(urlForRaiserHistory, {
			"name" : "${raiser.name}"
		}, getData);
		function getData(data) {
			$(data).each(
					function(index, campaign) {
						console.log(index +"," +campaign)
						$("#tbodyRH").append(
								"<tr><td>" + campaign.name + "</td>" + "<td>"
										+ campaign.type + "</td>" + "<td>"
										+ campaign.location + "</td>" + "<td>"
										+ campaign.goal + "</td>" + "<td>"
										+ campaign.currentFund + "</td>"
										+ "<td>" + campaign.startDate + "</td>"
										+ "<td>" + campaign.endDate
										+ "</td></tr>");
					})
		}
	</script>
</body>
</html>
