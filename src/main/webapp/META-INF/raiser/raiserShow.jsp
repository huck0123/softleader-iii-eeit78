<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<style>
th {
	width: 200px;
}

#btnn {
	text-align: center;
	vertical-align: bottom;
}
</style>
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>�޲z��-�Ҧ������T</title>


</head>
<body>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<table class="table table-condensed table-bordered">
				<tr>
					<th style="width: 10px"></th>
					<th style="width: 100px">����W��</th>
					<th>�b��</th>
					<th style="width: 70px">�K�X</th>
					<th>�H�c</th>
				</tr>
				<tbody id="tbody">
				</tbody>
			</table>
		</div>
		<div class="col-md-1"></div>
	</div>
	<div id= "detail"></div>
	<div id= "btnn">
		<input type="button" name="forward" value="�W�@��" id="btnf"> <input
			type="tel" name="now" size="1" value="1" id="btnw"> <input
			type="button" name="next" value="�U�@��" id="btnx"> <a
			href="<c:url value='/index.jsp' />">�^����</a>
	</div>
	<script>
		var url = "/softleader-iii-eeit78/raiser/raiserSelectAll!getPerPage";
		$.getJSON(url, getData);

		var page = $("#btnw").val();
		var Max = Math.ceil("${raiserCount}" / 3);
		$("#btnx").before("/" + Max + "\t");

		//�μƦr��J�i�j�M����
		$("#btnw").change(function() {
			if ($("#btnw").val() <= Max && $("#btnw").val()>0) {
				page = $("#btnw").val();
			} else {
				$("#btnw").val("1");
				page=1;
			}
			$('#detail').children().remove();
			$('#tbody').children().remove();
			$.getJSON(url, {
				'page' : page
			}, getData);
		});

		//�I�W�@��
		$("#btnf").click(function() {
			if ($("#btnw").val() > 1) {
				page--;
				$("#btnw").val(page);
				$('#detail').children().remove();
				$('#tbody').children().remove();
				$.getJSON(url, {
					'page' : page
				}, getData);
			}
		});

		//�I�U�@��
		$("#btnx").click(function() {
			if ($("#btnw").val() < Max) {
				page++;
				$("#btnw").val(page);
				$('#detail').children().remove();
				$('#tbody').children().remove();
				$.getJSON(url, {
					'page' : page
				}, getData);
			}
		});

		function getData(data) {
			$(data).each(
					function(index, raiser) {
						$(tbody).append(
								"<tr><td><button id='btnchk"+raiser.id+"'><span id='spanpic' class='glyphicon glyphicon-chevron-down' ></span></button></td>"
										+ "<td><a>" + raiser.name + "</a></td>"
										+ "<td>" + raiser.account + "</td>"
										+ "<td>" + raiser.passwd + "</td>"
										+ "<td>" + raiser.email + "</td></tr>");
						$("#btnchk"+raiser.id).click(function(){
							$("#detail").children().remove();
							$("#detail").append(
								"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>�� ��  �b ��:�@"+raiser.account+ "</div><div class='col-md-3'></div></div>"
								+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>�� ��  �K �X:�@"+raiser.passwd+ "</div><div class='col-md-3'></div></div>"
								+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>�� ��  �W ��:�@"+raiser.name+ "</div><div class='col-md-3'></div></div>"
								+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>�� ��  �q ��:�@"+raiser.tel+ "</div><div class='col-md-3'></div></div>"
								+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>�p���H�m�W:�@"+raiser.contactPerson+ "</div><div class='col-md-3'></div></div>"
								+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>�p���H�q��:�@"+raiser.contactTel+ "</div><div class='col-md-3'></div></div>"
								+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>�q �l  �H �c:�@"+raiser.email+ "</div><div class='col-md-3'></div></div>"
								+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>�� ��  �a �}:�@"+raiser.address+ "</div><div class='col-md-3'></div></div>"
								+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>�� ��  �u ��:�@"+raiser.videoUrl+ "</div><div class='col-md-3'></div></div>"
								+"<div class='row'><div class='col-md-3'></div><div class='col-md-8'>�� ��  �� �T:</div><div class='col-md-3'></div></div>"
								+"<div class='row'><div class='col-md-3'></div><div class='col-md-5'>�@�@"+raiser.detail+ "</div></div>"
							);
						});
					});
		};
		
	</script>

</body>