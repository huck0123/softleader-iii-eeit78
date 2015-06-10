<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html id="body">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>The Givers 募款活動</title>
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
html, body{height: 100%}
</style>
</head>
<body>
	<jsp:include page="/header.jsp" />

	
	<div id="raise-ok" class="container">
		<div class="row"
			style="text-align: center; color: slatedarkgray; padding-left: 20px;">
			<div id="holder"></div>
			<h1 style="margin-top: 30px; font-weight: bolder;">發起活動成功！</h1>

		</div>
	</div>

	<jsp:include page="/footer.jsp" />
</body>


<script>
var windowHeight = $(window).height();

$('#raise-ok').height(windowHeight - headerHeight -footerHeight);



$('#holder').height(0.3 * $('#raise-ok').height())
</script>
</html>