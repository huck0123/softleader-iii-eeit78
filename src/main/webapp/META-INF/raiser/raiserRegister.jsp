<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/softleader-iii-eeit78/css/giver.css">
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>
<script src="/softleader-iii-eeit78/js/useful.js"></script>
<style>
.errorClassForRaiser {
	color: red
}

label {
	line-height: 30px;
}

.code {
	background-image: url(/softleader-iii-eeit78/pictures/code.jpg);
	font-family: Arial;
	font-style: italic;
	color: Red;
	border: 0;
	padding: 2px 3px;
	letter-spacing: 3px;
	font-weight: bolder;
	cursor: pointer;
	text-align: center;
}

label>b {
	color: red;
	font-size: 150%;
}

#dropZone img {
	margin-top: 20px;
	max-width: 100%;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公益團體註冊頁面</title>
</head>
<body id="body">
	<jsp:include page="../../header.jsp" />

	<div class="container"
		style="background-color: #f2f2f2; margin-top: 20px;">
		<div class="row" style="text-align: center; color: darkslategray;">
			<h1 style="margin-top: 30px; font-weight: bolder;">公益團體註冊</h1>
			<p
				style="font-size: 20px; margin-top: 16px; font-weight: bolder; margin-bottom: 46px;">立即註冊，讓愛心多一個管道傳遞</p>
		</div>

	</div>


	<div class="container"
		style="background-color: #f2f2f2; margin-top: 20px; padding-bottom: 20px; margin-top: 20px; margin-bottom: 20px;">
		<div class="row">

			<div class="col-md-4">
				<button id="specButtonForRaiserRegister" style="margin-top: 46px;">DEMO</button>
			</div>
			<div class="col-md-4">

				<div style="padding-top: 36px; text-align: left;">
					<form action="<c:url value='/raiser/raiserAction!insert' />"
						method="post" enctype="multipart/form-data">


						<div class="form-group">

							<label for="account">帳號 : <b>*</b></label> <input type="text"
								class="form-control" id="account" name="raiserForm.account"
								value="${form.account }" placeholder="請輸入帳號，須為英文開頭，不限大小寫"
								required="required" autofocus="autofocus">


							<div id="chkAcc" class="errorClassForRaiser">${insertErrorACC}</div>
						</div>

						<div class="form-group">

							<label for="inputpw">密碼 : <b>*</b></label> <input type="password"
								class="form-control" id="inputpw"
								placeholder="請輸入密碼，須為英數混合且為6-30字" name="raiserForm.passwd"
								required="required">



							<div id="chkPw1" class="errorClassForRaiser">${insertErrorPSW}</div>
						</div>

						<div class="form-group">

							<label for="inputpw">確認密碼 : <b>*</b></label>
							<div>
								<input type="password" class="form-control" id="inputpw2"
									placeholder="再輸入一次密碼" required="required">
							</div>
							<div id="chkPw2" class="errorClassForRaiser"></div>
						</div>

						<div class="form-group">

							<label for="name">團體名稱 : <b>*</b></label>
							<div>
								<input type="text" class="form-control" id="name"
									name="raiserForm.name" value="${form.name}"
									placeholder="請注意,同一團體不可重複註冊!!" required="required">
							</div>
							<div id="chkName" class="errorClassForRaiser">${insertErrorNAME}</div>
						</div>

						<div class="form-group">

							<label for="tel">電話 : <b>*</b></label>
							<div>
								<input type="text" class="form-control" id="tel"
									name="raiserForm.tel" value="${form.tel}"
									placeholder="註冊成功後將進行電話認證，格式為(02)1234-5677" required="required">
							</div>
							<div id="chkTel1" class="errorClassForRaiser">${insertErrorTEL1}</div>
						</div>

						<div class="form-group">

							<label for="cname">連絡人姓名 : <b>*</b></label>
							<div>
								<input type="text" class="form-control" id="cname"
									placeholder="請輸入連絡人姓名,稍後將進行電話認證"
									name="raiserForm.contactPerson" value="${form.contactPerson}"
									required="required">
							</div>
							<div id="chkCname" class="errorClassForRaiser"></div>
						</div>

						<div class="form-group">

							<label for="ctel">連絡人電話 : <b>*</b></label>
							<div>
								<input type="tel" class="form-control" id="ctel"
									name="raiserForm.contactTel" value="${form.contactTel}"
									placeholder=註冊成功後將進行認證，格式為(02)1234-5677或手機
									" required="required">

							</div>
							<div id="chkTel2" class="errorClassForRaiser">${insertErrorTEL2}</div>

						</div>

						<div class="form-group">

							<label for="mail">信箱 : <b>*</b></label>
							<div>
								<input type="email" class="form-control" id="mail"
									name="raiserForm.email" value="${form.email}"
									placeholder="請輸入信箱" required="required">
							</div>
							<div id="chkMail" class="errorClassForRaiser"></div>
						</div>

						<div class="form-group">

							<label for="add">地址 : <b>*</b></label>
							<div>
								<input type="text" class="form-control" id="add"
									placeholder="請輸入團體地址" name="raiserForm.address"
									value="${form.address}" required="required">
							</div>
							<div id="chkAdd" class="errorClassForRaiser"></div>
						</div>

						<div class="form-group">

							<label>圖標 : <b>*</b></label>
							<div>
								<input type="file" name="raiserForm.logo" id="logo"
									accept="image/*">
								<div id="dropZone"></div>
								<div id="chkimgg" class="errorClassForRaiser"></div>
								<!-- 								<div id="dropZone" ondragover="dragoverHandler(event)" -->
								<!-- 									ondrop="dropHandler(event)"> -->
								<!-- 									<img id="dragpic" -->
								<!-- 										src="/softleader-iii-eeit78/pictures/fileupdate.png"> -->
								<!-- 								</div> -->
							</div>
						</div>

						<div class="form-group">
							<label for="del">團體介紹 :</label>
							<div>
								<textarea rows="10" cols="50" class="form-control" id="del"
									name="raiserForm.detail">${form.detail}</textarea>
							</div>
						</div>

						<div class="form-group">
							<label for="vdl">團體短片 :</label>
							<div>
								<input type="url" class="form-control" id="vdl"
									placeholder="請輸入嵌入影片網址" name="raiserForm.videoUrl"
									value="${form.videoUrl}">
								<iframe src="" id="vdlPre"
									style="display: none; width: 470px; height: 400px"></iframe>
							</div>
						</div>

						<div class="form-group">
							<div style="margin-bottom: 10px">
								<input type="text" readonly="readonly" id="checkCode"
									class="code form-control" />
							</div>

							<label for="vdl">驗證碼 : <b>*</b></label>

							<div>
								<input type="text" class="form-control" id="validCode"
									placeholder="請輸入驗證碼" />
							</div>

							<div id="chkValidcode" class="errorClassForRaiser"></div>
						</div>
						<button type="submit" id="submitForRaiserRegister"
							class="btn btn-default">確定送出</button>
						<!-- disabled="disabled" -->
						<button type="reset" class="btn btn-default">清除資料</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		raiserRegisCheckUrl1 = "${pageContext.request.contextPath}/raiser/raiserSelectForOne!select";
		raiserRegisCheckUrl2 = "${pageContext.request.contextPath}/raiser/raiserSelectForOne!checkName";
		var giverurl = "${pageContext.request.contextPath}/giver/giverSelect!selectAccount";

		$("#account").blur(accountB);

		function accountB() {
			$("#chkAcc").text("");
			if ($(this).val().length == 0) {
				$("#chkAcc").text("請輸入帳號");
			}
		}

		$("#account").change(accountC);

		function accountC() {
			var raiserACCChk = "^[a-zA-Z][a-zA-Z0-9]*$";
			$("#chkAcc").text("");

			if ($(this).val().length == 0) {
				$("#chkAcc").text("請輸入帳號");
			}

			if (!$(this).val().match(raiserACCChk)) {
				$("#chkAcc").text("帳號不符合格式");
			}

			if ($(this).val().toUpperCase() == "ADMIN") {
				$("#chkAcc").text("帳號已存在");
			}

			$.post(raiserRegisCheckUrl1, {
				"account" : $(this).val()
			}, function(data) {
				if (data != null) {
					$("#chkAcc").text("帳號已存在");
				}
			}, "json");

			$.post(giverurl, {
				'form.account' : $(this).val()
			}, function(data) {
				data = JSON.parse(data);
				if (data.checkAccount == true) {
					$("#chkAcc").text("帳號已存在");
				}
			});

		}

		$("#inputpw").blur(inputpwB);

		function inputpwB() {
			$("#chkPw1").text("")

			if ($(this).val().length == 0) {
				$("#chkPw1").text("請輸入密碼")
			} else {
				raiserPSWCk = /^(?=.*[a-zA-Z])(?=.*\d).{6,30}$/
				if (!raiserPSWCk.test($(this).val())) {
					$("#chkPw1").text("密碼不符合格式")
				}
			}

		}

		$("#inputpw2").blur(inputpw2B);

		function inputpw2B() {
			$("#chkPw2").text("")

			if ($(this).val().length == 0) {
				$("#chkPw2").text("請輸入相同密碼")
			}
			if ($(this).val() != $("#inputpw").val()) {
				$("#chkPw2").text("密碼不相符")
			}
		}		
		
		$("#name").blur(nameB);

		function nameB() {
			$("#chkName").text("")

			if ($(this).val().length == 0) {
				$("#chkName").text("請輸入團體名稱")
			}
			$.post(raiserRegisCheckUrl2, {
				"name" : $(this).val()
			}, function(data) {

				if (data == 2) {
					$("#chkName").text("此團體已註冊")
				}
			}, "json");
		}

		$("#tel").blur(telB);

		function telB() {
			$("#chkTel1").text("");
			if ($(this).val().length == 0) {
				$("#chkTel1").text("請輸入正確格式的電話號碼")
			}
		}

		$("#cname").blur(cnameB);

		function cnameB() {
			$("#chkCname").text("");
			if ($(this).val().length == 0) {
				$("#chkCname").text("請輸入連絡人姓名")
			}
		}

		$("#ctel").blur(ctelB);

		function ctelB() {
			$("#chkTel2").text("");
			if ($(this).val().length == 0) {
				$("#chkTel2").text("請輸入正確格式的連絡人電話")
			}
		}

		$("#add").blur(addB);

		function addB() {
			$("#chkAdd").text("");
			if ($(this).val().length == 0) {
				$("#chkAdd").text("請輸入團體地址")
			}
		}

		$("#mail").blur(mailB);

		function mailB() {
			$("#chkMail").text("");
			if ($(this).val().length == 0) {
				$("#chkMail").text("請輸入正確格式的信箱")
			}
		}

		$("#logo").blur(logoB);

		function logoB() {
			$("#chkimgg").text("");
			var file = logo.files[0];
			if (!file) {
				$("#dropZone").empty();
				$("#chkimgg").text("請選擇圖片");
			}
		}

		$("#logo").change(logoC);

		function logoC() {
			$("#chkimgg").text("");
			var file = logo.files[0];
			if (file) {
				var reader = new FileReader();
				reader.onload = function(event) {
					$("#dropZone").empty().append(
							"<img src='" +event.target.result +  "' />");
				}
				reader.readAsDataURL(file);
			} else {
				$("#dropZone").empty();
				$("#chkimgg").text("請選擇圖片");
			}
		}

		//以下驗證碼相關
		var a;
		//產生
		createForJsp();
		function createForJsp() {
			code = createCode();
			$("#checkCode").val(code)
			$("#checkCode").click(function() {
				code = createCode();
				if ($("#checkCode")) {
					{
						$(this).val(code);
						$(this).blur();
					}
				}
			});
		}
		//驗證
		$("#validCode").blur(validCodeB);

		function validCodeB() {
			var inputCode = $("#validCode").val();
			if (inputCode.length <= 0) {
				$("#chkValidcode").text("請輸入驗證碼！");
			} else if (inputCode.toUpperCase() != code) {
				$("#chkValidcode").text("驗證碼輸入錯誤！");
				createForJsp();
			} else {
				$("#chkValidcode").text("正確");
			}
			//如果上述資料驗證都沒錯才能送出  為了demo方便先關掉
			// 					if ($("#chkValidcode").text().length == 2
			// 							&& $("#chkName").text().length <= 0
			// 							&& $("#name").val()
			// 							&& $("#chkPw2").text().length <= 0
			// 							&& $("#inputpw").val()
			// 							&& $("#chkAcc").text().length <= 0
			// 							&& $("#account").val()) {
			// 						$("#submitForRaiserRegister").removeAttr('disabled');
			// 					}
		}

		$("#vdl").blur(vdlC);

		function vdlC() {
			if ($(this).val().length != 0) {
				$("#vdlPre").show().attr("src", $(this).val());
			} else {
				$("#vdlPre").hide();
			}
		}

		$("#specButtonForRaiserRegister")
				.click(
						function() {
							$("#account").val("goh");
							$("#inputpw").val("password");
							// 							$("#inputpw2").val("password");
							$("#name").val("勵馨社會福利事業基金會");
							$("#tel").val("(02)8911-8595");
							$("#cname").val("廖俊松");
							$("#ctel").val("0912435768");
							$("#mail").val("master@goh.org.tw");
							$("#add").val("新北市新店區順安街2-1號1樓");
							$("#del")
									.text(
											"勵馨本著基督精神，以追求公義與愛的決心和勇氣，預防及消弭性侵害、性剝削及家庭暴力對婦女與兒少的傷害，並致力於社會改造，創造對婦女及兒少的友善環境。");
							$("#vdl")
									.val(
											"https://www.youtube.com/embed/-Yl9xUmtZec");
							$("#validCode").val($("#checkCode").val());

							accountB();
							inputpwB();
							nameB();
							telB();
							addB();
							cnameB();
							ctelB();
							mailB();
						});
		//test

		// 		function dragoverHandler(e) {
		// 			e.preventDefault();
		// 			$("#dragpic").css("opacity", 0.6);
		// 		}

		// 		function dropHandler(e) {
		// 			e.preventDefault();
		// 			e.stopPropagation();
		// 			var theFiles = e.dataTransfer.files;
		// 			for (var i = 0; i < theFiles.length; i++) {
		// 				var reader = new FileReader();
		// 				reader.readAsDataURL(theFiles[i]);
		// 				reader.onload = function(e) { //callback
		// 					var fileContent = e.target.result;
		// 					$("#dropZone").empty().append(
		// 							"<img src='" +fileContent +  "' />");
		// 				}
		// 			}

		// 		}
	</script>
	<jsp:include page="../../footer.jsp" />
</body>
</html>