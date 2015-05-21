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
<style>
.errorClassForRaiser{
	color:red
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>團體-註冊帳號</title>
</head>
<body id="body">
	<jsp:include page="../../header.jsp" />
	<div class="container">
		<div class="row" style="padding-top: 20px">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h2>公益團體註冊</h2>
				<form action="<c:url value='/raiser/raiserAction!insert' />"
					method="post" enctype="multipart/form-data" class="form-horizontal">
					<div style="height: 50px">${insertErrorMSG}</div>
					<div class="form-group">
						<label for="account" class="col-sm-2 control-label">帳號:</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="account"
								name="raiserForm.account" value="${form.account }" placeholder="請輸入帳號"
								required="required">
						</div>
						<div class="col-sm-3" id="chkAcc" class="errorClassForRaiser">${insertErrorACC}</div>
					</div>

					<div class="form-group">
						<label for="inputpw" class="col-sm-2 control-label">密碼:</label>
						<div class="col-sm-7">
							<input type="password" class="form-control" id="inputpw" placeholder="請輸入密碼"
								name="raiserForm.passwd" required="required">
						</div>
						<div class="col-sm-3" class="errorClassForRaiser">${insertErrorPSW}</div>
					</div>

					<div class="form-group">
						<label for="inputpw" class="col-sm-2 control-label">確認密碼:</label>
						<div class="col-sm-7">
							<input type="password" class="form-control" id="inputpw2" placeholder="再輸入一次密碼"
								required="required">
						</div>
						<div class="col-sm-3" id="chkPw2" class="errorClassForRaiser"></div>
					</div>

					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">團體名稱:</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="name"
								name="raiserForm.name" value="${form.name}" placeholder="請注意,同一團體不可重複註冊!!" required="required">
						</div>
						<div class="col-sm-3" id="chkName" class="errorClassForRaiser">${insertErrorNAME}</div>
					</div>

					<div class="form-group">
						<label for="tel" class="col-sm-2 control-label">電話:</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="tel"
								name="raiserForm.tel" value="${form.tel}" placeholder="註冊成功後將進行電話認證" required="required">
						</div>
					</div>

					<div class="form-group">
						<label for="cname" class="col-sm-2 control-label">連絡人姓名:</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="cname" placeholder="請輸入連絡人姓名,稍後將進行電話認證"
								name="raiserForm.contactPerson" value="${form.contactPerson}"
								required="required">
						</div>
					</div>

					<div class="form-group">
						<label for="ctel" class="col-sm-2 control-label">連絡人電話:</label>
						<div class="col-sm-7">
							<input type="tel" class="form-control" id="ctel"
								name="raiserForm.contactTel" value="${form.contactTel}" placeholder="註冊成功後將進行電話認證"
								required="required">
						</div>
					</div>

					<div class="form-group">
						<label for="mail" class="col-sm-2 control-label">信箱:</label>
						<div class="col-sm-7">
							<input type="email" class="form-control" id="mail"
								name="raiserForm.email" value="${form.email}" placeholder="請輸入信箱"
								required="required">
						</div>
					</div>

					<div class="form-group">
						<label for="add" class="col-sm-2 control-label">地址:</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="add" placeholder="請輸入團體地址"
								name="raiserForm.address" value="${form.address}"
								required="required">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">圖標:</label>
						<div class="col-sm-7">
							<input type="file" name="raiserForm.logo" id="logo"
								required="required" accept="image/*">
						</div>
						<div class="col-sm-3" id="chkLogo"></div>
					</div>

					<div class="form-group">
						<label for="del" class="col-sm-2 control-label">團體介紹:</label>
						<div class="col-sm-7">
							<textarea rows="10" cols="50" class="form-control" id="del"
								name="raiserForm.detail">${form.detail}</textarea>
						</div>
					</div>

					<div class="form-group">
						<label for="vdl" class="col-sm-2 control-label">團體短片:</label>
						<div class="col-sm-7">
							<input type="url" class="form-control" id="vdl" placeholder="請輸入嵌入影片網址"
								name="raiserForm.videoUrl" value="${form.videoUrl}">
						</div>
					</div>

					<div class="row" style="padding-top: 20px">
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<button type="submit" class="btn btn-default">確定送出</button>
							<button type="reset" class="btn btn-default">清除資料</button>
						</div>
					</div>
					<div style="height: 200px"></div>
				</form>
			</div>
		</div>
	</div>
	<script>
		raiserRegisCheckUrl1 = "${pageContext.request.contextPath}/raiser/raiserSelectForOne!select";
		raiserRegisCheckUrl2 = "${pageContext.request.contextPath}/raiser/raiserSelectForOne!checkName";
		var giverurl = "${pageContext.request.contextPath}/giver/giverSelect!selectAccount";
		$("#account").change(function() {
			$("#chkAcc").text("");
			if ($(this).val().toUpperCase() == "ADMIN") {
				$("#chkAcc").text("帳號已存在");
			}

			$.post(raiserRegisCheckUrl1, {
				"account" : $(this).val()
			}, function(data) {
				if (data != null) {
					$("#chkAcc").text("帳號已存在");
				}
			}, "json");

			$.post(giverurl, {
				'form.account' : $(this).val()
			}, function(data) {
				data = JSON.parse(data);
				if (data.checkAccount == true) {
					$("#chkAcc").text("帳號已存在");
				}
			});
		});

		$("#inputpw2").blur(function() {
			$("#chkPw2").text("")
			if ($(this).val() != $("#inputpw").val()) {
				$("#chkPw2").text("密碼不相符")
			}
		});

		$("#name").blur(function() {
			$("#chkName").text("")
			$.post(raiserRegisCheckUrl2, {
				"name" : $(this).val()
			}, function(data) {
				if (data != null) {
					$("#chkName").text("此團體已註冊")
				}
			}, "json")
		});

		$("#logo")
				.change(
						function() {
							var file = logo.files[0];
							if (file) {
								var reader = new FileReader();
								reader.onload = function(event) {
									$("#chkLogo")
											.append(
													"<img src='"+event.target.result
							+"' style='weight:50px; height:50px;'>");
								}
							}
							reader.readAsDataURL(file);
						});
	</script>
	<jsp:include page="../../footer.jsp" />
</body>
</html>