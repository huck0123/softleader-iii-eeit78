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
.divForAllRaiser {
	box-shadow: 4px 4px 12px 2px rgba(20%, 20%, 40%, 0.5) inset ,inset 1px 1px 4px 2px rgba(20%,20%,40%,0.5);
}
.ForAllRaiser{
box-shadow: 4px 4px 12px 2px rgba(20%, 20%, 40%, 0.5) 
}
</style>
<title>使用者-所有團體資訊</title>
</head>
<body id="body">
	<jsp:include page="../../header.jsp" />
	<div class="container">
	<br>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="divForAllRaiser">
					<br>
					<h2>所有參與團體</h2>
					<ul class="list-unstyled">
						<div class="row" id="raiserLogo"></div>
					</ul>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
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
								var strimg = "<img src='' class='img-thumbnail ForAllRaiser' id='logo"+raiser.id+"' style='width:150px; height:120px'>";
								var strhref = "<a href='${pageContext.request.contextPath}/raiser/raiserAction!select?account="
										+ raiser.account
										+ "'>"
										+ strimg
										+ "<br>" + raiser.name + "</a>";
								$("#raiserLogo").prepend(
										"<div class='col-md-3'><li style='padding:15px'>"
												+ strhref + "</li></div>");
								$("#logo" + raiser.id).attr("src",
										"data:image/png;base64," + srclogo);
							});
		}
	</script>
</body>