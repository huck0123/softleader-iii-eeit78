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

<style>
label b {
	color: red;
	font-size: 150%;
}

b {
	color: red;
}
</style>

<title>捐贈流程</title>

</head>
<body id="body">
	<jsp:include page="../../header.jsp" />

	<div class="container panel alert">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h2>${sessionScope.giver.familyName }${sessionScope.giver.name }您好!</h2>
				<form action="<c:url value='/donate/billInfo'/>" method="post">
					<table class="table">
						<colgroup>
							 <col span="1" style="background-color:#ADADAD">
   							 <col style="background-color:#F0F0F0; ">
   							 <col style="background-color:#F0F0F0; width:150px;">
						</colgroup>
						<tr>
							<td><label for="">捐款活動名稱:</label></td>
							<td><input type="hidden" name="campaignName"
								value="${param.name }">${param.name }</td>
							<td></td>
						</tr>
						<tr style="display: none">
							<td><label for="">捐款活動Id:</label></td>
							<td><input type="text" name="campaignId"
								value="${param.id }"></td>
							<td></td>
						</tr>
						<tr>
							<td><label for="">捐款人姓名:</label></td>
							<td>${sessionScope.giver.familyName }${sessionScope.giver.name }</td>
							<td></td>
						</tr>
						<tr>
							<td><label for="">捐款金額:<b>*</b></label></td>
							<td><input type="text" name="amount" required="required"></td>
							<td><b id="amount"></b></td>
						</tr>
					</table>
					<div>
						<input type="submit" class="btn btn-primary btn-lg" value="下一步" id="submit">
					</div>
				</form>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>


</body>

<script>
	
	//驗證捐款金額
	$('input[name="amount"]').on("blur", function() {
		$('#amount').empty();
		var amount = $(this).val();
		re = /[\d]/;
		for(var i=0; i<amount.length; i++){
			if(!re.test(amount[i])){
				$('#submit').prop("disabled",true);
				$('#amount').text("請輸入正確金額");
				return;
			}
		}
		$('#submit').prop("disabled",false);
	});
</script>
</html>