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
html, body{
	height: 100%;
}
label b {
	color: red;
	font-size: 150%;
}

b {
	color: red;
}
.tab-content .row{
 	margin-top: 20px; 
}
.tab-content .col-md-3{
/* 	background: #C4E1FF; */
	color: #0080FF;
}
</style>

<title>捐款</title>

</head>
<body id="body">

	<jsp:include page="../../header.jsp" />

	<div class="container" style="min-height:70%;">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<h2>${sessionScope.giver.familyName }${sessionScope.giver.name }您好!</h2>
				
				<ul class="nav nav-tabs" role="tablist">
					<li class="active"><a href="#donate">Step1:捐款金額</a></li>
					<li><a href="#billInfo">Step2:信用卡資訊</a></li>
					<li><a href="#infoConfirm">Step3:捐款資訊確認</a></li>
				</ul>
				<form action="<c:url value='/donate/donateAction!donate.action'/>" method="post">

					<div class="tab-content">
						<div class="panel alert tab-pane fade in active" id="donate">
							<div style="background: #f2f2f2">
								<div class="row" style="padding-top:10px;">
									<div class="col-md-3">
										<label for="">捐款活動名稱:</label>
									</div>
									<div class="col-md-7">
										<input type="hidden" name="form.campaignName"
												value="${param.name }">${param.name }
									</div>
									<div class="col-md-2"></div>
								</div>
								<div class="row" style="display: none">
									<div class="col-md-3">
										<label for="">捐款活動Id:</label>
									</div>
									<div class="col-md-7">
										<input type="text" name="form.campaignId"
											value="${param.id }">
									</div>
									<div class="col-md-2"></div>
								</div>
								<div class="row">
									<div class="col-md-3">
										<label for="">捐款人姓名:</label>
									</div>
									<div class="col-md-7" id="giverName">
										${sessionScope.giver.familyName }${sessionScope.giver.name }
									</div>
									<div class="col-md-2"></div>
								</div>
								<div class="row" style="padding-bottom:10px;">
									<div class="col-md-3">
										<label for="">捐款金額:<b>*</b></label>
									</div>
									<div class="col-md-7">
										<input type="text" name="form.amount" class="form-control" autofocus required="required">
									</div>
									<div class="col-md-2"><b id="amount"></b></div>
								</div>
								
								
							
							
<!-- 								<table class="table"> -->
<%-- 									<colgroup> --%>
<%-- 										<col span="1" style="background-color: #ADADAD"> --%>
<%-- 										<col style="background-color: #F0F0F0;"> --%>
<%-- 										<col style="background-color: #F0F0F0; width: 150px;"> --%>
<%-- 									</colgroup> --%>
<!-- 									<tr> -->
<!-- 										<td><label for="">捐款活動名稱:</label></td> -->
<!-- 										<td><input type="hidden" name="form.campaignName" -->
<%-- 											value="${param.name }">${param.name }</td> --%>
<!-- 										<td></td> -->
<!-- 									</tr> -->
<!-- 									<tr style="display: none"> -->
<!-- 										<td><label for="">捐款活動Id:</label></td> -->
<!-- 										<td><input type="text" name="form.campaignId" -->
<%-- 											value="${param.id }"></td> --%>
<!-- 										<td></td> -->
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td><label for="">捐款人姓名:</label></td> -->
<%-- 										<td id="giverName">${sessionScope.giver.familyName }${sessionScope.giver.name }</td> --%>
<!-- 										<td></td> -->
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td><label for="">捐款金額:<b>*</b></label></td> -->
<!-- 										<td><input type="text" name="form.amount" required="required"></td> -->
<!-- 										<td><b id="amount"></b></td> -->
<!-- 									</tr> -->
<!-- 								</table> -->
							</div>
							<div class="row">
								<a class="btn btn-primary" id="donateBtn">下一步</a>
							</div>
						</div>

						<jsp:include page="billInfo.jsp" />
						<jsp:include page="infoConfirm.jsp" />


					</div>

				</form>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>

	<jsp:include page="/footer.jsp" />

</body>

<script>
	
	//tab
// 	$('.nav-tabs a').click(function(){
// 	    $(this).tab('show');
// 	});
	
	//下一步
	$('#donateBtn').on('click', function(){
		$('.nav-tabs a[href="#billInfo"]').tab('show');
	});
	
	//驗證捐款金額
	$('input[name="form.amount"]').on("blur", function() {
		$('#amount').empty();
		var amount = $(this).val();
		re = /[\d]/;
		for(var i=0; i<amount.length; i++){
			if(!re.test(amount[i])){
				$('#amount').text("請輸入正確金額");
				$('#infoSubmit').prop("disabled", true);
				return;
			}else{
				$('#infoSubmit').prop("disabled", false);
				return;
			}
		}
	});
</script>
</html>