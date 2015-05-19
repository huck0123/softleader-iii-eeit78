<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>

<body id="body">
	<div class="tab-pane fade" id="raiserHistory">
		<h3>�ƦX�d�ߨt��</h3>
		<br />
		<div>
			<form class="form-horizontal">
				<div class="form-group">
					<label for="keywordRH" class="col-sm-3 control-label">����r�j�M</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="keywordRH"
							placeholder="��J���ʦW�� ">
					</div>
				</div>
				<div class="form-group">
					<label for="keywordTypeRH" class="col-sm-3 control-label">�������d��</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" id="keywordTypeRH"
							placeholder="��J����">
					</div>
					<label for="keywordLocRH" class="col-sm-2 control-label"
						style="text-align: left">�̦a�I�d��</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="keywordLocRH"
							placeholder="��J�a�I" style="text-align: left">
					</div>
				</div>
				<div class="form-group">
					<label for="minAmountRH" class="col-sm-3 control-label">�̪��B�d��</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="minAmountRH"
							placeholder="��J���p���B">
					</div>
					<label for="maxAmountRH" class="col-sm-1 control-label">��</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="maxAmountRH"
							placeholder="��J���j���B">
					</div>
				</div>
				<div class="form-group">
					<label for="afterDateRH" class="col-sm-3 control-label">�̤���d��</label>
					<div class="col-sm-4">
						<input type="datetime-local" class="form-control" id="afterDateRH"
							placeholder="��ܸ��p���">
					</div>
					<label for="beforeDateRH" class="col-sm-1 control-label">��</label>
					<div class="col-sm-4">
						<input type="datetime-local" class="form-control"
							id="beforeDateRH" placeholder="��ܸ��j���">
					</div>
				</div>
			</form>
		</div>
		<br />
		<button type="button" class="btn btn-primary" onclick="loadByForm();">�e�X�z��</button>
		<button type="button" class="btn btn-warning" onclick="cleanForm();">�M������</button>

		<div>
			<br />
			<hr />
			<br />
			<h3 style="display: inline-block;">${raiser.name}�z�n�A�z���o�_�L�����ʬ����p�U</h3>
			<button type="button" class="btn btn-success btn-xs"
				onclick="showAll();">��ܩҦ�����</button>
			<br /> <br />
			<table id="resultTableRH" class="table table-hover">
				<thead>
					<tr>
						<th style="width: 100px">���ʦW��</th>
						<th style="width: 100px">��������</th>
						<th style="width: 100px">���ʦa�I</th>
						<th style="width: 100px">�ؼЪ��B</th>
						<th style="width: 100px">��e���B</th>
						<th style="width: 100px">�o�_�ɶ�</th>
						<th style="width: 100px">�I����</th>
					</tr>
				</thead>
				<tbody id="tbodyRH">
				</tbody>
			</table>
		</div>
	</div>
	<script>
		//�H�U��ܬ���
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

		//�H�U�j�M����
		var urlll = "${pageContext.request.contextPath}/campaign/campaignAction!selectByAllCondition";
		function loadByForm() {
			$.post(urlll, {
				"campaignForm.name" : $("#keywordRH").val(),
				"campaignForm.type" : $("#keywordTypeRH").val(),
				"campaignForm.location" : $("#keywordLocRH").val(),
				"campaignForm.name" : $("#keywordRH").val(),
			}, getData, "json")
		}
	</script>
</body>
</html>
