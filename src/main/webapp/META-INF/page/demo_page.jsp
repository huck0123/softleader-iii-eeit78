<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel='stylesheet' type='text/css' href='<c:url value="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>' />
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script>
</script>
<body>
	${user}
	<h1>${form.code} - ${form.name} - ${hahaha}</h1>
	<form class="form-inline" action="<c:url value="/demo" />" method="POST">
		<div class="form-group <c:if test="${not empty errorMsgs.code}">has-error</c:if>">
			<label class="control-label" for="code">代碼</label>
			<input type="text" class="form-control" id="code" name="form.code" value="${form.code}"><br>
 			　　　<font color="red">${errorMsgs["code"]}</font><br>
		</div>
		<div class="form-group <c:if test="${not empty errorMsgs.name}">has-error</c:if>">
			<label class="control-label" for="name">名稱</label>
			<input type="text" class="form-control" id="name" name="form.name" value="${form.name}"><br>
 			　　　<font color="red">${errorMsgs["name"]}</font><br>
		</div>
 		
 		<button class="btn btn-default" type="submit" id="submit" name="submit">送出</button>
	</form>
	
</body>
</html>