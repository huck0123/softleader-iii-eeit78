<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>����-���U�b��</title>
</head>
<body>
	<form action="<c:url value='/raiser/raiserAction!insert' />" method="post" enctype="multipart/form-data">
		�b��:<input type="text" name="raiserForm.account" required="required"> <br>
		�K�X:<input type="password" name="raiserForm.passwd" required="required"> <br>
		����W��:<input type="text" name="raiserForm.name" required="required"> <br>
		�q��:<input type="text" name="raiserForm.tel"> <br>
		�s���H�m�W:<input type="text" name="raiserForm.contactPerson"><br> 
		�s���H�q��:<input type="text" name="raiserForm.contactTel"><br>
		�H�c:<input type="email" name="raiserForm.email"> <br>
		�a�}:<input type="text" name="raiserForm.address"> <br>
		�ϼ�:<input type="file" name="raiserForm.logo"><br>
		���餶��:<textarea rows="4" cols="50" name="raiserForm.detail"></textarea><br>
		����u��:<input type="text" name="raiserForm.videoUrl"><br>
		<input type="submit" value="�T�w�e�X"><input type="reset" value="�M�����">
	</form>
	<a href="<c:url value='/index.jsp' />">�^����</a>
</body>
</html>