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
html, body {
	height: 100%;
}

body {
	text-align: left;
}
</style>
<title>${raiserSelf.account}</title>
</head>
<body id="body">
	<jsp:include page="../../header.jsp" />
	<div class="container" style="min-height:80%;margin-bottom: 20px; margin-top: 20px">
		<div class="row" style="text-align: center">

			<div class="col-md-4">
				<br> <img src='' class='img-thumbnail' id='logo'
					style='width: 250px; height: 230px'>
				<h1>${raiserSelf.name}</h1>
				<h5>地址:${raiserSelf.address}</h5>
				<h5>電話:${raiserSelf.tel}</h5>
				<h5 id="mailForRaiser">信箱:${raiserSelf.email}</h5>
				<h5>連絡人姓名:${raiserSelf.contactPerson}</h5>
				<h5>連絡人電話:${raiserSelf.contactTel}</h5>
			</div>
			<div class="col-md-8">
				<div class="embed-responsive embed-responsive-16by9"
					style="margin-top: 22px;">
					<iframe src="${raiserSelf.videoUrl}"></iframe>
				</div>
				<h3 style="text-align: center">團體簡介</h3>
				<p style="font-size: 18px; text-align: left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${raiserSelf.detail}</p>
			</div>
		</div>

	</div>

	<script>
		var url = "${pageContext.request.contextPath}/raiser/raiserSelectForOne!select";
		$.post(url, {
			"account" : "${raiserSelf.account}"
		}, getData, "json");
		function getData(raiser) {
			var srclogo = arrayBufferToBase64(raiser.logo);
			$("#logo").attr("src", "data:image/png;base64," + srclogo);
		}
		if ("${raiser.id}" != "${raiserSelf.id}") {
			if ("${giver.name}" || "${raiser.name}" || "${admin}") {
				$("#mailForRaiser")
						.append(
								"<a	href='mailto:${raiserSelf.name}<${raiserSelf.email}>?Subject=來自TheGivers使用者${giver.familyName}${giver.name}${raiser.name}${admin.account}(id:${giver.account}${raiser.account}${admin.account})寄給您的信&body=您好,我是${raiser.name}${giver.familyName}${giver.name}${admin.account},我在TheGivers網站上看到有關你們團體的消息,想請問您...'>　<span class='glyphicon glyphicon-envelope'></span></a>")
			} else {
				$("#mailForRaiser")
						.append(
								"<a	href='mailto:${raiserSelf.name}<${raiserSelf.email}>?Subject=來自TheGivers訪客寄給您的信&body=您好,我在TheGivers網站上看到有關你們團體的消息,想請問您...'>　<span class='glyphicon glyphicon-envelope'></span></a>")
			}
		}
	</script>
	<jsp:include page="../../footer.jsp" />
</body>
</html>