<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
th {
	width: 200px;
}

#btnn {
	text-align: center;
	vertical-align: bottom;
}

body {
	text-align: left;
}
</style>

<div class="tab-pane fade" id="raiserShow">
	<div>
		<div class="row" style="margin:10px">
			<div class="col-md-3" style="margin-top:10px">
				<select id="raiserPageSize">
					<option value="5" selected>5</option>
					<option value="10">10</option>
					<option value="20">20</option>
					<option value="50">50</option>
					<option value="100">100</option>
					<option value="all">全部</option>
				</select>顯示筆數(預設5筆)
			</div>
			<div class="col-md-3">
				<input type="button" class="btn btn-primary" name="forward"
					value="上一頁" id="btnf" style="margin:5px"><select id="btnw">
				</select><input type="button" class="btn btn-primary" name="next" value="下一頁"
					id="btnx" style="margin:5px">
			</div>
			<div class="col-md-3">
				<input type="button" name="Unvilbtn" value="啟用帳號" id="btnunVil"
					class="btn btn-warning"> <input type="button"
					name="vilhbtn" value="封鎖帳號" id="btnStop" class="btn btn-warning">
			</div>
			<div class="col-md-3">
				<input type="text" class="form-control searchtext" id="textSch"
					placeholder="請輸入搜尋條件">
			</div>
		</div>
		<div class="row" style="text-align: center">
			<div class="col-md-1"></div>
			<div class="col-md-10" style="display: inline;">
				<table class="table table-condensed table-bordered">
					<tr>
						<th style="width: 10px"></th>
						<th style="width: 200px">帳號</th>
						<th style="width: 200px">團體名稱</th>
						<th style="width: 120px">電話</th>
						<th style="width: 230px">信箱</th>
						<th style="width: 100px">帳號是否啟用</th>
						<th style="width: 10px"></th>
					</tr>
					<tbody id="tbodyRS">
					</tbody>
				</table>
			</div>

		</div>
		<div id="detailRS"></div>
		<br>
	</div>
</div>

