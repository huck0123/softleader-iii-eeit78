<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
</head>
<body>

	<form action="/softleader-iii-eeit78/campaign/campaignAction!insert"
		method="post" enctype="multipart/form-data">


		<div class="container">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<table class="table table-hover">
						<tr style="height: 30px">
							<td>活動名稱：</td>
							<td><input type="text" name="campaignForm.name"
								value="${param.name}"></td>
							<td><span class="error">${errors.id}</span></td>
						</tr>
						<tr>
							<td><input type="file" name="campaignForm.image"
								label="活動圖片：">
							</file></td>
							<td></td>
							<td></td>
							<!-- 				<td>活動圖片：</td> -->
							<!-- 				<td><input type="file" name="campaignForm.image" /></td> -->
							<%-- 				<td><span class="error">${errors.id}</span></td> --%>
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
							<td><input type="text" name="campaignForm.endDate"
								value="${param.endDate}"></td>
							<td><span class="error">${errors.make}</span></td>
						</tr>
						<tr>
							<td>類型 :</td>
							<td><input type="text" name="campaignForm.type"
								value="${param.type}"></td>
							<td><span class="error">${errors.expire}</span></td>
						</tr>
						<tr>
							<td>影片連結:</td>
							<td><input type="text" name="campaignForm.vedioUrl"
								value="${param.vedioUrl}"></td>
							<td><span class="error">${errors.expire}</span></td>
						</tr>
						<tr>
							<td>地區 :</td>
							<td><input type="text" name="campaignForm.location"
								value="${param.location}"></td>
							<td><span class="error">${errors.expire}</span></td>
						</tr>
						<tr>
							<td>活動詳情:</td>
							<td><textarea name="campaignForm.detail">${param.detail}</textarea></td>
							<td><span class="error">${errors.expire}</span></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" value="送出" /></td>
							<td><button type="button" id="btn1" name="填上資料" />Fill</td>
						</tr>

					</table>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</form>

</body>
<script>
	btn1.addEventListener("click", fill);

	function fill() {
		document.getElementsByName("campaignForm.name")[0].value = "testName";
		document.getElementsByName("campaignForm.goal")[0].value = "90000"
		document.getElementsByName("campaignForm.startDate")[0].value = "2014-02-06"
		document.getElementsByName("campaignForm.endDate")[0].value = "2014-09-06"
		document.getElementsByName("campaignForm.type")[0].value = "testType";
		document.getElementsByName("campaignForm.location")[0].value = "testLocation";
		document.getElementsByName("campaignForm.vedioUrl")[0].value = "testVedioUrl";
		document.getElementsByName("campaignForm.location")[0].value = "testlocation";
		document.getElementsByName("campaignForm.detail")[0].innerHtml = "testDetail";

	}
</script>


</html>