<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>����-��s�b��</title>
</head>
<body>
	<form action="<c:url value='/raiser/raiserAction!update.action' />" method="post" enctype="multipart/form-data">
		id : <input tyoe="text" name="raiserForm.id" value="${raiserForm.id}"><br>
		�b��:${raiserForm.account}<br>
		�K�X:<input type="password" name="raiserForm.passwd" required="required"> <br>
		����W��:<input type="text" name="raiserForm.name" required="required" value="${raiserForm.name}"> <br>
		�q��:<input type="text" name="raiserForm.tel" value="${raiserForm.tel}"> <br>
		�s���H�m�W:<input type="text" name="raiserForm.contactPerson" value="${raiserForm.contactPerson}"><br> 
		�s���H�q��:<input type="text" name="raiserForm.contactTel" value="${raiserForm.contactTel}"><br>
		�H�c:<input type="email" name="raiserForm.email" value="${raiserForm.email}"> <br>
		�a�}:<input type="text" name="raiserForm.address" value="${raiserForm.address}"> <br>
		�ϼ�:<input type="file" name="raiserForm.logo" value="${raiserForm.logo}"><br>
		���餶��:<textarea rows="4" cols="50" name="raiserForm.detail" value="${raiserForm.detail}"></textarea><br>
		����u��:<input type="text" name="raiserForm.videoUrl" value="${raiserForm.videoUrl}"><br>
		<input type="submit" value="�T�w�e�X"><input type="reset" value="�M�����">
	</form>
</body>
</html>