<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>團體-註冊帳號</title>
</head>
<body>
	<form action="<c:url value='/raiser/raiserAction!insert.action' />" method="post" enctype="multipart/form-data">
		帳號:<input type="text" name="raiserForm.account" required="required"> <br>
		密碼:<input type="password" name="raiserForm.passwd" required="required"> <br>
		姓名:<input type="text" name="raiserForm.name" required="required"> <br>
		電話:<input type="text" name="raiserForm.tel"> <br>
		連絡人姓名:<input type="text" name="raiserForm.contactPerson"><br> 
		連絡人電話:<input type="text" name="raiserForm.contactTel"><br>
		信箱:<input type="email" name="raiserForm.email"> <br>
		地址:<input type="text" name="raiserForm.address"> <br>
		圖標:<input type="file" name="raiserForm.logo"><br>
		團體介紹:<textarea rows="4" cols="50" name="raiserForm.detail"></textarea><br>
		團體短片:<input type="text" name="raiserForm.videoUrl"><br>
		<input type="submit" value="確定送出"><input type="reset" value="清除資料">
	</form>
</body>
</html>