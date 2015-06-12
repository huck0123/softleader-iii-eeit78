<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
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
.raiser-wrapper{

}

.ForAllRaiser {
	
}
</style>
<title>參與團體</title>
<script>
	var url = "${pageContext.request.contextPath}/raiser/raiserSelectForOne!selectAll"
	$.post(url, getData, "json");
	function getData(raisers) {
		$(raisers)
				.each(
						function(index, raiser) {
							var srclogo = arrayBufferToBase64(raiser.logo);
							var strimg = "<img src='' class='img-thumbnail ForAllRaiser' id='logo"+raiser.id+"' style='width:180px; height:165px'>";
							var strhref = "<a style='font-size: 16px;' href='${pageContext.request.contextPath}/raiser/raiserAction!select?account="
									+ raiser.account
									+ "'>"
									+ strimg
									+ "<br>"
									+ raiser.name + "</a>";
							$("#raiserLogo").prepend(
									"<div class='col-md-3'><li style='padding:15px'>"
											+ strhref + "</li></div>");
							$("#logo" + raiser.id).attr("src",
									"data:image/png;base64," + srclogo);
						});
	}
</script>
</head>
<body id="body">


		<jsp:include page="../../header.jsp" />
		
		<div class="container" style="background-color: #f2f2f2; margin-top: 20px;">
			<div class="row" style="text-align:center; color:darkslategray;">
				<h1 style="margin-top: 30px; font-weight: bolder;">參與團體</h1>
				<p style="font-size: 20px; margin-top: 16px; font-weight: bolder; margin-bottom: 46px;">立即認識更多參與我們的公益團體</p>
			</div>
	</div>
	
	<div class="raiser-wrapper" style="margin-top: 20px; margin-bottom: 30px">
		<div class="container" style=" background-color: #f2f2f2; padding-top:30px;padding-bottom: 20px">
			<div class="row">
				<div class="divForAllRaiser">
					<ul class="list-unstyled">
						<div class="row" id="raiserLogo"></div>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../../footer.jsp" />
</body>