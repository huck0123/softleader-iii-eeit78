<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/softleader-iii-eeit78/css/giver.css">
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>

<title>Insert title here</title>
<style>
body { 
 	background-color: #eee; 
} 

.form-signin {
	max-width: 330px;
	padding: 15px;
	margin: 0 auto;
}

.form-signin .form-control {
	position: relative;
	height: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 10px;
	font-size: 16px;
}

</style>
</head>
<body id="body">
	<jsp:include page="../../header.jsp" />
	
<!-- 	<p>this is login.jsp</p> -->
	
	<div class="container">
		<form class="form-signin"
			action="<c:url value='/login/loginAction.action' />" method="post">
			<h2 class="form-signin-heading">請登入</h2>
			<label for="" class="sr-only">帳號</label> 
			<input type="text" class="form-control" name="account" placeholder="帳號" required > 
			<label	for="" class="sr-only">Password</label> 
			<input type="password"	class="form-control" name="passwd" placeholder="Password" required>
			<div class="checkbox"></div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign	in</button>


<!-- 					<table> -->
<!-- 						<tr> -->
<!-- 							<td>ID :</td> -->
<!-- 							<td><input type="text" name="account" -->
<%-- 								value="${param.account}"></td> --%>
<%-- 							<td><span class="error">${errors.account}</span></td> --%>
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td>PWD :</td> -->
<!-- 							<td><input type="text" name="passwd" -->
<%-- 								value="${param.passwd}"></td> --%>
<%-- 							<td><span class="error">${errors.passwd}</span></td> --%>
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td></td> -->
<!-- 							<td align="right"><input type="submit" value="Login"></td> -->
<!-- 						</tr> -->
<!-- 					</table> -->
		</form>
	</div>
	${wrongLogin}
</body>
</html>