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
		帳號:${raiserForm.account} <br> 
		密碼:${raiserForm.passwd} <br> 
		姓名:${raiser.name} <br>
		電話:${raiserForm.tel} <br> 
		連絡人姓名:${raiserForm.contactPerson} <br>
		連絡人電話:${raiserForm.contactTel} <br> 
		信箱:${raiserForm.email} <br> 
		地址:${raiserForm.address} <br>
		圖標:${raiserForm.logo} <br> 
		團體介紹:${raiserForm.detail} <br> 
		團體短片:${raiserForm.videoUrl} <br>

		<input type="submit" name="check" value="上一頁"> <input
			type="submit" name="check" value="確認送出">
	</form>
</body>
</html>