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
		
		
			<p>
	<a href="<c:url value='/giver/giverRegister'/>">註冊為捐款會員</a>
	</p>
	<p>
	<a href="<c:url value='/raiser/raiserRegister'/>">進入團體申請帳號頁面</a>
	</p>


</body>
</html>