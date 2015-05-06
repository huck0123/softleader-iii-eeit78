<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/giver.css">
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>
	
<title>捐贈流程</title>

</head>
<body id="body">
	<jsp:include page="../../header.jsp" />

	<div class="row container">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			${sessionScope.giver.familyName }${sessionScope.giver.name }您好!
			<form action="<c:url value='/donate/billInfo'/>" method="post">
				<table class="table">
					<tr>
						<td><label for="">捐款活動名稱</label></td>
						<td><input type="hidden" name="campaignName" value="${param.name }">${param.name }</td>
					</tr>
					<tr style="display: none">
						<td><label for="">捐款活動Id</label></td>
						<td><input type="text" name="campaignId" value="${param.id }"></td>
					</tr>
					<tr>
						<td><label for="">捐款人姓名</label></td>
						<td>${sessionScope.giver.familyName }${sessionScope.giver.name }</td>
					</tr>
					<tr>
						<td><label for="">捐款金額</label></td>
						<td><input type="text" name="amount"></td>
					</tr>
					<tr>
						<td><input type="submit" value="下一步"></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>



</body>

</html>