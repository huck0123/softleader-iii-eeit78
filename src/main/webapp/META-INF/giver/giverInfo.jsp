<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>捐贈者資訊修改</title>

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
<!-- <script type="text/javascript" src="/softleader-iii-eeit78/js/giver.js " charset="UTF-8"></script> -->

<style>
b {
	color: red;
}

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

#giverHistory {
	padding-top: 15px;
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

</head>

<body id="body">

	<jsp:include page="../../header.jsp" />

		<div class="container" style="background-color: #f2f2f2; margin-top: 20px; margin-bottom: 20px;">
			<div class="row" style="text-align:center; color:darkslategrey;">
				<h1 style="margin-top: 30px; font-weight: bolder;">會員專區</h1>
				<p style="font-size: 20px; margin-top: 16px; font-weight: bolder; margin-bottom: 46px;">世界因您的付出變得美好</p>
			</div>
	</div>

	<div class="container">

		<div class="row">

			<ul class="nav nav-tabs" role="tablist">
				<li><a href="#giverUpdate">會員資料修改</a></li>
				<li><a href="#giverHistory">捐款紀錄</a></li>
			</ul>

			<div class="tab-content">

				<div class="panel alert tab-pane fade" id="giverUpdate">


					<div class="row">
						<div class="col-md-4">
												<div style="padding-top: 36px;">
							<a href="#" data-toggle="modal" data-target="#myModal"
								title="點擊放大"> <img src="" class="img-thumbnail" id="img1"
								style="width: 100px; height: 100px">
							</a>
						</div>
						
						</div>

						<div class="col-md-4">
							<!-- 			<div class="thumbnail"> -->
							<div style="padding-top: 36px; text-align: left;">
								<form
									action='/softleader-iii-eeit78/giver/giverUpdate!update.action'
								method="post" enctype="multipart/form-data">

									<div class="form-group">
										<label for="">帳號:<b>*</b></label> <input type="text"
											class="form-control"
											value="${sessionScope.giver.account }" disabled> <input
											type="text" name="form.account" class="form-control"
											value="${sessionScope.giver.account }" style="display: none">
									</div>
									<div class="form-group">
										<label for="">密碼:<b>*</b></label><br/>
										<button type="button" class="btn btn-default"
											data-toggle="modal" data-target="#myPasswd">修改密碼</button>
										<input type="password" name="form.passwd" value="" id="passwd"
											style="display: none">
									</div>
									<div class="form-group"></div>
									<div class="form-group">
										<label for="">姓:<b>*</b></label> <input type="text"
											class="form-control" name="form.familyName">
									</div>
									<div class="form-group">
										<label for="">名字:<b>*</b></label> <input type="text"
											class="form-control" name="form.name">
									</div>

									<label for="">性別:<b>*</b></label>
									<p id="gender"></p>

									<div class="form-group">
										<label for="">身分證字號:<b>*</b></label> <input type="text"
											class="form-control" name="form.id_number"
											value="${sessionScope.giver.idNumber}" disabled> <b id="idNumber"></b>
									</div>
									<div class="form-group">
										<label for="">手機:<b>*</b></label> <input type="text"
											class="form-control" name="form.tel"> <b id="tel"></b>
									</div>
									<div class="form-group">
										<label for="">住址:</label> <input type="text"
											class="form-control" name="form.address">
									</div>
									<div class="form-group">
										<label for="">Email:<b>*</b></label> <input type="email"
											class="form-control" name="form.email">
									</div>

									<label for="">是否獲得資訊:</label>

									<div class="form-group">

											<label class="btn btn-default"> <input type="radio"
												name="form.get_info" value="true" id="getInfo1">是
										</label> <label class="btn btn-default"> <input type="radio"
												name="form.get_info" value="false" id="getInfo2">否
										</label>

									</div>
									<div class="form-group">
										<label for="">生日:</label> <input type="text"
											class="form-control" name="form.birth"
											style="height: 30px;" disabled>
									</div>
									<div class="form-group">
									
										<label class="btn btn-success">更換照片 <input type="file"
											name="form.headshot" accept="image/*" id="headshot"
											style="display: none;">
										</label> <a href="#" data-toggle="modal" data-target="#myModal1"
											title="點擊放大" id="changeHeadshot"> <img src="" id="img2"
											style="dispaly: none; weight: 100px; height: 100px;">
										</a>

									</div>



									<div>
										<input type="submit" class="btn btn-primary" value="送出"
											id="submit"> 
									</div>
								</form>
							</div>
						</div>
						<!-- 			</div> -->

					</div>
				</div>
				<jsp:include page="giverHistory.jsp" />

			</div>



		</div>
	</div>

	<jsp:include page="/footer.jsp" />

	<!-- myModal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-body">
					<img src="" id="img_1" style="weight: 50%; height: 50%;">
				</div>
			</div>
		</div>
	</div>

	<!-- myModal1 -->
	<div class="modal fade" id="myModal1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-body">
					<img src="" id="img_2" style="weight: 50%; height: 50%;">
				</div>
			</div>
		</div>
	</div>

	<!-- myPasswd -->
	<div class="modal fade" id="myPasswd" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h3>修改密碼</h3>
				</div>
				<div class="modal-body">
					<label for="password0">輸入舊密碼</label> <input type="password"
						id="password0" autofocus><br>
					<b id="passwdMess0"></b><br> <label for="password1">輸入新密碼</label>
					<input type="password" id="password1"><br>
					<b id="passwdMess1"></b><br> <label for="password2">確認新密碼</label>
					<input type="password" id="password2"><br>
					<b id="passwdMess2"></b>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						id="save" disabled="disabled">儲存密碼</button>
				</div>
			</div>
		</div>
	</div>
	<script>
	
		//會員資料修改 or 會員捐款資訊
		if ("${param.giverTabs}" == 1) {
			$('.nav-tabs a[href="#giverUpdate"]').tab('show');
		} else if ("${param.giverTabs}" == 2) {
			$('.nav-tabs a[href="#giverHistory"]').tab('show');
		}

		//tab
		$(".nav-tabs a").click(function() {
			$(this).tab('show');
		});

		//modal
		function myModal() {
			var checkPasswd_url = "/softleader-iii-eeit78/giver/giverSelect!checkPassword";

			$('#save').on("click", function() {
				$('#passwd').val($('#password1').val());
			});
			$('#password1').prop('disabled', true);
			$('#password2').prop('disabled', true);
			$('#save').prop("disabled", true);

			$('#password0').on('blur', function() {
				password = $(this).val();
				console.log(password);
				$.post(checkPasswd_url, {
					'form.account' : '${sessionScope.giver.account}',
					'form.passwd' : password
				}, function(passwdData) {
					passwdData = JSON.parse(passwdData);
					if (passwdData.checkPasswd) {
						$('#passwdMess0').empty();
						$('#password1').prop('disabled', false);
					} else {
						$('#passwdMess0').text("密碼錯誤");
						$('#save').prop("disabled", true);
					}
				})
			});

			$('#password1').on(
					"blur",
					function() {
						var re = /^[\dA-Za-z\S]{6,30}$/;
						var re1 = /[\d]{1,}/;
						var re2 = /[A-Za-z]{1,}/;
						var re3 = /[\S]{1,}/;

						if (re.test(password1.value)
								&& re1.test(password1.value)
								&& re2.test(password1.value)
								&& re3.test(password1.value)) {
							$('#passwdMess1').empty();
							$('#password2').prop('disabled', false);
						} else {
							$('#passwdMess1').text("密碼格式錯誤");
							$('#save').prop("disabled", true);
						}

					});
			$('#password2').on("keyup", function() {
				if (password1.value != password2.value) {
					$('#save').prop("disabled", true);
					$('#passwdMess2').text("確認密碼不符");
				} else {
					$('#passwdMess2').empty();
					$('#save').prop("disabled", false);
				}
			});

		}
		myModal();
	</script>
	
	<script>

		var url = "/softleader-iii-eeit78/giver/giverSelectByAccount!select";
			
		//判斷是否為null
		function undefinedCheck(data){
			if(data == undefined){
				data = null;
				return data;
			}else{
				return data;
			}
		};
		
		function getInformation(){
			$('#changeHeadshot').hide();
			
			function getData(data){
				data = JSON.parse(data);
				$('input[name="form.familyName"]').val(data.familyName);
				$('input[name="form.name"]').val(data.name);
				$('input[name="form.tel"]').val(data.tel);
				$('input[name="form.address"]').val(data.address);
				$('input[name="form.email"]').val(data.email);
				$('#gender').text(gender(data.gender));
				
				var getInfo = data.getInfo;
				if(getInfo){
					$('#getInfo1').prop("checked", true);
				}else{
					$('#getInfo2').prop("checked", true);
				}
				
				var date = data.birth;
				var d = new Date(date);
				var birth = d.getFullYear() + "/" + d.getMonth() + "/" + d.getDate();
				$('input[name="form.birth"]').val(birth);
				
				if(undefinedCheck(data.headshot) == null){
					$('#img1').attr("src","../pictures/headshot.jpg");
					$('#img_1').attr("src","../pictures/headshot.jpg");
				}else{
					var str = arrayBufferToBase64(data.headshot); 
					$('#img1').attr("src","data:image/png;base64," + str);
					$('#img_1').attr("src","data:image/png;base64," + str);
				}
			}
			$.post(url, {'thisAccount': '${sessionScope.giver.account}' }, getData);
		}
		getInformation();
				
		
		//驗證圖片
		$('#headshot').on("change",function(){
			$('#changeHeadshot').show();
			var file = headshot.files[0];
			if(file != null){
				readFile(file);
			}else{
				$('#img2').attr("src","../pictures/headshot.jpg");
				$('#img_2').attr("src","../pictures/headshot.jpg");
			}
		})

		function readFile(file){
// 		    if(!/image\/\w+/.test(file.type)){ 
// 		        alert("檔案請放圖片！"); 
// 		        return; 
// 		    } 
		    var reader = new FileReader();
		    reader.readAsDataURL(file); 
		    reader.onload = function(){ 
		    	$('#img2').attr("src",reader.result);
		        $('#img_2').attr("src",reader.result);
		    } 
		} 
	</script>
</body>
</html>