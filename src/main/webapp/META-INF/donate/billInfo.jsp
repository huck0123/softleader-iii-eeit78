<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style>
.card {
	width: 50px;
}

label b {
	color: red;
	font-size: 150%;
}

b {
	color: red;
}
</style>


<div class="panel alert tab-pane fade" id="billInfo">
	<div>
		<h3>信用卡資料</h3>
		<table class="table">
			<colgroup>
				<col span="1" style="background-color: #ADADAD">
				<col style="background-color: #F0F0F0;">
				<col style="background-color: #F0F0F0; width: 150px;">
			</colgroup>
			<tr>
				<td><label for="">卡別:<b>*</b></label></td>
				<td><select name="form.cardType" required="required">
						<option>VISA</option>
						<option>JCB</option>
						<option>MasterCard</option>
						<option>銀聯卡</option>
						<option>美國運通</option>
					</select></td>
				<td></td>
			</tr>
			<tr>
				<td><label for="">卡號:<b>*</b></label></td>
				<td><input type="text" class="card" name="cardNo_1" value="" required="required">- 
					<input type="text" class="card"	name="cardNo_2" value="" required="required">- 
					<input type="text" class="card" name="cardNo_3" value="" required="required">- 
					<input type="text" class="card" name="cardNo_4" value="" required="required">
					<input type="text" name="form.cardNo" value="" style="display: none"></td>
				<td><b id="cardNo"></b></td>
			</tr>
			<tr>
				<td><label for="">有效期限:<b>*</b></label></td>
				<td><select name="month" id="month" required="required"></select>月
					<select name="year" id="year" required="required"></select>年</td>
				<td></td>
			</tr>
			<tr>
				<td><label for="">驗證碼:<b>*</b></label></td>
				<td><input type="text" class="card" name="form.cardCheck" value=""
					required="required">(卡片簽名處末三碼)</td>
				<td><b id="cardCheck"></b></td>
			</tr>
		</table>
	</div>
	<br>
	<br>
	<div>
		<h3>持卡人資料</h3>
		<table class="table">
			<colgroup>
				<col span="1" style="background-color: #ADADAD">
				<col style="background-color: #F0F0F0;">
				<col style="background-color: #F0F0F0; width: 250px;">
			</colgroup>
			<tr>
				<td><label for="">持卡人姓名:<b>*</b></label></td>
				<td><input type="text" name="form.cardHolder"
					value="${param.cardHolder }" required="required"></td>
				<td></td>
			</tr>
			<tr>
				<td><label for="">生日:<b>*</b></label></td>
				<td><input type="date" name="form.cardHolderBirth"
					style="height: 30px;" required="required"></td>
				<td><b id="checkBirth"></b></td>
			</tr>
			<tr>
				<td><label for="">持卡人手機:<b>*</b></label></td>
				<td><input type="text" name="form.cardHolderPhone"
					required="required"></td>
				<td><b id="tel"></b></td>
			</tr>
			<tr>
				<td><label for="">持卡人信箱:<b>*</b></label></td>
				<td><input type="email" name="form.cardHolderEmail" id="holderEmail"
					required="required"></td>
				<td></td>
			</tr>
		</table>
	</div>
	<div>
		<a class="btn btn-primary" id="billInfoBack" >上一步</a>
		<a class="btn btn-primary" id="billInfoBtn" >下一步</a>
	</div>
