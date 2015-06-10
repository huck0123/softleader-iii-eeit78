<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>捐贈者註冊頁面</title>

<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/softleader-iii-eeit78/css/giver.css">
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>

<style>
label>b{
	color: red;
	font-size: 150%;
}

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
body{
}
</style>

</head>
<body id="body">

	<jsp:include page="../../header.jsp" />

		<div class="container" style="background-color: #f2f2f2; margin-top: 20px;">
			<div class="row" style="text-align:center; color:darkslategrey;">
				<h1 style="margin-top: 30px; font-weight: bolder;">會員註冊</h1>
				<p style="font-size: 20px; margin-top: 16px; font-weight: bolder; margin-bottom: 46px;">立即註冊，取得TheGivers提供的更多功能</p>
			</div>


	</div>


	<div class="container panel alert" style="background-color:#f2f2f2; margin-top: 20px; padding-bottom: 20px">
		<div class="row">
			<div class="col-md-4">
<!-- 				神奇小按鈕 -->
				<button class="btn btn-default" id="xxx">填入表格</button>
			</div>
			
			<script>
 				$('#xxx').on("click", function(){
 					$('input[name="form.account"]').val("jerry0123"); 
 					$('input[name="form.familyName"]').val("李"); 
 					$('input[name="form.name"]').val("小強"); 
 					$('input[name="form.id_number"]').val("A123456789"); 
 					$('input[name="form.tel"]').val("0912145632"); 
 					$('input[name="form.address"]').val("台北市大安區信義路"); 
 					$('input[name="form.email"]').val("eeit78demothegivers@gmail.com"); 
 					$('input[name="form.birth"]').val("1980-01-13"); 
 				}); 
			</script>

			<div class="col-md-4">
<!-- 			<div class="thumbnail"> -->
				<div style="padding-top:36px; text-align: left;">
					<form action='/softleader-iii-eeit78/giver/giverAction!insert.action'
						method="post" enctype="multipart/form-data">
	
						<div class="form-group">
							<label for="">帳號:<b>*</b></label> 
							<input type="text" class="form-control" name="form.account"
								value="${param.form.account }" required="required" autofocus>
							<b id="account"></b>
						</div>
						<div class="form-group">
							<label for="">密碼:<b>*</b></label> 
							<input type="password" class="form-control" name="form.passwd" id="passwd1"
								data-toggle="tooltip" data-placement="top" 
								title="密碼至少6位，至多30位，必須有英文、數字" required="required">
							<b id="password1"></b>
						</div>
						<div class="form-group">
							<label for="">密碼確認:<b>*</b></label> 
							<input type="password" class="form-control" id="passwd2" required="required">
							<b id="password2"></b>
						</div>
						<div class="form-group">
							<label for="">姓:<b>*</b></label> 
							<input type="text" class="form-control" name="form.familyName"
								value="${param.form.familyName }" required="required">
						</div>
						<div class="form-group">
							<label for="">名字:<b>*</b></label> 
							<input type="text" class="form-control" name="form.name" value="${param.form.name }" required="required">
						</div>

							<label for="">性別:<b>*</b></label>

						<div class="form-group">
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-default"> 
								<input type="radio"	name="form.gender" value="true" required="required">男
								</label> <label class="btn btn-default"> 
								<input type="radio" name="form.gender" value="false" required="required">女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="">身分證字號:<b>*</b></label> 
							<input type="text" class="form-control" name="form.id_number"
								value="${param.form.id_number }" required="required">
							<b id="idNumber"></b>
						</div>
						<div class="form-group">
							<label for="">手機:<b>*</b></label> <input type="text"
								class="form-control" name="form.tel" value="${param.form.tel }" required="required">
							<b id="tel"></b>
						</div>
						<div class="form-group">
							<label for="">住址:</label> 
							<input type="text" class="form-control"
								name="form.address" value="${param.form.address }">
						</div>
						<div class="form-group">
							<label for="">Email:<b>*</b></label> 
							<input type="email"	class="form-control" name="form.email"
								value="${param.form.email }" required="required">
						</div>

							<label for="" style="display:none;">是否獲得資訊:</label>

						<div class="form-group" style="display:none;">
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-default"> 
								<input type="radio"	name="form.get_info" value="true" id="getInfo1"
									checked="checked">是
								</label> 
								<label class="btn btn-default"> 
								<input type="radio"	name="form.get_info" value="false" id="getInfo2">否
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="">生日:<b>*</b></label> 
							<input type="date" class="form-control"
								name="form.birth" value="" style="height: 30px;" required="required">
							<b id="birthday"></b>
						</div>
						<div class="form-group">
							<label for="">照片:</label> 
							<label class="btn btn-success">上傳照片
								<input type="file" name="form.headshot" accept="image/*"
									id="headshot" style="display: none;">
							</label>
						</div>
						<div class="form-group">
							<a href="#" id="showHeadshot" data-toggle="modal" data-target="#myModal" title="點擊放大" style="display:none"> 
								<img src="" id="img" style="weight: 100px; height: 100px;">
							</a>
						</div>
					
						<div>
							<input type="submit" class="btn btn-primary" value="送出" id="submit">
							<input type="reset" class="btn btn-primary" value="清除" >
						</div>
					</form>
				</div>
			</div>
