<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta http-equiv="Refresh" content="3; URL=/softleader-iii-eeit78/index.jsp"> -->
<title>${success }成功</title>

<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/softleader-iii-eeit78/css/giver.css">
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>
<script src="/softleader-iii-eeit78/js/giver.js"></script>
<script src="/softleader-iii-eeit78/js/useful.js"></script>

<style>
.modal {
	position: fixed;
	top: 100px;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 1050;
	display: none;
	overflow: hidden;
	-webkit-overflow-scrolling: touch;
	outline: 0;
}

.separate {
	border-bottom: 1px solid silver;
	margin-top:10px;
}
p {margin-bottom: 0px}
</style>
</head>
<body id="body">

	<jsp:include page="../../header.jsp" />

	<div class="container"
		style="background-color: #f2f2f2; margin-top: 20px;">
		<div class="row"
			style="text-align: center; color: gray; padding-left: 20px;">
			<h1 style="margin-top: 30px; font-weight: bolder;">${success}成功</h1>
			<p
				style="font-size: 20px; margin-top: 16px; font-weight: bolder; margin-bottom: 46px;"></p>
		</div>
	</div>


	<div class="container" style="border: 1px silver solid; margin: 20px auto; padding-bottom: 20px">
		<div class="row">
			<div class="col-md-4">
			<div style="padding-top:36px; margin-top: 10px">
				<a href="#" data-toggle="modal" data-target="#myModal" title="點擊放大">
					<img src="" class="img-thumbnail" id="img"
					style="width: 100px; height: 100px">
				</a></div>
			</div>

			<div class="col-md-4">
				<!-- 			<div class="thumbnail"> -->
				<div style="padding-top: 36px; text-align: left;">


					<div class="separate">
						<label>帳號:</label>
						<p>${sessionScope.giver.account }</p>
					</div>
					<div class="separate">
						<label>密碼:</label>
						<p>**********</p>
					</div>

					<div class="separate">
						<label>姓名:</label>
						<p id="name"></p>
					</div>

					<div class="separate">
						<label for="">性別:</label>
						<p id="gender"></p>
					</div>

					<div class="separate">
						<label for="">身分證字號:</label>
						<p>${sessionScope.giver.idNumber }</p>
					</div>
					<div class="separate">
						<label for="">手機號碼:</label>
						<p id="phone"></p>
					</div>
					<div class="separate">
						<label for="">住址:</label>
						<p id="address"></p>
					</div>
					<div class="separate">
						<label for="">Email:</label>
						<p id="email"></p>
					</div>



					<div class="separate">
						<label for="">獲得通知：</label>
						<p id="getInfo"></p>


					</div>
					<div class="separate">
						<label for="">生日:</label>
						<p>
							<span></span>
						</p>
					</div>






				</div>
			</div>
		</div>


	</div>

	<jsp:include page="/footer.jsp" />

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-body">
					<img src="" id="img1" style="weight: 400px; height: 400px;">
				</div>
			</div>
		</div>
	</div>

	<script>
		//判斷是否為null
		function undefinedCheck(data) {
			if (data == undefined) {
				data = null;
				return data;
			} else {
				return data;
			}
		};

		function getInformation() {

			var url = "/softleader-iii-eeit78/giver/giverSelectByAccount!select";
			var thisAccount = "${sessionScope.giver.account}";

			function getData(data) {
				data = JSON.parse(data);

				$('#name').text(data.familyName + data.name);
				$('#phone').text(data.tel);
				$('#address').text(data.address);
				$('#email').text(data.email);
				$('#gender').text(gender(data.gender));
				$('#getInfo').text(getInfo(data.getInfo));

				var date = data.birth;
				var d = new Date(date);
				var birth = d.getFullYear() + "/" + (d.getMonth() + 1) + "/"
						+ d.getDate();
				$('span').text(birth);

				if (undefinedCheck(data.headshot) == null) {
					$('#img').attr("src", "../pictures/headshot.jpg");
					$('#img1').attr("src", "../pictures/headshot.jpg");
				} else {
					var str = arrayBufferToBase64(data.headshot);
					$('#img').attr("src", "data:image/png;base64," + str);
					$('#img1').attr("src", "data:image/png;base64," + str);
				}
			}
			$.post(url, {
				'thisAccount' : thisAccount
			}, getData);

		}
		getInformation();
	</script>

</body>
</html>