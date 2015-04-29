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
<title>����-���U�b��</title>
</head>
<body>
	<div class="row" >
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form action="<c:url value='/raiser/raiserAction!insert' />"
				method="post" enctype="multipart/form-data">

				<div class="form-group">
					<label for="account">�b��</label> <input type="text"
						class="form-control" id="account" name="raiserForm.account">
				</div>

				<div class="form-group">
					<label for="inputpw">�K�X</label> <input type="password"
						class="form-control" id="inputpw" name="raiserForm.passwd"
						required="required">
				</div>

				<div class="form-group">
					<label for="name">����W��</label> <input type="text"
						class="form-control" id="name" name="raiserForm.name"
						required="required">
				</div>

				<div class="form-group">
					<label for="tel">�q��</label> <input type="text"
						class="form-control" id="tel" name="raiserForm.tel">
				</div>

				<div class="form-group">
					<label for="cname">�s���H�m�W</label> <input type="text"
						class="form-control" id="cname" name="raiserForm.contactPerson">
				</div>

				<div class="form-group">
					<label for="ctel">�s���H�q��</label> <input type="tel"
						class="form-control" id="ctel" name="raiserForm.contactTel">
				</div>

				<div class="form-group">
					<label for="mail">�H�c</label> <input type="email"
						class="form-control" id="mail" name="raiserForm.email">
				</div>

				<div class="form-group">
					<label for="add">�a�}</label> <input type="text" class="form-control"
						id="add" name="raiserForm.address">
				</div>

				<div class="form-group">
					<label>�ϼ�</label> <input type="file" class="form-control"
						name="raiserForm.logo" value=>
				</div>

				<div class="form-group">
					<label for="del">���餶��</label>
					<textarea rows="4" cols="50" class="form-control" id="del"
						name="raiserForm.detail"></textarea>
				</div>

				<div class="form-group">
					<label for="vdl">����u��</label> <input type="url"
						class="form-control" id="vdl" name="raiserForm.videoUrl">
				</div>

				<button type="submit" class="btn btn-default">�T�w�e�X</button>
				<button type="reset" class="btn btn-default">�M�����</button>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
	<a href="<c:url value='/index.jsp' />"	>�^����</a>
</body>
</html>