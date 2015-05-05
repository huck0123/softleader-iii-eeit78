<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>捐款人專區</title>

<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/softleader-iii-eeit78/css/giver.css">
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>

</head>
<body id="body">

	<jsp:include page="../../header.jsp" />
	
	<div class="row container">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h2>${sessionScope.giver.familyName }${sessionScope.giver.name }您好</h2>
			<a href="/softleader-iii-eeit78/giver/giverHistory">捐款人歷史訊息</a> 
			<p />
			<a href="/softleader-iii-eeit78/giver/giverInfo">修改會員資料</a>
		</div>
		<div class="col-md-2"></div>

	</div>

</body>
</html>