<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/softleader-iii-eeit78/css/giver.css">
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>
<script src="/softleader-iii-eeit78/js/useful.js"></script>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�޲z��-�Ҧ������T</title>


</head>
<body id="body">
	<jsp:include page="../../header.jsp" />

	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-5">
				<label for="textSch">����W�� :</label> 
				<input type="text" size="20" placeholder="�̦W�ٷj�M" value="" id="textSch" class="searchtext"> 
				<input type="checkbox" name="chkbox" id="ChkBox" value="true" checked="checked"/>:�]�t�¦W��
			</div>
			<div class="col-md-1">
				<input type="button" name="searchbtn" value="�d��" id="btnSch" class="btn btn-default">
			</div>
			<div class="col-md-4">
				<input type="button" name="vilhbtn" value="�[�J�¦W��" id="btnStop" class="btn btn-default">
				<input type="button" name="Unvilbtn" value="�Ѱ��¦W��" id="btnunVil" class="btn btn-default">
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<table class="table table-condensed table-bordered">
					<tr>
						<th style="width: 10px"></th>
						<th>�b��</th>
						<th style="width: 200px">����W��</th>
						<th style="width: 140px">�q��</th>
						<th>�H�c</th>
						<th style="width: 50px">�¦W��</th>
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
				<input type="button" class="btn btn-default" name="forward" value="�W�@��" id="btnf"> 
			</div>
			<div class="col-md-1" style="text-align:right">
				<input type="tel" name="now" size="1" value="1" id="btnw">
			</div>
			<div class="col-md-1" id="divMax" style="text-align:left"></div>
			<div class="col-md-2" style="text-align:left">
				<input type="button" class="btn btn-default" name="next" value="�U�@��" id="btnx"> 
			</div>
			<div class="col-md-3" style="text-align:left">
				<a href="<c:url value='/index.jsp' />">�^����</a> 
			</div>
		</div>
		<div id="detail"></div><br>
	</div>
	<script>
		var url = "/softleader-iii-eeit78/raiser/raiserSelectAll!getByCondition";
		$.post(url, {'lock' : $('#ChkBox').val()} ,getData);

		var page = $("#btnw").val();
		var Max = Math.ceil("${raiserCount}" / 5);
		$("#divMax").text("/" + Max + "\t");
		var test = true;

		//�H�U������
		//�μƦr��J�i�j�M����
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

		//�I�W�@��
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

		//�I�U�@��
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

		//��ܳ������e�I��Ϧ���ܥ������e
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
																				+ "<div class='row'><div class='col-md-3'></div><div class='col-md-6'>�� ��  �b ��:�@"
																				+ raiser.account
																				+ "</div><div class='col-md-3'></div></div>"
																				+ "<div class='row'><div class='col-md-3'></div><div class='col-md-6'>�� ��  �W ��:�@"
																				+ raiser.name
																				+ "</div><div class='col-md-3'></div></div>"
																				+ "<div class='row'><div class='col-md-3'></div><div class='col-md-6'>�� ��  �q ��:�@"
																				+ raiser.tel
																				+ "</div><div class='col-md-3'></div></div>"
																				+ "<div class='row'><div class='col-md-3'></div><div class='col-md-6'>�p���H�m�W:�@"
																				+ raiser.contactPerson
																				+ "</div><div class='col-md-3'></div></div>"
																				+ "<div class='row'><div class='col-md-3'></div><div class='col-md-6'>�p���H�q��:�@"
																				+ raiser.contactTel
																				+ "</div><div class='col-md-3'></div></div>"
																				+ "<div class='row'><div class='col-md-3'></div><div class='col-md-6'>�q �l  �H �c:�@"
																				+ raiser.email
																				+ "</div><div class='col-md-3'></div></div>"
																				+ "<div class='row'><div class='col-md-3'></div><div class='col-md-6'>�� ��  �a �}:�@"
																				+ raiser.address
																				+ "</div><div class='col-md-3'></div></div>"
																				+ "<div class='row'><div class='col-md-3'></div><div class='col-md-6'>�� ��  �u ��:�@"
																				+ raiser.videoUrl
																				+ "</div><div class='col-md-3'></div></div>"
																				+ "<div class='row'><div class='col-md-3'></div><div class='col-md-8'>�� ��  �� �T:</div><div class='col-md-3'></div></div>"
																				+ "<div class='row'><div class='col-md-3'></div><div class='col-md-5'>�@�@"
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
		//�H�U�j�M����
				$("#btnSch").click(function() {
					$('#detail').children().remove();
					test = true;
					$('#tbody').children().remove();
					$("#btnw").val("1");
					page = 1;
					$.post("/softleader-iii-eeit78/raiser/raiserSelectAll!getByAllConditionCount" , {
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
				
				var url2 = "/softleader-iii-eeit78/raiser/raiserSelectAll!checkInformation";
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

</body>