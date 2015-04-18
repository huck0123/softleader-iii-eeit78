<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<s:form action="productAction" namespace="/product" method="post">


		<table>
			<tr>
				<td>活動名稱：</td>
				<td><input type="text" name="campaignForm.name"
					value="${param.name}"></td>
				<td><span class="error">${errors.id}</span></td>
			</tr>
			<tr>
				<td>活動圖片：</td>
				<td><input type="text" name="campaignForm.image"
					value="${param.image}"></td>
				<td><span class="error">${errors.id}</span></td>
			</tr>
			<tr>
				<td>目標金額：</td>
				<td><input type="text" name="campaignForm.goal"
					value="${param.goal}"></td>
				<td><span class="error">${errors.id}</span></td>
			</tr>

			<tr>
				<td>開始日期 :</td>
				<td><input type="text" name="campaignForm.startDate"
					value="${param.startDate}"></td>
				<td><span class="error">${errors.price}</span></td>
			</tr>
			<tr>
				<td>結束日期 :</td>
				<td><input type="text" name="productBean.endDate"
					value="${param.endDate}"></td>
				<td><span class="error">${errors.make}</span></td>
			</tr>
			<tr>
				<td>類型 :</td>
				<td><input type="text" name="productBean.type"
					value="${param.type}"></td>
				<td><span class="error">${errors.expire}</span></td>
			</tr>
			<tr>
				<td>影片連結:</td>
				<td><input type="text" name="productBean.vedioUrl"
					value="${param.vedioUrl}"></td>
				<td><span class="error">${errors.expire}</span></td>
			</tr>
			<tr>
				<td>地區 :</td>
				<td><input type="text" name="productBean.location"
					value="${param.location}"></td>
				<td><span class="error">${errors.expire}</span></td>
			</tr>
			<tr>
				<td>活動詳情:</td>
				<td><textarea name="productBean.detail">${param.detail}</textarea></td>
				<td><span class="error">${errors.expire}</span></td>
			</tr>
			<tr>
				<td><s:submit value="送出" method="insert" /></td>
			</tr>


		</table>

	</s:form>














</body>
</html>