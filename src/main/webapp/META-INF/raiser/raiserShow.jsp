<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>

<style>
th {
	width: 200px;
}

#btnn {
	text-align: center;
	vertical-align: bottom;
}
body{
	text-align: left;
}
</style>

<div class="tab-pane fade" id="raiserShow">

	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-5">
				<label for="textSch">團體名稱 :</label> 
				<input type="text" size="20" placeholder="依名稱搜尋" value="" id="textSch" class="searchtext"> 
				<input type="checkbox" name="chkbox" id="ChkBox" value="true" checked="checked"/>:包含黑名單
			</div>
			<div class="col-md-1">
				<input type="button" name="searchbtn" value="查詢" id="btnSch" class="btn btn-default">
			</div>
			<div class="col-md-4">
				<input type="button" name="vilhbtn" value="加入黑名單" id="btnStop" class="btn btn-default">
				<input type="button" name="Unvilbtn" value="解除黑名單" id="btnunVil" class="btn btn-default">
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<table class="table table-condensed table-bordered">
					<tr>
						<th style="width: 10px"></th>
						<th>帳號</th>
						<th style="width: 200px">團體名稱</th>
						<th style="width: 140px">電話</th>
						<th>信箱</th>
						<th style="width: 50px">黑名單</th>
						<th style="width: 10px"></th>
					</tr>
					<tbody id="tbody">
					</tbody>
				</table>
			</div>
			<div class="col-md-1"></div>
		</div >
		<div id="btnn" class="row">
			<div class="col-md-5" style="text-align:right">
				<input type="button" class="btn btn-default" name="forward" value="上一頁" id="btnf"> 
			</div>
			<div class="col-md-1" style="text-align:right">
				<input type="tel" name="now" size="1" value="1" id="btnw">
			</div>
			<div class="col-md-1" id="divMax" style="text-align:left"></div>
			<div class="col-md-2" style="text-align:left">
				<input type="button" class="btn btn-default" name="next" value="下一頁" id="btnx"> 
			</div>
			<div class="col-md-3" style="text-align:left">
				<a href="<c:url value='/index.jsp' />">回首頁</a> 
			</div>
		</div>
		<div id="detail"></div><br>
	</div>
</div>	

	<script>
		var url = "${pageContext.request.contextPath}/raiser/raiserSelectAll!getByCondition";
		$.post(url, {'lock' : $('#ChkBox').val()} ,getData);

		var page = $("#btnw").val();
		var Max = Math.ceil("${raiserCount}" / 5);
		$("#divMax").text("/" + Max + "\t");
		var test = true;

		//以下分頁用
		//用數字輸入可搜尋頁數
		$("#btnw").change(function() {
			if ($("#btnw").val() <= Max && $("#btnw").val() > 0) {
				page = $("#btnw").val();
			} else {
				$("#btnw").val("1");
				page = 1;
			}
			$('#detail').children().remove();
			test = true;
			$('#tbody').children().remove();
			$.post(url, {
				'name' : $("#textSch").val(),'page' : page ,'lock' : $('#ChkBox').val()
			}, getData);
		});

		//點上一頁
		$("#btnf").click(function() {
			if ($("#btnw").val() > 1) {
				page--;
				$("#btnw").val(page);
				$('#detail').children().remove();
				test = true;
				$('#tbody').children().remove();
				$.post(url, {
					'name' : $("#textSch").val(),'page' : page ,'lock' : $('#ChkBox').val()
				}, getData);
			}
		});

		//點下一頁
		$("#btnx").click(function() {
			if ($("#btnw").val() < Max) {
				page++;
				$("#btnw").val(page);
				$('#detail').children().remove();
				test = true;
				$('#tbody').children().remove();
				$.post(url, {
					'name' : $("#textSch").val(),'page' : page ,'lock' : $('#ChkBox').val()
				}, getData);
			}
		});

		//顯示部分內容點選圖式顯示全部內容
		function getData(data) {

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
											+ st1 + "</td><td><input type='checkbox' id='chbox' style='text-align:center'></td></tr>";
								} else {
									var st2 = "<span class='glyphicon glyphicon-remove' id='spanCk'></span>";
									stAll += "<td id='tdCk"+raiser.id+"'>"
											+ st2 + "</td><td><input type='checkbox' name='chbox' id='chbox' style='text-align:center'></td></tr>";
								}

								$(tbody).prepend(stAll);
								$("#test")
										.click(
												function() {
													if (test) {
														test = false;

														var str = "<img src='' class='img-thumbnail' id='logo' style='width:80px; height:80px'>";

														$(
																"#spanpic"
																		+ raiser.id)
																.removeClass(
																		"glyphicon glyphicon-folder-close")
																.addClass(
																		"glyphicon glyphicon-folder-open");
														$("#detail").children()
																.remove();
														$("#detail")
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
																				+ "<div class='row'><div class='col-md-3'></div><div class='col-md-6'>團 體  短 片:　"
																				+ raiser.videoUrl
																				+ "</div><div class='col-md-3'></div></div>"
																				+ "<div class='row'><div class='col-md-3'></div><div class='col-md-8'>團 體  資 訊:</div><div class='col-md-3'></div></div>"
																				+ "<div class='row'><div class='col-md-3'></div><div class='col-md-5'>　　"
																				+ raiser.detail
																				+ "</div></div>");

														$("#logo")
																.attr(
																		"src",
																		"data:image/png;base64,"
																				+ srclogo);

													} else {
														$("#detail").children()
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
				$("#btnSch").click(function() {
					$('#detail').children().remove();
					test = true;
					$('#tbody').children().remove();
					$("#btnw").val("1");
					page = 1;
					$.post("${pageContext.request.contextPath}/raiser/raiserSelectAll!getByAllConditionCount" , {
						'name' : $("#textSch").val() , 'lock' : $('#ChkBox').val()
						}, function(data){
							Max = Math.ceil(data/ 5);
							$("#divMax").text("/" + Max + "\t");
						});
					$.post(url,{
						'name' : $("#textSch").val(),'page' : page , 'lock' : $('#ChkBox').val()
					}, getData);
				});
		
		
				$('#ChkBox').change(function(){
				    $(this).val($(this).prop('checked'))
				});
				
				var url2 = "${pageContext.request.contextPath}/raiser/raiserSelectAll!checkInformation";
					$("#btnStop").click(function(){
					$("#chbox:checked").parent().parent().children("td").children("#spanCk").removeClass().addClass("glyphicon glyphicon-remove");;
					$.post(url2,{'account' : $("#chbox:checked").parent().parent().text(),
						 		 'lock' : false},
					getData,"json");
				});
				$("#btnunVil").click(function(){
					$("#chbox:checked").parent().parent().children("td").children("#spanCk").removeClass().addClass("glyphicon glyphicon-ok");
					$.post(url2,{'account' : $("#chbox:checked").parent().parent().text(),
						 		 'lock' : true},
					getData,"json");
				});
	</script>

