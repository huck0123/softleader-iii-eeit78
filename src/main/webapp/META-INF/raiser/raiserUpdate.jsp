<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>����-��s�b��</title>
</head>
<body>
	<form action="<c:url value='/raiser/raiserAction!update.action' />" method="post" enctype="multipart/form-data">
		id : <input type="text" name="raiserForm.id" value="${raiser.id}"  ><br>
		�b��:<input type="text" name="raiserForm.account"  value="${raiser.account}"><br>
		�K�X:<input type="password" name="raiserForm.passwd" required="required"> <br>
		����W��:<input type="text" name="raiserForm.name" required="required" value="${raiser.name}"> <br>
		�q��:<input type="text" name="raiserForm.tel" value="${raiser.tel}"> <br>
		�s���H�m�W:<input type="text" name="raiserForm.contactPerson" value="${raiser.contactPerson}"><br> 
		�s���H�q��:<input type="text" name="raiserForm.contactTel" value="${raiser.contactTel}"><br>
		�H�c:<input type="email" name="raiserForm.email" value="${raiser.email}"> <br>
		�a�}:<input type="text" name="raiserForm.address" value="${raiser.address}"> <br>
		�ϼ�:<input type="file" name="raiserForm.logo" value="${raiser.logo}"><br>
		���餶��:<textarea rows="4" cols="50" name="raiserForm.detail">123123${raiser.detail}</textarea><br>
		����u��:<input type="text" name="raiserForm.videoUrl" value="${raiser.videoUrl}"><br>
		<input type="submit" value="�T�w�e�X"><input type="reset" value="�M�����">
		<a href="<c:url value='/index.jsp' />">�^����</a>
	</form>
</body>
</html>