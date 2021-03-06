<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>

<div class="tab-pane fade" id="raiserHistory">

	<br /> <br />
	<div class="row">
		<form class="form-horizontal">
			<div class="form-group">
				<label for="keywordRH" class="col-sm-2 control-label"
					style="text-align: center">關鍵字搜尋</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="keywordRH"
						placeholder="輸入活動名稱 ">
				</div>
			</div>
			<div class="form-group">
				<label for="keywordTypeRH" class="col-sm-2 control-label"
					style="text-align: center">依類型查詢</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="keywordTypeRH"
						placeholder="輸入類型">
				</div>
				<label for="keywordLocRH" class="col-sm-2 control-label"
					style="text-align: center">依地點查詢</label>
				<div class="col-sm-3">
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
	<div style="padding-bottom: 20px;">
		<br />
		<hr />
		<br />
		<h3 style="text-align: center">${raiser.name}您好，您曾發起過的活動紀錄如下
			<button type="button" class="btn btn-success btn-xs"
				onclick="showAll();">顯示所有紀錄</button>
		</h3>
		<br /> <br />

		<div class="hidden-xs hidden-sm">
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
		<div class="visible-sm visible-xs" id="xsRaiserBody"></div>
	</div>

</div>
<script>
	//以下顯示相關
	var urlForRaiserHistory = '${pageContext.request.contextPath}/raiser/raiserHistory!getRaiserHistory';
	$.post(urlForRaiserHistory, {
		"campaignForm.name" : "${raiser.name}"
	}, getData, "json");
	function getData(data) {
		$("#tbodyRH").empty();
		$
				.each(
						data,
						function(index, campaign) {
							if (campaign.raiserModel.id == "${raiser.id}") {
								//以下切日期
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
												str1[3].length - 3) + str1[4];

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
												str1[3].length - 3) + str2[4]
								//大的
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
								
								//小的

								$("#xsRaiserBody")
										.append(
												"<div style='margin:30x ; border-bottom-style:groove'><div class='row' style='border-bottom: 1px solid lightgray'><div class='col-xs-5' style='font-weight: bolder'>活動名稱</div><div class='col-xs-7'><a href='${pageContext.request.contextPath}/campaign/campaignDetail?id="
														+ campaign.id
														+ "'>"
														+ campaign.name
														+ "</a></div></div>"
														+ "<div class='row' style='border-bottom: 1px solid lightgray'><div class='col-xs-5' style='font-weight: bolder'>活動類型</div><div class='col-xs-7'>"
														+ campaign.type
														+ "</div></div>"
														+ "<div class='row' style='border-bottom: 1px solid lightgray '><div class='col-xs-5' style='font-weight: bolder'>活動地點</div><div class='col-xs-7'>"
														+ campaign.location
														+ "</div></div>"
														+ "<div class='row' style='border-bottom: 1px solid lightgray '><div class='col-xs-5' style='font-weight: bolder'>當前金額</div><div class='col-xs-7'>"
														+ campaign.currentFund
														+ "</div></div>"
														+ "<div class='row' style='border-bottom: 1px solid lightgray '><div class='col-xs-5' style='font-weight: bolder'>目標金額</div><div class='col-xs-7'>"
														+ campaign.goal
														+ "</div></div>"
														+ "<div class='row' style='border-bottom: 1px solid lightgray '><div class='col-xs-5' style='font-weight: bolder'>發起時間</div><div class='col-xs-7'>"
														+ res1
														+ "</div></div>"
														+ "<div class='row' style='border-bottom: 1px solid lightgray '><div class='col-xs-5' style='font-weight: bolder'>截止日期</div><div class='col-xs-7'>"
														+ res2
														+ "</div></div></div>");
							}
						})
	}

	//以下搜尋相關
	var urlRHcondition = "${pageContext.request.contextPath}/raiser/raiserHistory!getRaiserHistoryByCondition";
	function loadByForm() {
		$.post(urlRHcondition, {
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
			"campaignForm.name" : "${raiser.name}"
		}, getData, "json")
	}
</script>
