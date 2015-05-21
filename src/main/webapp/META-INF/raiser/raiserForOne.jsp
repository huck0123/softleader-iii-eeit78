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
<title>${raiserSelf.account}</title>
</head>
<body id="body">
	<jsp:include page="../../header.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-3">
				<br> <img src='' class='img-thumbnail' id='logo'
					style='width: 250px; height: 230px'>
				<h1>${raiserSelf.name}</h1>
				<h5>�a�}:${raiserSelf.address}</h5>
				<h5>�q��:${raiserSelf.tel}</h5>
				<h5 id="mailForRaiser">�H�c:${raiserSelf.email}�@</h5>
				<h5>�s���H�m�W:${raiserSelf.contactPerson}</h5>
				<h5>�s���H�q��:${raiserSelf.contactTel}</h5>
			</div>
			<div class="col-md-5">
				<h3 style="text-align: center">����u��</h3>
				<iframe src="${raiserSelf.videoUrl}"
					style="width: 470px; height: 360px"></iframe>
			</div>
			<div class="col-md-3"></div>
		</div>
		<div class="row" style="height: 800px">
			<div class="col-md-4"></div>
			<div class="col-md-5">
				<h3 style="text-align: center">���餶��</h3>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${raiserSelf.detail}
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>
	<script>
		var url = "${pageContext.request.contextPath}/raiser/raiserSelectForOne!select";
		$.post(url, {
			"account" : "${raiserSelf.account}"
		}, getData, "json");
		function getData(raiser) {
			console.log(raiser);
			var srclogo = arrayBufferToBase64(raiser.logo);
			$("#logo").attr("src", "data:image/png;base64," + srclogo);
		}

		if ("${giver.name}" || "${raiser.name}" && "${raiser.name}"!="${raiserSelf.name}") {
			$("#mailForRaiser")
					.append(
							"<a	href='mailto:${raiserSelf.name}<${raiserSelf.email}>?Subject=�Ӧ�TheGivers�ϥΪ�${giver.familyName}${giver.name}${raiser.name}(id:${giver.account}${raiser.account})�H���z���H&body=�z�n,�ڬO${raiser.name}${giver.familyName}${giver.name},�ڦbTheGivers�����W�ݨ즳���A�̹��骺����,�Q�аݱz...'><span class='glyphicon glyphicon-envelope'></span></a>")
		}
	</script>
	<jsp:include page="../../footer.jsp" />
</body>
</html>