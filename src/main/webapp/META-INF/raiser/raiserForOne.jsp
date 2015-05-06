<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<style type="text/css">
body {
	text-align: left;
}
</style>
<title>${raiserSelf.account}123</title>
</head>
<body id="body">
	<jsp:include page="../../header.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-2">
				<img src='' class='img-thumbnail' id='logo'
					style='width: 200px; height: 200px'>
			</div>
			<div class="col-md-4">
				<h1>${raiserSelf.name}</h1>
				${raiserSelf.address} <br> ${raiserSelf.tel} <br>
				${raiserSelf.email} <br> ${raiserSelf.contactPerson} <br>
				${raiserSelf.contactTel} <br> ${raiserSelf.videoUrl} <br>
			</div>
			<div class="col-md-3"></div>
		</div>
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<br> ${raiserSelf.detail} <br>
			</div>
			<div class="col-md-3"></div>
		</div>
		<br>
		<div style="text-align: center;">
			<a href="<c:url value='/index.jsp' />">¦^­º­¶</a>
		</div>
	</div>
	<script>
		var url = "/softleader-iii-eeit78/raiser/raiserSelectAll!select";
		$.post(url, {
			"account" : "${raiserSelf.account}"
		}, getData, "json");
		function getData(raiser) {
			var srclogo = arrayBufferToBase64(raiser.logo);
			$("#logo").attr("src", "data:image/png;base64," + srclogo);
		}
	</script>
</body>
</html>