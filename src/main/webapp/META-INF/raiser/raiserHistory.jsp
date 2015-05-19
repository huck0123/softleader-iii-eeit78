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
<title>����o�_���ʬ���</title>
</head>
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
								placeholder="��J���ʦW�� �B�����B�Φa�I">
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
							<input type="datetime-local" class="form-control" id="beforeDateRH"
								placeholder="��ܸ��j���">
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
							<th>���ʦW��</th>
							<th>��������</th>
							<th>���ʦa�I</th>
							<th>�ؼЪ��B</th>
							<th>��e���B</th>
							<th>�o�_�ɶ�</th>
							<th>�I����</th>
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