<script>
	var RaiserShowUrl1 = "${pageContext.request.contextPath}/raiser/raiserShow!getRaiserCondition";
	var rPage = 5;
	$.post(RaiserShowUrl1, {
		"pagesizeForRaiserShow" : rPage
	}, RaiserShowgetData);
	var tempCount = 0;
	var page = 1;
	var Max = Math.ceil("${raiserCount}" / 5);
	for (var i = 1; i <= Max; i++) {
		$('#btnw').append('<option value="'+i+'">' + i + '</option> ');
	}

	var test = true;
	//以下分頁用
	$("#raiserPageSize").change(function() {
		$("#btnw").val("1");
		page = 1;
		$('#detailRS').children().remove();
		test = true;
		$('#tbodyRS').children().remove();
		rPage = $(this).val();
		if ($("#textSch").val().lengh == 0) {
			Max = Math.ceil("${raiserCount}" / rPage);
		} else {
			Max = Math.ceil(tempCount / rPage);
		}
		console.log(Max)
		$('#btnw').empty();
		for (var i = 1; i <= Max; i++) {
			$('#btnw').append('<option value="'+i+'">' + i + '</option> ');
		}
		$.post(RaiserShowUrl1, {
			'name' : $("#textSch").val(),
			"pagesizeForRaiserShow" : rPage
		}, RaiserShowgetData);
	});

	//v選頁數
	$("#btnw").change(function() {
		if ($("#btnw").val() <= Max && $("#btnw").val() > 0) {
			page = $("#btnw").val();
		} else {
			$("#btnw").val("1");
			page = 1;
		}
		$('#detailRS').children().remove();
		test = true;
		$('#tbodyRS').children().remove();
		$.post(RaiserShowUrl1, {
			'name' : $("#textSch").val(),
			'pagesizeForRaiserShow' : rPage,
			'page' : page
		}, RaiserShowgetData);
	});

	//點上一頁
	$("#btnf").click(function() {
		if ($("#btnw").val() > 1) {
			page--;
			$("#btnw").val(page);
			$('#detailRS').children().remove();
			test = true;
			$('#tbodyRS').children().remove();
			$.post(RaiserShowUrl1, {
				'name' : $("#textSch").val(),
				'pagesizeForRaiserShow' : rPage,
				'page' : page
			}, RaiserShowgetData);
		}
	});

	//點下一頁
	$("#btnx").click(function() {
		if ($("#btnw").val() < Max) {
			page++;
			$("#btnw").val(page);
			$('#detailRS').children().remove();
			test = true;
			$('#tbodyRS').children().remove();
			$.post(RaiserShowUrl1, {
				'name' : $("#textSch").val(),
				'pagesizeForRaiserShow' : rPage,
				'page' : page
			}, RaiserShowgetData);
		}
	});

	//顯示部分內容點選圖式顯示全部內容
	function RaiserShowgetData(data) {
		data = JSON.parse(data);

		$(data)
				.each(
						function(index, raiser) {

							var srclogo = arrayBufferToBase64(raiser.logo);

							var stAll = "<tr><td id='test'><span id='spanpic"+raiser.id+"' class='glyphicon glyphicon-folder-close spanpic' ></span></td>"
									+ "<td id='account'>"
									+ raiser.account
									+ " </td>"
									+ "<td>"
									+ raiser.name
									+ " </td>"
									+ "<td>"
									+ raiser.tel
									+ " </td>"
									+ "<td>" + raiser.email + " </td>";
							var lock = raiser.valid;

							if (lock) {
								var st1 = "<span class='glyphicon glyphicon-ok' id='spanCk'></span>";
								stAll += "<td id='tdCk"+raiser.id+"'>"
										+ st1
										+ "</td><td><input type='checkbox' id='chbox' style='text-align:center'></td></tr>";
							} else {
								var st2 = "<span class='glyphicon glyphicon-remove' id='spanCk'></span>";
								stAll += "<td id='tdCk"+raiser.id+"'>"
										+ st2
										+ "</td><td><input type='checkbox' name='chbox' id='chbox' style='text-align:center'></td></tr>";
							}

							$('#tbodyRS').append(stAll);
							$("#spanpic" + raiser.id)
									.click(
											function() {
												if (test) {
													test = false;

													var str = "<img src='' class='img-thumbnail' id='logoRS' style='width:80px; height:80px'>";

													$("#spanpic" + raiser.id)
															.removeClass(
																	"glyphicon glyphicon-folder-close")
															.addClass(
																	"glyphicon glyphicon-folder-open");
													$("#detailRS").children()
															.remove();
													$("#detailRS")
															.append(
																	"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>"
																			+ str
																			+ "</div><div class='col-md-3'></div></div>"
																			+ "<div class='row'><div class='col-md-3'></div><div class='col-md-6'>團 體  帳 號:　"
																			+ raiser.account
																			+ "</div><div class='col-md-3'></div></div>"
																			+ "<div class='row'><div class='col-md-3'></div><div class='col-md-6'>團 體  名 稱:　"
																			+ raiser.name
																			+ "</div><div class='col-md-3'></div></div>"
																			+ "<div class='row'><div class='col-md-3'></div><div class='col-md-6'>團 體  電 話:　"
																			+ raiser.tel
																			+ "</div><div class='col-md-3'></div></div>"
																			+ "<div class='row'><div class='col-md-3'></div><div class='col-md-6'>聯絡人姓名:　"
																			+ raiser.contactPerson
																			+ "</div><div class='col-md-3'></div></div>"
																			+ "<div class='row'><div class='col-md-3'></div><div class='col-md-6'>聯絡人電話:　"
																			+ raiser.contactTel
																			+ "</div><div class='col-md-3'></div></div>"
																			+ "<div class='row'><div class='col-md-3'></div><div class='col-md-6'>電 子  信 箱:　"
																			+ raiser.email
																			+ "</div><div class='col-md-3'></div></div>"
																			+ "<div class='row'><div class='col-md-3'></div><div class='col-md-6'>團 體  地 址:　"
																			+ raiser.address
																			+ "</div><div class='col-md-3'></div></div>"
																			+ "<div class='row'><div class='col-md-3'></div><div class='col-md-8'>團 體  資 訊:</div><div class='col-md-3'></div></div>"
																			+ "<div class='row'><div class='col-md-3'></div><div class='col-md-5'>　　"
																			+ raiser.detail
																			+ "</div><div class='col-md-4'></div></div>"
																			+ "<div class='row'><div class='col-md-3'></div><div class='col-md-6'>團 體  短 片:　</div><div class='col-md-3'></div></div>"
																			+ "<div class='row'><div class='col-md-3'></div><div class='col-md-6'><iframe src='"
																			+ raiser.videoUrl
																			+ "' style='width:470px;height:450px'></iframe></div>"
																			+ "</div></div>"

															);

													$("#logoRS").attr(
															"src",
															"data:image/png;base64,"
																	+ srclogo);

												} else {
													$("#detailRS").children()
															.remove();
													$(".spanpic")
															.removeClass(
																	"glyphicon glyphicon-folder-open")
															.addClass(
																	"glyphicon glyphicon-folder-close");
													test = true;
												}
											});

						});
	};
	//以下搜尋相關
	$("#textSch")
			.keyup(
					function() {
						$('#detailRS').children().remove();
						test = true;
						$('#tbodyRS').children().remove();
						$("#btnw").val("1");
						page = 1;
						$
								.post(
										"${pageContext.request.contextPath}/raiser/raiserShow!getByAllConditionCount",
										{
											'name' : $(this).val()
										},
										function(data) {
											tempCount = data;
											Max = Math.ceil(data / rPage);
											$('#btnw').empty();
											for (var i = 1; i <= Max; i++) {
												$('#btnw').append(
														'<option value="'+i+'">'
																+ i
																+ '</option> ');
											}
											console.log(Max)
											//
										});
						$.post(RaiserShowUrl1, {
							'name' : $(this).val(),
							'pagesizeForRaiserShow' : rPage,
							'page' : page
						}, RaiserShowgetData);
					});

	$('#ChkBox').change(function() {
		$(this).val($(this).prop('checked'));
	});

	var RaiserShowUrl2 = "${pageContext.request.contextPath}/raiser/raiserShow!checkInformation";
	$("#btnStop").click(
			function() {
				$("#chbox:checked").parent().parent().children("td").children(
						"#spanCk").removeClass().addClass(
						"glyphicon glyphicon-remove");
				;
				$.post(RaiserShowUrl2, {
					'account' : $("#chbox:checked").parent().parent().text(),
					'lock' : false
				}, RaiserShowgetData, "json");
			});
	$("#btnunVil").click(
			function() {
				$("#chbox:checked").parent().parent().children("td").children(
						"#spanCk").removeClass().addClass(
						"glyphicon glyphicon-ok");
				$.post(RaiserShowUrl2, {
					'account' : $("#chbox:checked").parent().parent().text(),
					'lock' : true
				}, RaiserShowgetData, "json");
			});
</script>

