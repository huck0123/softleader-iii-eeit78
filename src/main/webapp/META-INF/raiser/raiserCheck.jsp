<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
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
	<form action="<c:url value="" />" method="post">
		�b��:${raiserForm.account} <br> 
		�K�X:${raiserForm.passwd} <br> 
		�m�W:${raiser.name} <br>
		�q��:${raiserForm.tel} <br> 
		�s���H�m�W:${raiserForm.contactPerson} <br>
		�s���H�q��:${raiserForm.contactTel} <br> 
		�H�c:${raiserForm.email} <br> 
		�a�}:${raiserForm.address} <br>
		�ϼ�:${raiserForm.logo} <br> 
		���餶��:${raiserForm.detail} <br> 
		����u��:${raiserForm.videoUrl} <br>

		<input type="submit" name="check" value="�W�@��"> <input
			type="submit" name="check" value="�T�{�e�X">
	</form>
</body>
</html>