<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>團體使用者介面</title>
</head>
<body>
	${raiser.name},你好<p />

	<a href="<c:url value='/raiser/raiserUpdate'/>">修改團體資訊</a><p />
	<a href="<c:url value='/raiser/raiserHistory'/>">查看活動紀錄</a><p />
	<a href="<c:url value='/raiser/raiserForOne'/>">單一個</a><p />
	<a href="<c:url value='/index.jsp' />">回首頁</a>
</body>
</html>