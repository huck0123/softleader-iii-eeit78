<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
<p>this is login.jsp</p>
	<form action="<c:url value='/login/loginAct.action' />" method="post">
		<table>
			<tr>
				<td>ID :</td>
				<td><input type="text" name="account"
					value="${param.account}"></td>
				<td><span class="error">${errors.account}</span></td>
			</tr>
			<tr>
				<td>PWD :</td>
				<td><input type="text" name="passwd"
					value="${param.passwd}"></td>
				<td><span class="error">${errors.passwd}</span></td>
			</tr>
			<tr>
				<td></td>
				<td align="right"><input type="submit" value="Login"></td>
			</tr>
		</table>
	</form>
	
	${wrongLogin}
</body>
</html>