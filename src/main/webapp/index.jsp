<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
campaignCount: ${application.campaignCount}<br/>
giverCount: ${application.giverCount }
	<c:if test="${admin != null}">${admin}</c:if>
	<c:if test="${giver != null}">${giver}</c:if>
	<c:if test="${raiser != null}">${raiser}</c:if>

	<c:if test="${empty admin && empty giver && empty raiser}">
		<form action="<c:url value='/login/loginAction'/>" method="post">
			<table>
				<tr>
					<td>ID :</td>
					<td><input type="text" name="account" value="${param.account}"></td>
					<td><span class="error">${errors.account}</span></td>
				</tr>
				<tr>
					<td>PWD :</td>
					<td><input type="text" name="passwd" value="${param.passwd}"></td>
					<td><span class="error">${errors.passwd}</span></td>
				</tr>
				<tr>
					<td></td>
					<td align="right"><input type="submit" value="Login"></td>
				</tr>
			</table>
			${wrongLogin}
		</form>
		<p />
		<a href="<c:url value='/login/login'/>">進入登入頁面</a>
		<p />
	</c:if>
	<p />
	<a href="<c:url value='/campaign/campaignRaise'/>">發起活動</a>
	<p />
	<c:if test="${giver == null }">
	<p />
	<a href="<c:url value='/giver/giverRegister'/>">捐款人註冊</a>
	<p />
	</c:if>
	<p />
	<a href="<c:url value='/campaign/campaignShow'/>">顯示所有活動</a>
	<p />
		<p />
	<a href="<c:url value='/campaign/campaignDetail?campaignForm.id=565'/>">顯示活動細節</a>
	<p />
	<a href="<c:url value='/giver/AllGiverInfo'/>">顯示所有捐款人資訊</a>
	<p />
	<a href="<c:url value='/raiser/raiserRegister'/>">進入團體申請帳號頁面</a>
	<p />
	<a href="<c:url value='/giver/giverInfo'/>">修改捐款人資訊</a>
	<p />
</body>
</html>