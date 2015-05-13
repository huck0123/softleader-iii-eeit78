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
  top: 200px;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 1050;
  display: none;
  overflow: hidden;
  -webkit-overflow-scrolling: touch;
  outline: 0;
}

</style>

</head>
<body id="body">

	<jsp:include page="../../header.jsp" />

	<div class="container panel alert">
		<div class="row">
			<div class="col-md-2"></div>

			<div class="col-md-8">
				<h2>${sessionScope.giver.familyName }${sessionScope.giver.name }您好</h2>
				<div>
					<a href="#" data-toggle="modal" data-target="#myModal">
						<img src="" class="img-thumbnail" id="img"
							style="width: 100px; height: 100px">
					</a>
				</div>

				<form action='/softleader-iii-eeit78/giver/giverAction!update.action'
					method="post" enctype="multipart/form-data">
					<table class="table">
						<colgroup>
							<col span="1" style="background-color: #ADADAD">
							<col style="background-color: #F0F0F0">
						</colgroup>
						<tr>
							<td><label for="">帳號:</label></td>
							<td><input type="text" name="form.account"
								value="${sessionScope.giver.account }" required="required"></td>
						</tr>
						<tr>
							<td><label for="">密碼:</label></td>
							<td>
								<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myPasswd">修改密碼</button>
								<input type="password" name="form.passwd" value="" id="passwd" style="display: none">
							</td>
						</tr>
						<tr>
							<td><label for="">姓:</label></td>
							<td><input type="text" name="form.familyName"
								value="${sessionScope.giver.familyName }"></td>
						</tr>
						<tr>
							<td><label for="">名字:</label></td>
							<td><input type="text" name="form.name"
								value="${sessionScope.giver.name }"></td>
						</tr>
						<tr>
							<td><label for="">性別:</label></td>
							<td id="gender"></td>
						</tr>
						<tr>
							<td><label for="">身分證字號:</label></td>
							<td>${sessionScope.giver.idNumber }</td>
						</tr>
						<tr>
							<td><label for="">手機:</label></td>
							<td><input type="text" name="form.tel"
								value="${sessionScope.giver.tel }"></td>
						</tr>
						<tr>
							<td><label for="">住址:</label></td>
							<td><input type="text" name="form.address"
								value="${sessionScope.giver.address }"></td>
						</tr>
						<tr>
							<td><label for="">Email:</label></td>
							<td><input type="email" name="form.email"
								value="${sessionScope.giver.email }"></td>
						</tr>
						<tr>
							<td><label for="">是否獲得資訊:</label></td>
							<td><input type="radio" name="form.get_info" value="true"
								id="getInfo1"><label for="getInfo1">是</label>
								<input type="radio" name="form.get_info" value="false"
								id="getInfo2"><label for="getInfo2">否</label>
							</td>
						</tr>
						<tr>
							<td><label for="">生日:</label></td>
							<td><span></span></td>
						</tr>
						<tr>
							<td><label for="">照片:</label></td>
							<td><input type="file" name="form.headshot" value="" id="headshot"></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" class="btn btn-default" value="送出"></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
	
	 <!-- myModal -->
  	<div class="modal fade" id="myModal" role="dialog">
    	<div class="modal-dialog">
      			<!-- Modal content-->
	   		<div class="modal-content">
       			<div class="modal-body">
					<img src="" id="img1">
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
					<label for="password1">輸入密碼</label>
					<input type="password" id="password1" autofocus><br><br>
					<label for="password2">確認密碼</label>
					<input type="password" id="password2">
	       		</div>
	       		 <div class="modal-footer">
	       		 	<button type="button" class="btn btn-primary" data-dismiss="modal" id="save">儲存密碼</button>
	       		 </div>
    		</div>
    	</div>
	</div>
	<script>
		$('#save').on("click", function(){
			$('#passwd').val($('#password1').val());
		});
		
// 		$('#password2').on("keyup", function(){
// 			if(password1.value != password2.value){
// 				$('#save').prop("disabled", true);
// 				$('#passwd').text("密碼不符");
// 			}else{
// 				$('#save').prop("disabled", false);
// 			}
// 		});
	
	
	</script>
	
	<script>

		var url = "/softleader-iii-eeit78/giver/giverSelect!select";
			
		function getInformation(){
			$('#gender').text(gender('${sessionScope.giver.gender}'));
			
			var getInfo = ${sessionScope.giver.getInfo};
			if(getInfo){
				$('#getInfo1').prop("checked", true);
			}else{
				$('#getInfo2').prop("checked", true);
			}
			
			function getData(data){
				data = JSON.parse(data);
				var date = data.birth;
				var d = new Date(date);
				var birth = d.getFullYear() + "/" + d.getMonth() + "/" + d.getDate();
				$('span').text(birth);
				
				var str = arrayBufferToBase64(data.headshot); 
				$('#img').attr("src","data:image/png;base64," + str);
				$('#img1').attr("src","data:image/png;base64," + str);
			}
			$.post(url, {'thisAccount': '${sessionScope.giver.account}' }, getData);
		}
		getInformation();
				
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
		        $('#img1').attr("src",reader.result);
		    } 
		} 
	</script>
</body>
</html>