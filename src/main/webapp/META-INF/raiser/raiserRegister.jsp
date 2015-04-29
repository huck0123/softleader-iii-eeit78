<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<title>團體-註冊帳號</title>
</head>
<body>
	<div class="row" >
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form action="<c:url value='/raiser/raiserAction!insert' />"
				method="post" enctype="multipart/form-data">

				<div class="form-group">
					<label for="account">帳號</label> <input type="text"
						class="form-control" id="account" name="raiserForm.account">
				</div>

				<div class="form-group">
					<label for="inputpw">密碼</label> <input type="password"
						class="form-control" id="inputpw" name="raiserForm.passwd"
						required="required">
				</div>

				<div class="form-group">
					<label for="name">團體名稱</label> <input type="text"
						class="form-control" id="name" name="raiserForm.name"
						required="required">
				</div>

				<div class="form-group">
					<label for="tel">電話</label> <input type="text"
						class="form-control" id="tel" name="raiserForm.tel">
				</div>

				<div class="form-group">
					<label for="cname">連絡人姓名</label> <input type="text"
						class="form-control" id="cname" name="raiserForm.contactPerson">
				</div>

				<div class="form-group">
					<label for="ctel">連絡人電話</label> <input type="tel"
						class="form-control" id="ctel" name="raiserForm.contactTel">
				</div>

				<div class="form-group">
					<label for="mail">信箱</label> <input type="email"
						class="form-control" id="mail" name="raiserForm.email">
				</div>

				<div class="form-group">
					<label for="add">地址</label> <input type="text" class="form-control"
						id="add" name="raiserForm.address">
				</div>

				<div class="form-group">
					<label>圖標</label> <input type="file" class="form-control"
						name="raiserForm.logo" value=>
				</div>

				<div class="form-group">
					<label for="del">團體介紹</label>
					<textarea rows="4" cols="50" class="form-control" id="del"
						name="raiserForm.detail"></textarea>
				</div>

				<div class="form-group">
					<label for="vdl">團體短片</label> <input type="url"
						class="form-control" id="vdl" name="raiserForm.videoUrl">
				</div>

				<button type="submit" class="btn btn-default">確定送出</button>
				<button type="reset" class="btn btn-default">清除資料</button>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
	<a href="<c:url value='/index.jsp' />"	>回首頁</a>
</body>
</html>