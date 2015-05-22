<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>
<script src="/softleader-iii-eeit78/js/useful.js"></script>
<style>
body {
	text-align: left;
}
.errorClassForRaiser{
	color:red
}
</style>
<title>����-��s�b��</title>
</head>
<body id="body">
	<jsp:include page="../../header.jsp" />
	<div class="container">
		<h2 style="text-align: center">����M��</h2>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<ul class="nav nav-tabs" role="tablist">
					<li><a href="#raiserUpdate">�ק�����T</a></li>
					<li><a href="#raiserHistory">�d�ݬ��ʬ���</a></li>
					<li><a href="#campaignRaise">�o�_����</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade" id="raiserUpdate">
						<div class="row">
							<div class="col-md-4">
								<img src='' class='img-thumbnail' id='logo'
									style='width: 200px; height: 200px'>
									<div class="errorClassForRaiser">${updateRaiserMSG}</div>
							</div>
							<div class="col-md-8">
								<form
									action="<c:url value='/raiser/raiserUpdate!update.action' />"
									method="post" enctype="multipart/form-data">

									<div class="form-group">
										<input type="text" style="display: none" class="form-control"
											id="inputid" name="raiserForm.id" value="${raiser.id}">
									</div>

									<div class="form-group">
										<label for="account">�b��</label> <input type="text"
											value="${raiser.account}" class="form-control"
											disabled="disabled"> <input type="text"
											style="display: none" class="form-control" id="account"
											name="raiserForm.account" value="${raiser.account}">
									</div>

									<div class="form-group">
										<label for="inputpw">�K�X</label> <input type="password"
											class="form-control" id="inputpw" name="raiserForm.passwd"
											required="required">
											<div class="errorClassForRaiser">${updateErrorPSW}</div>
									</div>

									<div class="form-group">
										<label for="inputpwChk">�T�{�K�X</label> <input type="password"
											class="form-control" id="inputpwChk" required="required">
											<div id="chkPw2" class="errorClassForRaiser"></div>
									</div>

									<div class="form-group">
										<label for="name">����W��</label> <input type="text"
											class="form-control" id="name" name="raiserForm.name"
											required="required" value="${raiser.name}">
											<div class="errorClassForRaiser">${updateErrorNAME}</div>
									</div>

									<div class="form-group">
										<label for="tel">�q��</label> <input type="text"
											class="form-control" id="tel" name="raiserForm.tel"
											value="${raiser.tel}">
									</div>

									<div class="form-group">
										<label for="cname">�s���H�m�W</label> <input type="text"
											class="form-control" id="cname"
											name="raiserForm.contactPerson"
											value="${raiser.contactPerson}">
									</div>

									<div class="form-group">
										<label for="ctel">�s���H�q��</label> <input type="tel"
											class="form-control" id="ctel" name="raiserForm.contactTel"
											value="${raiser.contactTel}">
									</div>

									<div class="form-group">
										<label for="mail">�H�c</label> <input type="email"
											class="form-control" id="mail" name="raiserForm.email"
											value="${raiser.email}">
									</div>

									<div class="form-group">
										<label for="add">�a�}</label> <input type="text"
											class="form-control" id="add" name="raiserForm.address"
											value="${raiser.address}">
									</div>

									<div class="form-group">
										<label>�ϼ�</label> <input type="file" class="form-control"
											name="raiserForm.logo" value="${raiser.logo}">
									</div>

									<div class="form-group">
										<label for="del">���餶��</label>
										<textarea rows="10" cols="50" class="form-control" id="del"
											name="raiserForm.detail">${raiser.detail}</textarea>
									</div>

									<div class="form-group">
										<label for="vdl">����u��</label>
										<iframe src="${raiser.videoUrl}"></iframe>
										<input type="url" class="form-control" id="vdl"
											name="raiserForm.videoUrl" value="${raiser.videoUrl}">
									</div>
									<button type="submit" class="btn btn-default">�T�w�e�X</button>
									<button type="reset" class="btn btn-default">�M�����</button>
								</form>
							</div>
						</div>
					</div>
					<jsp:include page="raiserHistory.jsp" />
					<jsp:include page="/META-INF/campaign/campaignRaise.jsp" />
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
	<script>
		var url = "/softleader-iii-eeit78/raiser/raiserSelectForOne!select";
		$.post(url, {
			"account" : "${raiser.account}"
		}, getdata, "json");
		function getdata(raiser) {
			var str = arrayBufferToBase64(raiser.logo);
			$('#logo').attr("src", "data:image/png;base64," + str);

		}

		$(".nav-tabs a").click(function() {
			$(this).tab('show');
		});

		$(document).ready(function() {
			if ("${param.raiserTabs}" == 1) {
				$('.nav-tabs a[href="#raiserUpdate"]').tab('show');
			} else if ("${param.raiserTabs}" == 2) {
				$('.nav-tabs a[href="#raiserHistory"]').tab('show');
			} else if ("${param.raiserTabs}" == 3) {
				$('.nav-tabs a[href="#campaignRaise"]').tab('show');
			}
		})
		
		$("#inputpwChk").blur(function() {
			$("#chkPw2").text("")
			if ($(this).val() != $("#inputpw").val()) {
				$("#chkPw2").text("�K�X���۲�")
				$("#inputpwChk").val("");
			}
		});
		
		
	</script>
	<jsp:include page="../../footer.jsp" />
</body>
</html>