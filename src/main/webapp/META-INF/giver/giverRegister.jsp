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
</style>

</head>
<body id="body">

	<jsp:include page="../../header.jsp" />

	<div class="container panel alert">
		<div class="row">
			<div class="col-md-2"></div>

			<div class="col-md-8">
				<h2>捐款會員註冊</h2>
				<form
					action='/softleader-iii-eeit78/giver/giverAction!insert.action'
					method="post" enctype="multipart/form-data">
					<table class="table">
						<colgroup>
							 <col span="1" style="background-color:#ADADAD">
   							 <col style="background-color:#F0F0F0">
						</colgroup>
						<tr>
							<td><label for="">帳號:<b>*</b></label></td>
							<td><input type="text" name="form.account"
								value="${param.form.account }" required="required"><b id="account"></b></td>
						</tr>
						<tr>
							<td><label for="">密碼:<b>*</b></label></td>
							<td><input type="password" name="form.passwd" value="" id="passwd1"
								required="required"></td>
						</tr>
						<tr>
							<td><label for="">密碼確認:<b>*</b></label></td>
							<td><input type="password" value=""	id="passwd2"
							 required="required"><b id="password2"></b></td>
						</tr>
						<tr>
							<td><label for="">姓:<b>*</b></label></td>
							<td><input type="text" name="form.familyName"
								value="${param.form.familyName }"></td>
						</tr>
						<tr>
							<td><label for="">名字:<b>*</b></label></td>
							<td><input type="text" name="form.name"
								value="${param.form.name }"></td>
						</tr>
						<tr>
							<td><label for="">性別:<b>*</b></label></td>
							<td><input type="radio" name="form.gender" value="true">男
								<input type="radio" name="form.gender" value="false">女</td>
						</tr>
						<tr>
							<td><label for="">身分證字號:<b>*</b></label></td>
							<td><input type="text" name="form.id_number"
								value="${param.form.id_number }"><b id="idNumber"></b></td>
						</tr>
						<tr>
							<td><label for="">手機:<b>*</b></label></td>
							<td><input type="text" name="form.tel"
								value="${param.form.tel }"><b id="tel"></b></td>
						</tr>
						<tr>
							<td><label for="">住址:</label></td>
							<td><input type="text" name="form.address"
								value="${param.form.address }"></td>
						</tr>
						<tr>
							<td><label for="">Email:<b>*</b></label></td>
							<td><input type="email" name="form.email"
								value="${param.form.email }"></td>
						</tr>
						<tr>
							<td><label for="">是否獲得資訊:</label></td>
							<td><input type="radio" name="form.get_info" value="true" checked="checked">是
								<input type="radio" name="form.get_info" value="false">否</td>
						</tr>
						<tr>
							<td><label for="">生日:</label></td>
							<td><input type="date" name="form.birth" value=""
								required="required" style="height: 30px;"></td>
						</tr>
						<tr>
							<td><label for="">照片:</label></td>
							<td><input type="file" name="form.headshot" value="" id="headshot"></td>
						</tr>
						<tr>
							<td><img src="" id="img" style="weight:50px; height:50px;"></td>
							<td><input type="submit" class="btn btn-default" value="送出" id="submit">
								<input type="reset" class="btn btn-default" value="清除" ></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>

	
</body>

<script>
	var url = "${pageContext.request.contextPath}/giver/giverSelect!select";
	var urli = "${pageContext.request.contextPath}/giver/giverSelect!selectByIdNumber";
	
	//驗證帳號
	$('input[name="form.account"]').on("blur", function(){
		$('#account').empty();
		var thisAccount = $(this).val();
		$.post(url, {'thisAccount' : thisAccount}, function(data) {
			data = JSON.parse(data);
			if (data != null) {
				$('#submit').prop("disabled",true);
				$('#account').text("帳號已被註冊");
				return;
			}
			$('#submit').prop("disabled",false);
			
		});
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
		re = /^[\d]{10}$/;
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

	//驗證圖片
	$('#headshot').on("change",function(){
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
	    } 
	} 
	
</script>


</html>