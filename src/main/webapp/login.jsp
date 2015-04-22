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
	<form name='loginForm' action="<c:url value='/j_spring_security_check' />" method='POST'>

		<table>
			<tr>
				<td>User:</td>
				<td><input type='text' name='account'></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type='password' name='passwd' /></td>
			</tr>
			<tr>
				<td colspan='2'>
					<input name="submit" type="submit" value="submit" />
				</td>
			</tr>
		</table>

		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

	</form>
</body>
</html>