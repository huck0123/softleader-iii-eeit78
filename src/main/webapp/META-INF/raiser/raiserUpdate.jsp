<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>	
<script src="/softleader-iii-eeit78/js/useful.js"></script>
<title>����-��s�b��</title>
</head>
<body>
	<div class="row">
		<div class="col-md-2"><img src='' class='img-thumbnail' id='logo' style='width:200px; height:200px'></div>
		<div class="col-md-8">
			<form action="<c:url value='/raiser/raiserAction!update.action' />"
				method="post" enctype="multipart/form-data">

				<div class="form-group">
					<input type="text" style="display:none"
						class="form-control" id="inputid" name="raiserForm.id"
						value="${raiser.id}">
				</div>

				<div class="form-group">
					<label for="account">�b��</label>
					<input type="text" value="${raiser.account}" class="form-control" disabled="disabled"> 
					 <input type="text"  style="display:none"
						class="form-control" id="account" name="raiserForm.account"
						value="${raiser.account}">
				</div>

				<div class="form-group">
					<label for="inputpw">�K�X</label> <input type="password"
						class="form-control" id="inputpw" name="raiserForm.passwd"
						required="required">
				</div>

				<div class="form-group">
					<label for="name">����W��</label> <input type="text"
						class="form-control" id="name" name="raiserForm.name"
						required="required" value="${raiser.name}">
				</div>

				<div class="form-group">
					<label for="tel">�q��</label> <input type="text"
						class="form-control" id="tel" name="raiserForm.tel"
						value="${raiser.tel}">
				</div>

				<div class="form-group">
					<label for="cname">�s���H�m�W</label> <input type="text"
						class="form-control" id="cname" name="raiserForm.contactPerson"
						value="${raiser.contactPerson}">
				</div>

				<div class="form-group">
					<label for="ctel">�s���H�q��</label> <input type="tel"
						class="form-control" id="ctel" name="raiserForm.contactTel"
						value="${raiser.contactTel}">
				</div>

				<div class="form-group">
					<label for="mail">�H�c</label> <input type="email"
						class="form-control" id="mail" name="raiserForm.email"
						value="${raiser.email}">
				</div>

				<div class="form-group">
					<label for="add">�a�}</label> <input type="text" class="form-control"
						id="add" name="raiserForm.address" value="${raiser.address}">
				</div>

				<div class="form-group">
					<label>�ϼ�</label> <input type="file" class="form-control"
						name="raiserForm.logo" value="${raiser.logo}">
				</div>

				<div class="form-group">
					<label for="del">���餶��</label>
					<textarea rows="4" cols="50" class="form-control" id="del"
						name="raiserForm.detail">${raiser.detail}</textarea>
				</div>

				<div class="form-group">
					<label for="vdl">����u��</label> <input type="url"
						class="form-control" id="vdl" name="raiserForm.videoUrl"
						value="${raiser.videoUrl}">
				</div>
				<button type="submit" class="btn btn-default">�T�w�e�X</button>
				<button type="reset" class="btn btn-default">�M�����</button>
			</form>
		</div>

		<div class="col-md-2"></div>
	</div>
	<a href="<c:url value='/index.jsp' />">�^����</a>
	
	<script>
		var url = "/softleader-iii-eeit78/raiser/raiserSelectAll!select";
		$.post(url , {"account":"${raiser.account}"} , getdata , "json");
		function getdata(raiser){
			var str = arrayBufferToBase64(raiser.logo); 
			$('#logo').attr("src","data:image/png;base64," + str);
			
		}
	</script>
</body>
</html>