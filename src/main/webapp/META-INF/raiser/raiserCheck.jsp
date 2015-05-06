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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
</style>
<title>使用者-所有團體資訊</title>
</head>
<body id="body">
	<jsp:include page="../../header.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<ul class="list-unstyled">
					<div class="row" id="raiserLogo"></div>
				</ul>
			</div>
			<div class="col-md-2"></div>
		</div>
		<a href="<c:url value='/index.jsp' />">回首頁</a>
	</div>
	<script>
		var url = "/softleader-iii-eeit78/raiser/raiserSelectAll!selectAll"
		$.post(url, getData);

		function getData(raisers) {
			raisers = JSON.parse(raisers);
			$(raisers)
					.each(
							function(index, raiser) {
								var srclogo = arrayBufferToBase64(raiser.logo);
								var strimg = "<img src='' class='img-thumbnail' id='logo"+raiser.id+"' style='width:200px; height:200px'>";
								var strhref = "<a href='<c:url value='/raiser/raiserAction!select?account="
										+ raiser.account
										+ "'/>'>"
										+ strimg
										+ "<br>" + raiser.name + "</a>";
								$("#raiserLogo").append(
										"<div class='col-md-3'><li style='padding:5px'>"
												+ strhref + "</li></div>");
								$("#logo" + raiser.id).attr("src",
										"data:image/png;base64," + srclogo);
							});
		}
	</script>
</body>