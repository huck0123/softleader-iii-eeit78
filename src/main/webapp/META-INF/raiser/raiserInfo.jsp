<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>����ϥΪ̤���</title>
</head>
<body>
	${raiser.name},�A�n<p />

	<a href="<c:url value='/raiser/raiserUpdate'/>">�ק�����T</a><p />
	<a href="<c:url value='/raiser/raiserHistory'/>">�d�ݬ��ʬ���</a><p />
	
	<a href="<c:url value='/index.jsp' />">�^����</a>
</body>
</html>