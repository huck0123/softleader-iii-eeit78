<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>團體-更新帳號</title>
</head>
<body>
	<form action="<c:url value='/raiser/raiserAction!update.action' />" method="post" enctype="multipart/form-data">
		id : <input type="text" name="raiserForm.id" value="${raiser.id}"  ><br>
		帳號:<input type="text" name="raiserForm.account"  value="${raiser.account}"><br>
		密碼:<input type="password" name="raiserForm.passwd" required="required"> <br>
		團體名稱:<input type="text" name="raiserForm.name" required="required" value="${raiser.name}"> <br>
		電話:<input type="text" name="raiserForm.tel" value="${raiser.tel}"> <br>
		連絡人姓名:<input type="text" name="raiserForm.contactPerson" value="${raiser.contactPerson}"><br> 
		連絡人電話:<input type="text" name="raiserForm.contactTel" value="${raiser.contactTel}"><br>
		信箱:<input type="email" name="raiserForm.email" value="${raiser.email}"> <br>
		地址:<input type="text" name="raiserForm.address" value="${raiser.address}"> <br>
		圖標:<input type="file" name="raiserForm.logo" value="${raiser.logo}"><br>
		團體介紹:<textarea rows="4" cols="50" name="raiserForm.detail">123123${raiser.detail}</textarea><br>
		團體短片:<input type="text" name="raiserForm.videoUrl" value="${raiser.videoUrl}"><br>
		<input type="submit" value="確定送出"><input type="reset" value="清除資料">
		<a href="<c:url value='/index.jsp' />">回首頁</a>
	</form>
</body>
</html>