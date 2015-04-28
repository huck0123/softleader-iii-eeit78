<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>團體-更新帳號</title>
</head>
<body>
	<form action="<c:url value='/raiser/raiserAction!update.action' />" method="post" enctype="multipart/form-data">
		id : <input tyoe="text" name="raiserForm.id" value="${raiserForm.id}"><br>
		帳號:${raiserForm.account}<br>
		密碼:<input type="password" name="raiserForm.passwd" required="required"> <br>
		團體名稱:<input type="text" name="raiserForm.name" required="required" value="${raiserForm.name}"> <br>
		電話:<input type="text" name="raiserForm.tel" value="${raiserForm.tel}"> <br>
		連絡人姓名:<input type="text" name="raiserForm.contactPerson" value="${raiserForm.contactPerson}"><br> 
		連絡人電話:<input type="text" name="raiserForm.contactTel" value="${raiserForm.contactTel}"><br>
		信箱:<input type="email" name="raiserForm.email" value="${raiserForm.email}"> <br>
		地址:<input type="text" name="raiserForm.address" value="${raiserForm.address}"> <br>
		圖標:<input type="file" name="raiserForm.logo" value="${raiserForm.logo}"><br>
		團體介紹:<textarea rows="4" cols="50" name="raiserForm.detail" value="${raiserForm.detail}"></textarea><br>
		團體短片:<input type="text" name="raiserForm.videoUrl" value="${raiserForm.videoUrl}"><br>
		<input type="submit" value="確定送出"><input type="reset" value="清除資料">
	</form>
</body>
</html>