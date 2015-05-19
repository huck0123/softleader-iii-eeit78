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
</style>
<title>團體-更新帳號</title>
</head>
<body id="body">
	<jsp:include page="../../header.jsp" />
	<div class="container">
		<h2 style="text-align: center">活動專區</h2>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<ul class="nav nav-tabs" role="tablist">
					<li><a href="#raiserUpdate">修改團體資訊</a></li>
					<li><a href="#raiserHistory">查看活動紀錄</a></li>
					<li><a href="#campaignRaise">發起活動</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade" id="raiserUpdate">
						<div class="row">
							<div class="col-md-4">
								<img src='' class='img-thumbnail' id='logo'
									style='width: 200px; height: 200px'>
							</div>
							<div class="col-md-8">
								<form
									action="<c:url value='/raiser/raiserAction!update.action' />"
									method="post" enctype="multipart/form-data">

									<div class="form-group">
										<input type="text" style="display: none" class="form-control"
											id="inputid" name="raiserForm.id" value="${raiser.id}">
									</div>

									<div class="form-group">
										<label for="account">帳號</label> <input type="text"
											value="${raiser.account}" class="form-control"
											disabled="disabled"> <input type="text"
											style="display: none" class="form-control" id="account"
											name="raiserForm.account" value="${raiser.account}">
									</div>

									<div class="form-group">
										<label for="inputpw">密碼</label> <input type="password"
											class="form-control" id="inputpw" name="raiserForm.passwd"
											required="required">
									</div>

									<div class="form-group">
										<label for="name">團體名稱</label> <input type="text"
											class="form-control" id="name" name="raiserForm.name"
											required="required" value="${raiser.name}">
									</div>

									<div class="form-group">
										<label for="tel">電話</label> <input type="text"
											class="form-control" id="tel" name="raiserForm.tel"
											value="${raiser.tel}">
									</div>

									<div class="form-group">
										<label for="cname">連絡人姓名</label> <input type="text"
											class="form-control" id="cname"
											name="raiserForm.contactPerson"
											value="${raiser.contactPerson}">
									</div>

									<div class="form-group">
										<label for="ctel">連絡人電話</label> <input type="tel"
											class="form-control" id="ctel" name="raiserForm.contactTel"
											value="${raiser.contactTel}">
									</div>

									<div class="form-group">
										<label for="mail">信箱</label> <input type="email"
											class="form-control" id="mail" name="raiserForm.email"
											value="${raiser.email}">
									</div>

									<div class="form-group">
										<label for="add">地址</label> <input type="text"
											class="form-control" id="add" name="raiserForm.address"
											value="${raiser.address}">
									</div>

									<div class="form-group">
										<label>圖標</label> <input type="file" class="form-control"
											name="raiserForm.logo" value="${raiser.logo}">
									</div>

									<div class="form-group">
										<label for="del">團體介紹</label>
										<textarea rows="4" cols="50" class="form-control" id="del"
											name="raiserForm.detail">${raiser.detail}</textarea>
									</div>

									<div class="form-group">
										<label for="vdl">團體短片</label>
										<iframe src="${raiser.videoUrl}"></iframe>
										<input type="url" class="form-control" id="vdl"
											name="raiserForm.videoUrl" value="${raiser.videoUrl}">
									</div>
									<button type="submit" class="btn btn-default">確定送出</button>
									<button type="reset" class="btn btn-default">清除資料</button>
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
		var url = "/softleader-iii-eeit78/raiser/raiserSelectAll!select";
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
	</script>
</body>
</html>