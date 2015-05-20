<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>

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
							placeholder="輸入活動名稱 ">
					</div>
				</div>
				<div class="form-group">
					<label for="keywordTypeRH" class="col-sm-3 control-label">依類型查詢</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" id="keywordTypeRH"
							placeholder="輸入類型">
					</div>
					<label for="keywordLocRH" class="col-sm-2 control-label"
						style="text-align: left">依地點查詢</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="keywordLocRH"
							placeholder="輸入地點" style="text-align: left">
					</div>
				</div>
			</form>
		</div>
		<br />
		<div style="text-align: center">
			<button type="button" class="btn btn-primary" onclick="loadByForm();">送出篩選</button>
			<button type="button" class="btn btn-warning" onclick="cleanForm();">清除條件</button>
		</div>
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
						<th style="width: 100px">活動名稱</th>
						<th style="width: 100px">活動類型</th>
						<th style="width: 100px">活動地點</th>
						<th style="width: 100px">目標金額</th>
						<th style="width: 100px">當前金額</th>
						<th style="width: 100px">發起時間</th>
						<th style="width: 100px">截止日期</th>
					</tr>
				</thead>
				<tbody id="tbodyRH">
				</tbody>
			</table>
		</div>
	</div>
	<script>
		//以下顯示相關
		var urlForRaiserHistory = '${pageContext.request.contextPath}/raiser/raiserSelectAll!getRaiserHistory';
		$.post(urlForRaiserHistory, {
			"name" : "${raiser.name}"
		}, getData, "json");
		function getData(data) {
			$("#tbodyRH").empty();
			$
					.each(
							data,
							function(index, campaign) {
								if (campaign.raiserModel.id == "${raiser.id}") {

									var str1 = campaign.startDate.split(" ");
									var str2 = campaign.endDate.split(" ");
									if (str1[1].substring(0, str1[1]
											.lastIndexOf(",")).length == 1) {
										str1[1] = "0"
												+ str1[1].substring(0, str1[1]
														.lastIndexOf(","));
									} else {
										str1[1] = str1[1].substring(0, str1[1]
												.lastIndexOf(","));
									}
									var res1 = str1[2]
											+ "/"
											+ monthToNum(str1[0])
											+ "/"
											+ str1[1]
											+ "\t"
											+ str1[3].substring(0,
													str1[3].length - 3)
											+ str1[4];

									if (str2[1].substring(0, str2[1]
											.lastIndexOf(",")).length == 1) {
										str2[1] = "0"
												+ str2[1].substring(0, str2[1]
														.lastIndexOf(","));
									} else {
										str2[1] = str2[1].substring(0, str2[1]
												.lastIndexOf(","));
									}
									var res2 = str2[2]
											+ "/"
											+ monthToNum(str2[0])
											+ "/"
											+ str2[1]
											+ "\t"
											+ str2[3].substring(0,
													str1[3].length - 3)
											+ str2[4]

									$("#tbodyRH")
											.append(
													"<tr><td><a href='${pageContext.request.contextPath}/campaign/campaignDetail?id="
															+ campaign.id
															+ "'>"
															+ campaign.name
															+ "</a></td>"
															+ "<td>"
															+ campaign.type
															+ "</td>"
															+ "<td>"
															+ campaign.location
															+ "</td>"
															+ "<td>"
															+ campaign.goal
															+ "</td>"
															+ "<td>"
															+ campaign.currentFund
															+ "</td>"
															+ "<td>"
															+ res1
															+ "</td>"
															+ "<td>"
															+ res2
															+ "</td></tr>");
								}
							})
		}

		//以下搜尋相關
		var urlll = "${pageContext.request.contextPath}/campaign/campaignAction!selectByAllCondition";
		function loadByForm() {
			$.post(urlll, {
				"campaignForm.name" : $("#keywordRH").val(),
				"campaignForm.type" : $("#keywordTypeRH").val(),
				"campaignForm.location" : $("#keywordLocRH").val()
			}, getData, "json")
		}

		function cleanForm() {
			$("#keywordRH").val(null);
			$("#keywordLocRH").val(null);
			$("#keywordTypeRH").val(null);
		}

		function showAll() {
			cleanForm();
			$.post(urlForRaiserHistory, {
				"name" : "${raiser.name}"
			}, getData, "json")
		}
	</script>
</body>
</html>
