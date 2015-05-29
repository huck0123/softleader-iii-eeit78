<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>
<script src="/softleader-iii-eeit78/js/useful.js"></script>
<style>
body {
	text-align: left;
}

.errorClassForRaiser {
	color: red
}
.tab-content {
	border-bottom: 1px solid silver;
	border-left: 1px solid silver;
	border-right: 1px solid silver;
	margin-bottom: 20px;
	padding-right: 28px;
	padding-left: 28px;
}
</style>
<title>團體-更新帳號</title>
</head>
<body id="body">
	<jsp:include page="../../header.jsp" />
	
				<div class="container" style="background-color: #f2f2f2; margin-top: 20px; margin-bottom: 20px;">
			<div class="row" style="text-align:center; color:darkslategrey;">
				<h1 style="margin-top: 30px; font-weight: bolder;">團體專區</h1>
				<p style="font-size: 20px; margin-top: 16px; font-weight: bolder; margin-bottom: 46px;">世界因您的付出變得美好</p>
			</div>
	</div>
	
	<div class="container">

		<div class="row">

			<div>
				<ul class="nav nav-tabs" role="tablist">
					<li><a href="#raiserUpdate">修改團體資訊</a></li>
					<li><a href="#raiserHistory">查看活動紀錄</a></li>
					<li><a href="#campaignRaise">發起活動</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade" id="raiserUpdate">
						<div class="row">
							<div class="col-md-4">
							<div style="padding-top: 36px; text-align: center">
								<img src='' class='img-thumbnail' id='logo'
									style='width: 200px; height: 200px'>
								<div class="errorClassForRaiser" id="updateRaiserMSG">${updateRaiserMSG}</div>
								</div>
							</div>
							<div class="col-md-6" style="padding-top: 36px; text-align: left;">
								<form
									action="<c:url value='/raiser/raiserUpdate!update.action' />"
									method="post" enctype="multipart/form-data">

										<input type="text" style="display: none" class="form-control"
											id="inputid" name="raiserForm.id" value="${raiser.id}">


									<div class="form-group">
										<label for="account">帳號</label> <input type="text"
											value="${raiser.account}" class="form-control"
											disabled="disabled"> <input type="text"
											style="display: none" class="form-control" id="account"
											name="raiserForm.account" value="${raiser.account}">
									</div>

									<div class="form-group">
										<label for="inputpwOld">舊密碼</label> <input type="password"
											class="form-control" id="inputpwOld" required="required"
											autofocus="autofocus">
										<div class="errorClassForRaiser" id="updateErrorPSWOld"></div>
									</div>

									<div class="form-group">
										<label for="inputpw">密碼</label> <input type="password"
											class="form-control" id="inputpw" name="raiserForm.passwd"
											required="required" disabled="disabled">
										<div class="errorClassForRaiser">${updateErrorPSW}</div>
										<div id="chkPw1" class="errorClassForRaiser"></div>
									</div>

									<div class="form-group">
										<label for="inputpwChk">確認密碼</label> <input type="password"
											class="form-control" id="inputpwChk" required="required"
											disabled="disabled">
										<div id="chkPw2" class="errorClassForRaiser"></div>
									</div>

									<div class="form-group">
										<label for="name">團體名稱</label> <input type="text"
											class="form-control" id="name" name="raiserForm.name"
											required="required" value="${raiser.name}">
										<div id="chkName" class="errorClassForRaiser">${updateErrorNAME}</div>
									</div>

									<div class="form-group">
										<label for="tel">電話</label> <input type="text"
											class="form-control" id="tel" name="raiserForm.tel"
											value="${raiser.tel}">
										<div class="errorClassForRaiser">${updateErrorTEL1}</div>
									</div>

									<div class="form-group">
										<label for="cname">連絡人姓名</label> <input type="text"
											class="form-control" id="cname"
											name="raiserForm.contactPerson"
											value="${raiser.contactPerson}">
									</div>

									<div class="form-group">
										<label for="ctel">連絡人電話</label> <input type="tel"
											class="form-control" id="ctel" name="raiserForm.contactTel"
											value="${raiser.contactTel}">
										<div class="errorClassForRaiser">${updateErrorTEL2}</div>
									</div>

									<div class="form-group">
										<label for="mail">信箱</label> <input type="email"
											class="form-control" id="mail" name="raiserForm.email"
											value="${raiser.email}">
									</div>

									<div class="form-group">
										<label for="add">地址</label> <input type="text"
											class="form-control" id="add" name="raiserForm.address"
											value="${raiser.address}">
									</div>

									<div class="form-group">
										<label>圖標</label>
										<div>
											<input type="file" class="form-control"
												name="raiserForm.logo" id="logo" accept="image/*"
												onchange="changePic(this)">
										</div>
										<div id="chkLogo"></div>
									</div>

									<div class="form-group">
										<label for="del">團體介紹</label>
										<textarea rows="10" cols="50" class="form-control" id="del"
											name="raiserForm.detail">${raiser.detail}</textarea>
									</div>

									<div class="form-group">
										<label for="vdl">團體短片</label> <input type="url"
											class="form-control" id="vdl" name="raiserForm.videoUrl"
											value="${raiser.videoUrl}">
									</div>
									<div class="embed-responsive embed-responsive-16by9" style="margin-bottom: 20px">
									<iframe src="${raiser.videoUrl}" id="vdlPre"></iframe>
									</div>
									<button type="submit" class="btn btn-default">確定送出</button>
								</form>
							</div>
						</div>
					</div>
					<jsp:include page="raiserHistory.jsp" />
					<jsp:include page="/META-INF/campaign/campaignRaise.jsp" />
				</div>

			</div>
		</div>
	</div>
	<script>
		var urlRaiserUpdate = "/softleader-iii-eeit78/raiser/raiserSelectForOne!select";
		$.post(urlRaiserUpdate, {
			"account" : "${raiser.account}"
		}, getdata, "json");

		function getdata(raiser) {
			$("updateRaiserMSG").text("");
			var str = arrayBufferToBase64(raiser.logo);
			$('#logo').attr("src", "data:image/png;base64," + str);
		}

		$(".nav-tabs a").click(function() {
			$(this).tab('show');
		});

		$(document).ready(function() {
			if ("${param.raiserTabs}" == 1) {
				$('.nav-tabs a[href="#raiserUpdate"]').tab('show');
			} else if ("${param.raiserTabs}" == 2) {
				$('.nav-tabs a[href="#raiserHistory"]').tab('show');
			} else if ("${param.raiserTabs}" == 3) {
				$('.nav-tabs a[href="#campaignRaise"]').tab('show');
			}
		});

		var urlRaiserForCheckPWD = "/softleader-iii-eeit78/raiser/raiserSelectForOne!forCheckPSW";

		$("#inputpwOld").blur(function() {
			$.post(urlRaiserForCheckPWD, {
				"account" : "${raiser.account}",
				"raiserForm.passwd" : $("#inputpwOld").val()
			}, function(checkForRaiser) {
				if (checkForRaiser == 1) {
					$("#updateErrorPSWOld").text("正確!!");
					$("#inputpw").removeAttr('disabled');
					$("#inputpwChk").removeAttr('disabled');
				} else {
					$("#updateErrorPSWOld").text("密碼錯誤請重新輸入");
				}
			});
		});

		$("#inputpw").blur(function() {
			$("#chkPw1").text("");
			raiserPSWCk = /^(?=.*[a-zA-Z])(?=.*\d).{6,30}$/
			if (!raiserPSWCk.test($(this).val())) {
				$("#chkPw1").text("密碼不符合格式")
			}
		});

		$("#inputpwChk").blur(function() {
			$("#chkPw2").text("");
			if ($(this).val() != $("#inputpw").val()) {
				$("#chkPw2").text("密碼不相符");
				$("#inputpwChk").val("");
			}
		});

		var raiserRegisCheckUrl2 = "${pageContext.request.contextPath}/raiser/raiserSelectForOne!checkName";

		$("#name").blur(function() {
			$("#chkName").text("")
			$.post(raiserRegisCheckUrl2, {
				"name" : $(this).val(),
				"account" : "${raiser.account}"
			}, function(data) {
				console.log(data)
				if (data == 2) {
					$("#chkName").text("此團體已註冊")
				}
			}, "json");
		});
		function changePic(input) {
			console.log(111)
			var file = input.files[0];
			if (file != null) {
				var reader = new FileReader();
				reader.onload = function(event) {
					$("#chkLogo")
							.append(
									"<img src='"+event.target.result
					+"' style='weight:100px; height:100px;'>");
				}
			}
			reader.readAsDataURL(input.files[0]);
		}
		
		$("#vdl").change(function(){
			$("#vdlPre").attr("src" ,$(this).val())
		})
	</script>
	<jsp:include page="../../footer.jsp" />
</body>
</html>