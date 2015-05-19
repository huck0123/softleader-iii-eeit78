<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>����-���U�b��</title>
</head>
<body id="body">
	<jsp:include page="../../header.jsp" />
	<div class="container">
		<div class="row" style="padding-top: 20px">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<form action="<c:url value='/raiser/raiserAction!insert' />"
					method="post" enctype="multipart/form-data" class="form-horizontal">

					<div class="form-group">
						<label for="account" class="col-sm-2 control-label">�b��:</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="account"
								name="raiserForm.account" value="${form.account }"
								required="required">
						</div>
						<div class="col-sm-3" id="chkAcc">${insertErrorACC}</div>
					</div>

					<div class="form-group">
						<label for="inputpw" class="col-sm-2 control-label">�K�X:</label>
						<div class="col-sm-7">
							<input type="password" class="form-control" id="inputpw"
								name="raiserForm.passwd" required="required">
						</div>
						<div class="col-sm-3">${insertErrorPSW}</div>
					</div>

					<div class="form-group">
						<label for="inputpw" class="col-sm-2 control-label">�T�{�K�X:</label>
						<div class="col-sm-7">
							<input type="password" class="form-control" id="inputpw2"
								required="required">
						</div>
						<div class="col-sm-3" id="chkPw2"></div>
					</div>

					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">����W��:</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="name"
								name="raiserForm.name" value="${form.name}" required="required">
						</div>
						<div class="col-sm-3" id="chkName">${insertErrorNAME}</div>
					</div>

					<div class="form-group">
						<label for="tel" class="col-sm-2 control-label">�q��:</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="tel"
								name="raiserForm.tel" value="${form.tel}" required="required">
						</div>
					</div>

					<div class="form-group">
						<label for="cname" class="col-sm-2 control-label">�s���H�m�W:</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="cname"
								name="raiserForm.contactPerson" value="${form.contactPerson}"
								required="required">
						</div>
					</div>

					<div class="form-group">
						<label for="ctel" class="col-sm-2 control-label">�s���H�q��:</label>
						<div class="col-sm-7">
							<input type="tel" class="form-control" id="ctel"
								name="raiserForm.contactTel" value="${form.contactTel}"
								required="required">
						</div>
					</div>

					<div class="form-group">
						<label for="mail" class="col-sm-2 control-label">�H�c:</label>
						<div class="col-sm-7">
							<input type="email" class="form-control" id="mail"
								name="raiserForm.email" value="${form.email}"
								required="required">
						</div>
					</div>

					<div class="form-group">
						<label for="add" class="col-sm-2 control-label">�a�}:</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="add"
								name="raiserForm.address" value="${form.address}"
								required="required">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">�ϼ�:</label>
						<div class="col-sm-7">
							<input type="file" name="raiserForm.logo" id="logo"
								required="required" accept="image/*">
						</div>
						<div class="col-sm-3" id="chkLogo"></div>
					</div>

					<div class="form-group">
						<label for="del" class="col-sm-2 control-label">���餶��:</label>
						<div class="col-sm-7">
							<textarea rows="4" cols="50" class="form-control" id="del"
								name="raiserForm.detail">${form.detail}</textarea>
						</div>
					</div>

					<div class="form-group">
						<label for="vdl" class="col-sm-2 control-label">����u��:</label>
						<div class="col-sm-7">
							<input type="url" class="form-control" id="vdl"
								name="raiserForm.videoUrl" value="${form.videoUrl}">
						</div>
					</div>

					<div class="row" style="padding-top: 20px">
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<button type="submit" class="btn btn-default">�T�w�e�X</button>
							<button type="reset" class="btn btn-default">�M�����</button>
						</div>
					</div>
					<div>${insertErrorMSG}</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		raiserRegisCheckUrl1 = "${pageContext.request.contextPath}/raiser/raiserSelectAll!select";
		raiserRegisCheckUrl2 = "${pageContext.request.contextPath}/raiser/raiserSelectAll!checkName";
		var giverurl = "${pageContext.request.contextPath}/giver/giverSelect!select";
		$("#account").change(function() {
			$("#chkAcc").text("")
			$.post(raiserRegisCheckUrl1, {
				"account" : $(this).val()
			}, function(data) {
				if (data != null) {
					$("#chkAcc").text("�b���w�s�b")
				}
			}, "json")
				
			$.post(giverurl, {
			'thisAccount' : $(this).val()
			}, function(data) {
			data = JSON.parse(data);
			if (data != null) {
					$("#chkAcc").text("�b���w�s�b")
			}
		})
		$("#inputpw2").blur(function() {
			$("#chkPw2").text("")
			if ($(this).val() != $("#inputpw").val()) {
				$("#chkPw2").text("�K�X���۲�")
			}
		})

		$("#name").blur(function() {
			$("#chkName").text("")
			$.post(raiserRegisCheckUrl2, {
				"name" : $(this).val()
			}, function(data) {
				if (data != null) {
					$("#chkName").text("������w���U")
				}
			}, "json")
		})

		$("#logo")
				.change(
						function() {
							var file = logo.files[0];
							if (file) {
								var reader = new FileReader();
								reader.onload = function(event) {
									$("#chkLogo")
											.append(
													"<img src='"+event.target.result+"' style='weight:50px; height:50px;'>")
								}
							}
							reader.readAsDataURL(file);
						})
	</script>
</body>
</html>