<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>捐贈者註冊頁面</title>

</head>
<body>
	<fieldset>
		<legend>填入表單:</legend>

		<form action='<c:url value="/giver/giverAction!insert.action"/>' method="post">
		<table>
			<tr>
				<td><label for="">帳號:</label></td>
				<td><input type="text" name="form.account" value="" required="required"></td>
			</tr>
			<tr>
				<td><label for="">密碼:</label></td>
				<td><input type="password" name="form.passwd" value="" required="required"></td>
			</tr>
			<tr>
				<td><label for="">姓:</label></td>
				<td><input type="text" name="form.familyName" value=""></td>
			</tr>
			<tr>
				<td><label for="">名字:</label></td>
				<td><input type="text" name="form.name" value=""></td>
			</tr>
			<tr>
				<td><label for="">性別:</label></td>
				<td><input type="radio" name="form.gender" value="true">男
					<input type="radio" name="form.gender" value="false">女</td>
			</tr>
			<tr>
				<td><label for="">身分證字號:</label></td>
				<td><input type="text" name="form.id_number" value=""></td>
			</tr>
			<tr>
				<td><label for="">手機:</label></td>
				<td><input type="text" name="form.tel" value=""></td>
			</tr>
			<tr>
				<td><label for="">住址:</label></td>
				<td><input type="text" name="form.address" value=""></td>
			</tr>
			<tr>
				<td><label for="">Email:</label></td>
				<td><input type="email" name="form.email" value=""></td>
			</tr>
			<tr>
				<td><label for="">是否獲得資訊:</label></td>
				<td><input type="radio" name="form.get_info" value="true">是
					<input type="radio" name="form.get_info" value="false">否</td>
			</tr>
			<tr>
				<td><label for="">生日:</label></td>
				<td><input type="date" name="form.birth" value="" required="required"></td>
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
		
	</fieldset>
</body>
</html>