<!-- 			</div> -->

		</div>
	</div>

		<jsp:include page="/footer.jsp" />

			 <!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
   		<div class="modal-dialog">
   	  			<!-- Modal content-->
      		<div class="modal-content">
       			<div class="modal-body">
					<img src="" id="img1" style="weight:400px; height:400px;">
        		</div>
   			</div>
   		</div>
    </div>
	
</body>

<script>
$(function() {
	$('[data-toggle="tooltip"]').tooltip()
})
</script>

<script>
	var raiserUrl = "${pageContext.request.contextPath}/raiser/raiserSelectForOne!select";
	var url = "${pageContext.request.contextPath}/giver/giverSelect!selectAccount";
	var urli = "${pageContext.request.contextPath}/giver/giverSelect!selectByIdNumber";
	
	
	//驗證帳號
	$('input[name="form.account"]').on("blur", function(){
		$('#account').empty();
		var thisAccount = $(this).val();
		//查看giver是否有相同的帳號
		$.post(url, {'form.account' : thisAccount}, function(data) {
			data = JSON.parse(data);
			if (data.checkAccount) {
				$('#submit').prop("disabled",true);
				$('#account').text("帳號已被註冊");
				return;
			}
			$('#submit').prop("disabled",false);
			
		});
		//查看raiser是否有相同的帳號
		$.post(raiserUrl, {'account' : thisAccount}, function(data) {
			data = JSON.parse(data);
			if (data != null) {
				$('#submit').prop("disabled",true);
				$('#account').text("帳號已被註冊");
				return;
			}
			$('#submit').prop("disabled",false);
			
		});
	});

	//驗證密碼
	$('#passwd1').on("blur", function(){
		var re = /^[\dA-Za-z\S]{6,30}$/;
		var re1 = /[\d]{1,}/;
		var re2 = /[A-Za-z]{1,}/;
		var re3 = /[\S]{1,}/;
		$('#submit').prop("disabled",true);
		$('#password1').text("密碼格式錯誤");
		
		if(re.test(passwd1.value) && re1.test(passwd1.value) 
				&& re2.test(passwd1.value) && re3.test(passwd1.value)){
			$('#password1').empty();
			$('#submit').prop("disabled",false);
		}
			
	});
	
	//確認密碼驗證
	$('#passwd2').on("keyup", function(){
		if(passwd1.value != passwd2.value){
			$('#submit').prop("disabled",true);
			$('#password2').text("密碼不符");
			return;
		}else{
			$('#password2').empty();
			$('#submit').prop("disabled",false);
		}
	});
	
	//驗證手機
	$('input[name="form.tel"]').on("blur", function(){
		$('#tel').empty();
		var tel = $(this).val();
		//驗證是否為10個整數
		re = /^09[\d]{8}$/;
		if(!re.test(tel)){
			$('#submit').prop("disabled",true);
			$('#tel').text("請輸入正確的手機號碼");
			return;
		}
		$('#submit').prop("disabled",false);
		
	});
	
	//驗證身分證
	$('input[name="form.id_number"]').on("blur",checkId);

	//身分證驗證
	function checkId(){
		
		$('#idNumber').empty();
		var Id = $(this).val();
		var str="ABCDEFGHJKLMNPQRSTUVXYWZIO";
		A1 = new Array(1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3);
		A2 = new Array(0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5);
		arr = new Array(9,8,7,6,5,4,3,2,1,1);
		var sum = 0;
		Id = Id.toUpperCase();

		if(Id.length != 10 ){
			$('#submit').prop("disabled",true);
			$('#idNumber').text("請輸入正確的身分證");
			return;
		}
		
		if(str.indexOf(Id.charAt(0)) == -1){
			$('#submit').prop("disabled",true);
			$('#idNumber').text("請輸入正確的身分證");
			return;
		}
		sum = A1[str.indexOf(Id.charAt(0))];
		sum += A2[str.indexOf(Id.charAt(0))] * arr[0];
		
		for(var i=1; i<=9; i++){
			sum += Id.charAt(i)*arr[i];
		}
		if(sum%10 != 0){
			$('#submit').prop("disabled",true);
			$('#idNumber').text("請輸入正確的身分證");
			return;
		}
		
		$.post(urli, {"form.id_number":Id}, function(data){
			data = JSON.parse(data);
			if(data.IdNumber){
				$('#idNumber').text("此身分證已被使用");
				$('#submit').prop("disabled",true);
				return;
			}
			$('#submit').prop("disabled",false);
		})
		
	}

	//驗證生日
	$('input[name="form.birth"]').on("blur", function(){
		var birth = new Date($(this).val());
		var now = new Date();
		
		if(birth > now){
			$('#birthday').text("您還沒出生");
			$('#submit').prop("disabled",true);
		}else{
			$('#birthday').empty();
		}
		$('#submit').prop("disabled",false);
	});
	
	//驗證圖片
	$('#headshot').on("change",function(){
		$('#showHeadshot').show();
		readFile();
	})

	function readFile(){
	    var file = headshot.files[0]; 
	    if(!/image\/\w+/.test(file.type)){ 
	        alert("檔案請放圖片！"); 
	        return; 
	    } 
	    var reader = new FileReader();
	    reader.readAsDataURL(file); 
	    reader.onload = function(){ 
	        $('#img').attr("src",reader.result);
	        $('#img1').attr("src",reader.result);
	    } 
	} 
	
</script>

</html>