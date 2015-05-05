<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>捐贈者註冊頁面</title>

<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/giver.css">
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>

</head>
<body id="body">
	
	<jsp:include page="../../header.jsp" />
	
	<div class="row container">
		<div class="col-md-2"></div>

		<div class="col-md-8">
			<form action='/softleader-iii-eeit78/giver/giverAction!insert.action'
				method="post" enctype="multipart/form-data">
				<table class="table table-bordered">
					<tr>
						<td><label for="">帳號:</label></td>
						<td><input type="text" name="form.account"
							value="${param.form.account }" required="required"></td>
					</tr>
					<tr>
						<td><label for="">密碼:</label></td>
						<td><input type="password" name="form.passwd" value=""
							required="required"></td>
					</tr>
					<tr>
						<td><label for="">姓:</label></td>
						<td><input type="text" name="form.familyName"
							value="${param.form.familyName }"></td>
					</tr>
					<tr>
						<td><label for="">名字:</label></td>
						<td><input type="text" name="form.name"
							value="${param.form.name }"></td>
					</tr>
					<tr>
						<td><label for="">性別:</label></td>
						<td><input type="radio" name="form.gender" value="true">男
							<input type="radio" name="form.gender" value="false">女</td>
					</tr>
					<tr>
						<td><label for="">身分證字號:</label></td>
						<td><input type="text" name="form.id_number"
							value="${param.form.id_number }"></td>
					</tr>
					<tr>
						<td><label for="">手機:</label></td>
						<td><input type="text" name="form.tel"
							value="${param.form.tel }"></td>
					</tr>
					<tr>
						<td><label for="">住址:</label></td>
						<td><input type="text" name="form.address"
							value="${param.form.address }"></td>
					</tr>
					<tr>
						<td><label for="">Email:</label></td>
						<td><input type="email" name="form.email"
							value="${param.form.email }"></td>
					</tr>
					<tr>
						<td><label for="">是否獲得資訊:</label></td>
						<td><input type="radio" name="form.get_info" value="true">是
							<input type="radio" name="form.get_info" value="false">否</td>
					</tr>
					<tr>
						<td><label for="">生日:</label></td>
						<td><input type="date" name="form.birth" value=""
							required="required" style="height:30px;"></td>
					</tr>
					<tr>
						<td><label for="">照片:</label></td>
						<td><input type="file" name="form.headshot" value=""></td>
					</tr>
					<tr>
						<td><input type="submit" value="送出"></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>

</body>
</html>