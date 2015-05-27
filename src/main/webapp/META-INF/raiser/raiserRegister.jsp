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
label>b{
	color: red;
	font-size: 150%;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>����-���U�b��</title>
</head>
<body id="body">
	<jsp:include page="../../header.jsp" />

		<div class="container" style="background-color: #f2f2f2; margin-top: 20px;">
			<div class="row" style="text-align:center; color:grey;">
				<h1 style="margin-top: 30px; font-weight: bolder;">���q������U</h1>
				<p style="font-size: 20px; margin-top: 16px; font-weight: bolder; margin-bottom: 46px;">�ߧY���U�A���R�ߦh�@�Ӻ޹D�ǻ�</p>
			</div>
	</div>


	<div class="container" style="background-color:#f2f2f2; margin-top: 20px; padding-bottom: 20px; margin-top:20px; margin-bottom: 20px;">
		<div class="row" >
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div style="padding-top: 36px; text-align: left;">
					<form action="<c:url value='/raiser/raiserAction!insert' />"
						method="post" enctype="multipart/form-data">
	
						<div class="form-group">
							<label for="account">�b�� : <b>*</b></label> <input type="text"
								class="form-control" id="account" name="raiserForm.account"
								value="${form.account }" placeholder="�п�J�b���A�����^��}�Y�A�����j�p�g" required="required" autofocus="autofocus">

							<div id="chkAcc" class="errorClassForRaiser">${insertErrorACC}</div>
						</div>

						<div class="form-group">
							<label for="inputpw">�K�X : <b>*</b></label> <input type="password"
								class="form-control" id="inputpw" placeholder="�п�J�K�X�A�����^�ƲV�X�B��6-30�r"
								name="raiserForm.passwd" required="required">

							<div class="errorClassForRaiser">${insertErrorPSW}</div>
						</div>

						<div class="form-group">
							<label for="inputpw">�T�{�K�X : <b>*</b></label>
							<div>
								<input type="password" class="form-control" id="inputpw2"
									placeholder="�A��J�@���K�X" required="required">
							</div>
							<div id="chkPw2" class="errorClassForRaiser"></div>
						</div>

						<div class="form-group">
							<label for="name">����W�� : <b>*</b></label>
							<div>
								<input type="text" class="form-control" id="name"
									name="raiserForm.name" value="${form.name}"
									placeholder="�Ъ`�N,�P�@���餣�i���Ƶ��U!!" required="required">
							</div>
							<div id="chkName" class="errorClassForRaiser">${insertErrorNAME}</div>
						</div>

						<div class="form-group">
							<label for="tel">�q�� : <b>*</b></label>
							<div>
								<input type="text" class="form-control" id="tel"
									name="raiserForm.tel" value="${form.tel}"
									placeholder="���U���\��N�i��q�ܻ{�ҡA�榡��(02)1234-5677" required="required">
							</div>
							<div id="chkTel1" class="errorClassForRaiser">${insertErrorTEL1}</div>
						</div>

						<div class="form-group">
							<label for="cname">�s���H�m�W : <b>*</b></label>
							<div>
								<input type="text" class="form-control" id="cname"
									placeholder="�п�J�s���H�m�W,�y��N�i��q�ܻ{��"
									name="raiserForm.contactPerson" value="${form.contactPerson}"
									required="required">
							</div>
						</div>

						<div class="form-group">
							<label for="ctel">�s���H�q�� : <b>*</b></label>
							<div>
								<input type="tel" class="form-control" id="ctel"
									name="raiserForm.contactTel" value="${form.contactTel}"
									placeholder=���U���\��N�i��{�ҡA�榡��(02)1234-5677�Τ��" required="required">
							</div>
								<div id="chkTel2" class="errorClassForRaiser">${insertErrorTEL2}</div>
						</div>

						<div class="form-group">
							<label for="mail">�H�c : <b>*</b></label>
							<div>
								<input type="email" class="form-control" id="mail"
									name="raiserForm.email" value="${form.email}"
									placeholder="�п�J�H�c" required="required">
							</div>
						</div>

						<div class="form-group">
							<label for="add">�a�} : <b>*</b></label>
							<div>
								<input type="text" class="form-control" id="add"
									placeholder="�п�J����a�}" name="raiserForm.address"
									value="${form.address}" required="required">
							</div>
						</div>

						<div class="form-group">
							<label>�ϼ� : <b>*</b></label>
							<div>
								<input type="file" name="raiserForm.logo" id="logo"
									required="required" accept="image/<b>*</b>">
							</div>
							<div id="chkLogo"></div>
						</div>

						<div class="form-group">
							<label for="del">���餶�� :</label>
							<div>
								<textarea rows="10" cols="50" class="form-control" id="del"
									name="raiserForm.detail">${form.detail}</textarea>
							</div>
						</div>

						<div class="form-group">
							<label for="vdl">����u�� :</label>
							<div>
								<input type="url" class="form-control" id="vdl"
									placeholder="�п�J�O�J�v�����}" name="raiserForm.videoUrl"
									value="${form.videoUrl}">
							</div>
						</div>

						<div class="form-group">
							<div style="margin-bottom: 10px">
								<input type="text" readonly="readonly" id="checkCode"
									class="code form-control" />
							</div>
							<label for="vdl">���ҽX : <b>*</b></label>

							<div>
								<input type="text" class="form-control" id="validCode"
									placeholder="�п�J���ҽX" />
							</div>

							<div id="chkValidcode" class="errorClassForRaiser"></div>
						</div>





					</form>
											<button type="submit" id="submitForRaiserRegister"
							class="btn btn-default" disabled="disabled">�T�w�e�X</button>
						<button type="reset" class="btn btn-default">�M�����</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		raiserRegisCheckUrl1 = "${pageContext.request.contextPath}/raiser/raiserSelectForOne!select";
		raiserRegisCheckUrl2 = "${pageContext.request.contextPath}/raiser/raiserSelectForOne!checkName";
		var giverurl = "${pageContext.request.contextPath}/giver/giverSelect!selectAccount";
		$("#account").change(function() {
			var raiserACCChk = "^[a-zA-Z][a-zA-Z0-9]*$";
			$("#chkAcc").text("");
			if($(this).val().length == 0){
				$("#chkAcc").text("�п�J�b��")
			}
			if (!$(this).val().match(raiserACCChk)) {
				$("#chkAcc").text("�b�����ŦX�榡")
			}
				
			if ($(this).val().toUpperCase() == "ADMIN") {
				$("#chkAcc").text("�b���w�s�b");
			}

			$.post(raiserRegisCheckUrl1, {
				"account" : $(this).val()
			}, function(data) {
				if (data != null) {
					$("#chkAcc").text("�b���w�s�b");
				}
			}, "json");

			$.post(giverurl, {
				'form.account' : $(this).val()
			}, function(data) {
				data = JSON.parse(data);
				if (data.checkAccount == true) {
					$("#chkAcc").text("�b���w�s�b");
				}
			});
		});

		$("#inputpw").blur(function() {
			$("#chkPw1").text("")
			if($(this).val().length == 0){
				$("#chkAcc").text("�п�J�K�X")
			}
			var raiserPSWCk = "^.[A-Za-z0-9]{6,30}"
			if (!$(this).val().match(raiserPSWCk)) {
				$("#chkPw1").text("�K�X���ŦX�榡")
			}
		});
		
		$("#inputpw2").blur(function() {
			$("#chkPw2").text("")
			if($(this).val().length == 0){
				$("#chkAcc").text("�п�J�ۦP�K�X")
			}
			if ($(this).val() != $("#inputpw").val()) {
				$("#chkPw2").text("�K�X���۲�")
			}
		});

		$("#name").blur(function() {
			$("#chkName").text("")
			if($(this).val().length == 0){
				$("#chkAcc").text("�п�J����W��")
			}
			$.post(raiserRegisCheckUrl2, {
				"name" : $(this).val()
			}, function(data) {
				if (data != null) {
					$("#chkName").text("������w���U")
				}
			}, "json");
		});

		
		
		$("#logo")
				.change(
						function() {
							var file = logo.files[0];
							if (file) {
								var reader = new FileReader();
								reader.onload = function(event) {
									$("#chkLogo")
											.append(
													"<img src='"+event.target.result
							+"' style='weight:50px; height:50px;'>");
								}
							}
							reader.readAsDataURL(file);
						});

		//�H�U���ҽX����
		//����
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
		//����
		$("#validCode").blur(
				function() {
					var inputCode = $("#validCode").val();
					if (inputCode.length <= 0) {
						$("#chkValidcode").text("�п�J���ҽX�I");
					} else if (inputCode.toUpperCase() != code) {
						$("#chkValidcode").text("���ҽX��J���~�I");
						createForJsp();
					} else {
						$("#chkValidcode").text("���T");
					}
					//�p�G�W�z������ҳ��S���~��e�X
					if ($("#chkValidcode").text().length == 2
							&& $("#chkName").text().length <= 0
							&& $("#name").val()
							&& $("#chkPw2").text().length <= 0
							&& $("#inputpw").val()
							&& $("#chkAcc").text().length <= 0
							&& $("#account").val()) {
						$("#submitForRaiserRegister").removeAttr('disabled');
					}
				});
	</script>
	<jsp:include page="../../footer.jsp" />
</body>
</html>