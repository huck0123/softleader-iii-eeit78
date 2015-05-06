<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/softleader-iii-eeit78/css/giver.css">
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>
<script src="/softleader-iii-eeit78/js/useful.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>團體-註冊帳號</title>
</head>
<body id="body">
	<jsp:include page="../../header.jsp" />
	<div class="container">
		<div class="row" style="padding-top: 20px">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<form action="<c:url value='/raiser/raiserAction!insert' />"
					method="post" enctype="multipart/form-data" class="form-horizontal">

					<div class="form-group">
						<label for="account" class="col-sm-2 control-label">帳號:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="account"
								name="raiserForm.account">
						</div>
					</div>

					<div class="form-group">
						<label for="inputpw" class="col-sm-2 control-label">密碼:</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="inputpw"
								name="raiserForm.passwd" required="required">
						</div>
					</div>

					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">團體名稱:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="name"
								name="raiserForm.name" required="required">
						</div>
					</div>

					<div class="form-group">
						<label for="tel" class="col-sm-2 control-label">電話:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="tel"
								name="raiserForm.tel">
						</div>
					</div>

					<div class="form-group">
						<label for="cname" class="col-sm-2 control-label">連絡人姓名:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="cname"
								name="raiserForm.contactPerson">
						</div>
					</div>

					<div class="form-group">
						<label for="ctel" class="col-sm-2 control-label">連絡人電話:</label>
						<div class="col-sm-10">
							<input type="tel" class="form-control" id="ctel"
								name="raiserForm.contactTel">
						</div>
					</div>

					<div class="form-group">
						<label for="mail" class="col-sm-2 control-label">信箱:</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="mail"
								name="raiserForm.email">
						</div>
					</div>

					<div class="form-group">
						<label for="add" class="col-sm-2 control-label">地址:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="add"
								name="raiserForm.address">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">圖標:</label>
						<div class="col-sm-10">
							<input type="file" name="raiserForm.logo" value=>
						</div>
					</div>

					<div class="form-group">
						<label for="del" class="col-sm-2 control-label">團體介紹:</label>
						<div class="col-sm-10">
							<textarea rows="4" cols="50" class="form-control" id="del"
								name="raiserForm.detail"></textarea>
						</div>
					</div>

					<div class="form-group">
						<label for="vdl" class="col-sm-2 control-label">團體短片:</label>
						<div class="col-sm-10">
							<input type="url" class="form-control" id="vdl"
								name="raiserForm.videoUrl">
						</div>
					</div>

					<div class="row" style="padding-top: 20px">
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<button type="submit" class="btn btn-default">確定送出</button>
							<button type="reset" class="btn btn-default">清除資料</button>
						</div>
						<div class="col-md-4">
							<a href="<c:url value='/index.jsp' />">回首頁</a>
						</div>
					</div>

				</form>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>
</html>