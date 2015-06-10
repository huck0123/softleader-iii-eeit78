<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>

<div class="tab-pane fade" id="raiserHistory">

	<br /> <br />
	<div class="row">
		<form class="form-horizontal">
			<div class="form-group">
				<label for="keywordRH" class="col-sm-2 control-label"
					style="text-align: center">����r�j�M</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="keywordRH"
						placeholder="��J���ʦW�� ">
				</div>
			</div>
			<div class="form-group">
				<label for="keywordTypeRH" class="col-sm-2 control-label"
					style="text-align: center">�������d��</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="keywordTypeRH"
						placeholder="��J����">
				</div>
				<label for="keywordLocRH" class="col-sm-2 control-label"
					style="text-align: center">�̦a�I�d��</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="keywordLocRH"
						placeholder="��J�a�I" style="text-align: left">
				</div>
			</div>
		</form>
	</div>
	<br />
	<div style="text-align: center">
		<button type="button" class="btn btn-primary" onclick="loadByForm();">�e�X�z��</button>
		<button type="button" class="btn btn-warning" onclick="cleanForm();">�M������</button>
	</div>
	<div style="padding-bottom: 20px;">
		<br />
		<hr />
		<br />
		<h3 style="text-align: center">${raiser.name}�z�n�A�z���o�_�L�����ʬ����p�U
			<button type="button" class="btn btn-success btn-xs"
				onclick="showAll();">��ܩҦ�����</button>
		</h3>
		<br /> <br />

		<div class="hidden-xs hidden-sm">
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
		<div class="visible-sm visible-xs" id="xsRaiserBody"></div>
	</div>

</div>
<script>
	//�H�U��ܬ���
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
								//�H�U�����
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
								//�j��
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
								
								//�p��

								$("#xsRaiserBody")
										.append(
												"<div style='margin:30x ; border-bottom-style:groove'><div class='row' style='border-bottom: 1px solid lightgray'><div class='col-xs-5' style='font-weight: bolder'>���ʦW��</div><div class='col-xs-7'><a href='${pageContext.request.contextPath}/campaign/campaignDetail?id="
														+ campaign.id
														+ "'>"
														+ campaign.name
														+ "</a></div></div>"
														+ "<div class='row' style='border-bottom: 1px solid lightgray'><div class='col-xs-5' style='font-weight: bolder'>��������</div><div class='col-xs-7'>"
														+ campaign.type
														+ "</div></div>"
														+ "<div class='row' style='border-bottom: 1px solid lightgray '><div class='col-xs-5' style='font-weight: bolder'>���ʦa�I</div><div class='col-xs-7'>"
														+ campaign.location
														+ "</div></div>"
														+ "<div class='row' style='border-bottom: 1px solid lightgray '><div class='col-xs-5' style='font-weight: bolder'>��e���B</div><div class='col-xs-7'>"
														+ campaign.currentFund
														+ "</div></div>"
														+ "<div class='row' style='border-bottom: 1px solid lightgray '><div class='col-xs-5' style='font-weight: bolder'>�ؼЪ��B</div><div class='col-xs-7'>"
														+ campaign.goal
														+ "</div></div>"
														+ "<div class='row' style='border-bottom: 1px solid lightgray '><div class='col-xs-5' style='font-weight: bolder'>�o�_�ɶ�</div><div class='col-xs-7'>"
														+ res1
														+ "</div></div>"
														+ "<div class='row' style='border-bottom: 1px solid lightgray '><div class='col-xs-5' style='font-weight: bolder'>�I����</div><div class='col-xs-7'>"
														+ res2
														+ "</div></div></div>");
							}
						})
	}

	//�H�U�j�M����
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
