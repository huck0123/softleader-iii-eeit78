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
<title>請等待驗證...</title>
<style>
#divm {
	height: 800px;
	background-color: #fffff;
	background-image: url(/softleader-iii-eeit78/pictures/bulb.jpeg);
	filter: alpha(opacity = 30);
	-moz-opacity: 0.3;
	opacity: 0.3;
	-khtml-opacity: 0.3;
}
#word{
	margin-top: -500px;
}
</style>
</head>
<body id="body">
	<jsp:include page="../../header.jsp" />
	<div class="container">
		<div id="divm"></div>
		<div id="word">
			<h1>請等待驗證...</h1>
			<br> <br> <br>
			<h3>稍後管理員會撥打電話進行驗證,確認您是合法的公益團體</h3>
			<br> <br>
			<h3>驗證完畢請進行登入使用您的帳號</h3>
		</div>
	</div>
</body>
</html>