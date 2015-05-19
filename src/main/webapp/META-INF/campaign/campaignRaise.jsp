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
	<div class="tab-pane fade" id="campaignRaise">
		<form action="/softleader-iii-eeit78/campaign/campaignAction!insert"
			method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="campaign-name-input">活動名稱：</label> <input type="text"
					class="form-control" name="campaignForm.name"
					id="campaign-name-input" placeholder="請輸入活動名稱">
			</div>

			<div class="form-group">
				<label for="campaign-image-input">活動圖片：</label> <input type="file"
					name="campaignForm.image" id="campaign-image-input" placeholder="請上傳圖片">
			</div>
			<div class="form-group">
				<label for="campaign-goal-input">目標金額：</label> <input type="text"
					class="form-control" name="campaignForm.goal"
					id="campaign-goal-input" placeholder="請輸入目標金額">
			</div>
			<div class="form-group">
				<label for="campaign-duration-input">活動天數：</label> <input
					type="text" class="form-control" name="campaignForm.duration"
					id="campaign-duration-input" placeholder="請輸入活動天數">
			</div>
			<div class="form-group">
				<label for="campaign-type-input">類型：</label> <input type="text"
					class="form-control" name="campaignForm.type"
					id="campaign-type-input" placeholder="請輸入活動類型">
			</div>
			<div class="form-group">
				<label for="campaign-location-input">地區 :</label> <input type="text"
					class="form-control" name="campaignForm.location"
					id="campaign-location-input" placeholder="請輸入活動地點">
			</div>

			<div class="form-group">
				<label for="campaign-vedioUrl-input">影片連結:</label> <input
					type="text" class="form-control" name="campaignForm.vedioUrl"
					id="campaign-vedioUrl-input" placeholder="請輸入影片連結">
			</div>
			<div class="form-group">
				<label for="campaign-detail-input">活動詳情:</label>
				<textarea id="campaign-detail-input" name="campaignForm.detail"
					class="form-control" rows="10">${param.detail}</textarea>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">送出</button>
				</div>
			</div>
		</form>
	</div>
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