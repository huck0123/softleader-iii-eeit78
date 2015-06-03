<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="/softleader-iii-eeit78/css/giver.css">
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>

<title>登入</title>
<style>
html, body{height: 100%}
.card-container.card {
	width: 350px;
	padding: 60px 40px;
}

.card {
	background-color: #eee;
	padding: 20px 25px 30px;
	margin: 0 auto 25px;
	margin-top: 80px;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	-moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	-webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}

.profile-img-card {
	width: 130px;
	height: 130px;
	margin: 0 auto 10px;
	display: block;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	border-radius: 50%;
}

.profile-name-card {
	font-size: 16px;
	font-weight: bold;
	text-align: center;
	margin: 10px 0 0;
	min-height: 1em;
}

.form-signin {
	max-width: 330px;
	padding: 15px;
	margin: 0 auto;
}

.form-signin .form-control {
	position: relative;
	height: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 10px;
	font-size: 16px;
	margin-bottom: 10px;
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
b{
	color: red;
}
body{
	background-color: white;
}
.row{margin-left:0px;
margin-right:0px;}
</style>
<script>
	$(document).ready(function(){
		console.log('${sessionScope.identityFail}')
		if('${sessionScope.identityFail}' >= 3){
			$('#identityDiv').show();
		}
	});
</script>

</head>
<body id="body">
	<jsp:include page="../../header.jsp" />
	
<!-- 	<p>this is login.jsp</p> -->
	
	<div class="container"  style="min-height: 90%">
		<div class="card card-container">
			<form class="form-signin" action="<c:url value='/login/loginAction.action' />" method="post">
				<img id="profile-img" class="profile-img-card" src="../pictures/headshot1.png" />
				<p id="profile-name" class="profile-name-card"></p>
				
				<h2 class="form-signin-heading">請登入</h2>
				
				<input type="text" class="form-control" name="account" placeholder="帳號" required autofocus> 
				<input type="password"	class="form-control" name="passwd" placeholder="Password" >
				
				<div class="checkbox"></div>
				<div id="identityDiv" style="padding:10px; display:none;">
					<img src="/softleader-iii-eeit78/login/loginIdentity!IdentityImage" id="identityImage">
					<br><br>
					<input type="text" class="form-control" name="identityString">
					<a class="btn btn-default" id="changeImage">更換驗證圖形</a>
				</div>
				<button class="btn btn-lg btn-primary btn-block" type="submit">Sign	in</button>
				<br>
				<a href="#" data-toggle="modal" data-target="#newPassword">忘記密碼</a>
			</form>
			<b style="color: red;">${wrongLogin}</b>
			
		</div>
	</div>
	
	
	 <!-- newPassword Modal -->
	<div class="modal fade" id="newPassword" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h3>我們將會根據您當初註冊時的email送出新密碼給您</h3><br>
	        <p>(僅能用於捐款者，慈善團體帳號需電話確認)
	      </div>
	      <div class="modal-body">
	      	<br>
	      	<label for="">您的帳號:</label>
	        <input type="text" id="yourAccount" autofocus>
	        <br>
	      	<b id="accountMessage"></b>
	      	<br>
	        <label for="">您的身分證字號:</label>
	        <input type="text" id="yourIdNumber" disabled="disabled">
	        <br>
	        <b id="IdNumberMessage"></b>
	        <br>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" id="forgetPasswd" disabled>確認送出</button>
	      </div>
	    </div>
	  </div>
	</div>
	
		<jsp:include page="/footer2.jsp" />
	
	<script>
		
		//判斷帳號
		$('#yourAccount').on('keyup', function(){
			var url = "${pageContext.request.contextPath}/giver/giverSelect!selectAccount";
			var thisAccount = $(this).val();
			//查看giver是否有相同的帳號
			$.post(url, {'form.account' : thisAccount}, function(data) {
				data = JSON.parse(data);
				if (!data.checkAccount) {
					$('#forgetPasswd').prop("disabled",true);
					$('#accountMessage').empty().text("此帳號不存在");
					$('#yourIdNumber').val("");
					$('#yourIdNumber').prop("disabled",true);
					return;
				}else{
					$('#forgetPasswd').prop("disabled",false);
					$('#accountMessage').empty();
					$('#yourIdNumber').prop("disabled",false);
				}
				
			});
		});
		
		//判斷IDNumber
		$('#yourIdNumber').on('keyup', function(){
			var url = "${pageContext.request.contextPath}/giver/giverSelect!selectIdNumberByAccount";
			var thisAccount = $('#yourAccount').val();
			var thisIdNumber = $(this).val();
			//查看是否有此身分證
			$.post(url, {'form.account' : thisAccount, 'form.id_number' : thisIdNumber}, function(data){
				data = JSON.parse(data);
				if(!data.IdNumberByAccount){
					$('#forgetPasswd').prop("disabled",true);
					$('#IdNumberMessage').empty().text("此身分證錯誤");
					return;
				}else{
					$('#forgetPasswd').prop("disabled",false);
					$('#IdNumberMessage').empty();
				}
			});
		});
		
		//送出Email
		$('#forgetPasswd').on('click', function(){
			var account = $('#yourAccount').val();
			$('#message').text('已寄信到您的信箱');
			$.ajax("/softleader-iii-eeit78/giver/giverAction!newPassword?form.account=" + account);
		});
		
		//更換驗證圖形
		$('#changeImage').on('click',function(){
			$.ajax("/softleader-iii-eeit78/login/loginIdentity!IdentityImage").done(function(){
				$('#identityImage').attr("src","/softleader-iii-eeit78/login/loginIdentity!IdentityImage");
			});
		});
			
		
	</script>
	
	
</body>
</html>