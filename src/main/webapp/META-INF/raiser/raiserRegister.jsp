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
<title>����-���U�b��</title>
</head>
<body>

	<div class="row" style="padding-top: 20px">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form action="<c:url value='/raiser/raiserAction!insert' />"
				method="post" enctype="multipart/form-data" class="form-horizontal">

				<div class="form-group">
					<label for="account"  class="col-sm-2 control-label">�b��:</label>
					<div class="col-sm-10"> 
						<input type="text" class="form-control" id="account" name="raiserForm.account">
					</div>
				</div>

				<div class="form-group">
					<label for="inputpw" class="col-sm-2 control-label">�K�X:</label> 
					<div class="col-sm-10"> 
						<input type="password" class="form-control" id="inputpw" name="raiserForm.passwd"
							required="required">
					</div>
				</div>

				<div class="form-group">
					<label for="name" class="col-sm-2 control-label">����W��:</label> 
					<div class="col-sm-10"> 
						<input type="text" class="form-control" id="name" name="raiserForm.name"	required="required">
					</div>
				</div>

				<div class="form-group">
					<label for="tel" class="col-sm-2 control-label">�q��:</label> 
					<div class="col-sm-10"> 
						<input type="text" class="form-control" id="tel" name="raiserForm.tel">
					</div>
				</div>

				<div class="form-group">
					<label for="cname" class="col-sm-2 control-label">�s���H�m�W:</label> 
					<div class="col-sm-10"> 
						<input type="text" class="form-control" id="cname" name="raiserForm.contactPerson">
					</div>
				</div>

				<div class="form-group">
					<label for="ctel" class="col-sm-2 control-label">�s���H�q��:</label>
					<div class="col-sm-10">  
						<input type="tel" class="form-control" id="ctel" name="raiserForm.contactTel">
					</div>
				</div>

				<div class="form-group">
					<label for="mail" class="col-sm-2 control-label">�H�c:</label>
					<div class="col-sm-10">   
						<input type="email" class="form-control" id="mail" name="raiserForm.email">
					</div>
				</div>

				<div class="form-group">
					<label for="add" class="col-sm-2 control-label">�a�}:</label> 
					<div class="col-sm-10">   
						<input type="text" class="form-control" id="add" name="raiserForm.address">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">�ϼ�:</label> 
					<div class="col-sm-10">  
						<input type="file" name="raiserForm.logo" value=>
					</div>
				</div>

				<div class="form-group">
					<label for="del" class="col-sm-2 control-label">���餶��:</label>
					<div class="col-sm-10">  
						<textarea rows="4" cols="50" class="form-control" id="del"
							name="raiserForm.detail"></textarea>
					</div>	
				</div>

				<div class="form-group">
					<label for="vdl" class="col-sm-2 control-label">����u��:</label>
					<div class="col-sm-10">  
						<input type="url"  class="form-control"  id="vdl" name="raiserForm.videoUrl">
					</div>
				</div>
				
				<div class="row" style="padding-top: 20px">
					<div class="col-md-4"></div>
					<div class="col-md-4">
						<button type="submit" class="btn btn-default">�T�w�e�X</button>
						<button type="reset" class="btn btn-default">�M�����</button>
					</div>
					<div class="col-md-4">
						<a href="<c:url value='/index.jsp' />"	>�^����</a>
					</div>
				</div>
				
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</body>
</html>