</div>
<script>
	//驗證卡號
	$('input[name="cardNo_4"]').on("keyup", function() {
		if ($(this).val().length == 4) {
			var tempCardNo = $('input[name="cardNo_1"]').val()
									+$('input[name="cardNo_2"]').val()
									+$('input[name="cardNo_3"]').val()
									+$('input[name="cardNo_4"]').val()
			re = /[\d]/;
			for(var i=0; i<tempCardNo.length; i++){
				if(!re.test(tempCardNo[i])){
					$('#cardNo').text("請輸入數字");
					$('#infoSubmit').prop("disabled", true);
					return;
				}else{
					$('#cardNo').empty();
					$('#infoSubmit').prop("disabled", false);
				}
			}
			$('input[name="form.cardNo"]').val($('input[name="cardNo_1"]').val()
					+$('input[name="cardNo_2"]').val()
					+$('input[name="cardNo_3"]').val()
					+$('input[name="cardNo_4"]').val());
		}
	});
	
	//donate.jsp
	$('#billInfoBack').on('click', function(){
		//上一步
		$('.nav-tabs a[href="#donate"]').tab('show');
	});
	
	//infoConfirm.jsp
	$('#billInfoBtn').on('click', function(){
		$('#infoAmount').text($('input[name="form.amount"]').val());
		$('#infoCardHolder').text($('input[name="form.cardHolder"]').val());
		$('#infoCardType').text($('select[name="form.cardType"]').val());
		$('#infoCardNo').text($('input[name="cardNo_1"]').val()
				+$('input[name="cardNo_2"]').val()
				+$('input[name="cardNo_3"]').val()
				+$('input[name="cardNo_4"]').val());
		
		//下一步
		$('.nav-tabs a[href="#infoConfirm"]').tab('show');
	});
	
	
</script>

<script>
	for (var i = 1; i <= 12; i++) {
		$('#month').append("<option value='"+ i +"'>" + i + "</option>");
	}

	for (var i = 2015; i <= 2030; i++) {
		$('#year').append("<option value='"+ i +"'>" + i + "</option>");
	}

	//驗證生日
	$('input[name="form.cardHolderBirth"]').on("blur", function(){
		var birth = new Date($(this).val());
		var nowDate = new Date();
		if(nowDate.getFullYear()-birth.getFullYear() > 18){
			$('#checkBirth').empty();
			$('#infoSubmit').prop("disabled", false);
			console.log("已滿18歲");
			return;
		}else if(nowDate.getFullYear()-birth.getFullYear() == 18){
			if(birth.getMonth() < nowDate.getMonth()){
				$('#checkBirth').empty();
				$('#infoSubmit').prop("disabled", false);
				console.log("已滿18");
				return;
			}else if(birth.getMonth() == nowDate.getMonth()){
				if(birth.getDate() <= nowDate.getDate()){
					$('#checkBirth').empty();
					$('#infoSubmit').prop("disabled", false);
					console.log("已滿18");
					return;
				}else{
					$('#checkBirth').text("未滿18");
					$('#infoSubmit').prop("disabled", true);
					console.log("未滿18");
					return;
				}
			}else{
				$('#checkBirth').text("未滿18");
				$('#infoSubmit').prop("disabled", true);
				console.log("未滿18");
				return;
			}
		}else{
			$('#checkBirth').text("未滿18");
			$('#infoSubmit').prop("disabled", true);
			console.log("未滿18");
			return;
		}
	});
	
	//驗證手機
	$('input[name="form.cardHolderPhone"]').on("blur", function() {
		$('#tel').empty();
		var tel = $(this).val();
		//驗證是否為10個整數
		re = /^[\d]{10}$/;
		if (!re.test(tel)) {
			$('#tel').text("請輸入正確的手機號碼");
			$('#infoSubmit').prop("disabled", true);
			return;
		}else{
			$('#infoSubmit').prop("disabled", false);
		}
	})

	nextFocus();

	//focus欄位
	function nextFocus() {
		$('input[name="cardNo_1"]').on("keyup", function() {
			if ($(this).val().length == 4) {
				$('input[name="cardNo_2"]').focus();
			}
		});
		$('input[name="cardNo_2"]').on("keyup", function() {
			if ($(this).val().length == 4) {
				$('input[name="cardNo_3"]').focus();
			}
		});
		$('input[name="cardNo_3"]').on("keyup", function() {
			if ($(this).val().length == 4) {
				$('input[name="cardNo_4"]').focus();
			}
		});
		$('input[name="form.cardCheck"]').on("keyup", function() {
			var tempCardCheck = $(this).val(); 
			if (tempCardCheck.length == 3) {
				re = /^[\d]{3}$/;
					if(!re.test(tempCardCheck)){
						$('#cardCheck').empty();
						$('#cardCheck').text("請輸入數字");
						$('#infoSubmit').prop("disabled", true);
						return;
					}else{
						$('#cardCheck').empty();
						$('input[name="form.cardHolder"]').focus();
						$('#infoSubmit').prop("disabled", false);
					}
			}else{
				$('#infoSubmit').prop("disabled", true);
			}
		})
	}
</script>
