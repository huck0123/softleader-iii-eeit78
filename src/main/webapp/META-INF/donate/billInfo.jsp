<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE">
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
.card {
	width: 50px;
}
</style>

<title>請輸入信用卡資訊</title>

</head>
<body id="body">
	<jsp:include page="../../header.jsp" />
	
	<div class="row container">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			${sessionScope.giver.familyName }${sessionScope.giver.name }您好!
			<form action="/softleader-iii-eeit78/donate/infoConfirm"
				method="post">
				<table class="table table-condensed" style="display: none">
					<tr>
						<td>捐款活動名稱</td>
						<td><input type="text" name="campaignName" value="${param.campaignName }"></td>
					</tr>
					<tr>
						<td>捐款活動ID</td>
						<td><input type="text" name="campaignId" value="${param.campaignId }"></td>
					</tr>
					<tr>
						<td>捐款金額</td>
						<td><input type="text" name="amount" value="${param.amount }"></td>
					</tr>
				</table>
				<div>
					<h3>信用卡資料</h3>
				</div>
				<table class="table table-condensed">
					<tr>
						<td><label for="">卡別</label></td>
						<td><select name="cardType">
								<option>VISA</option>
								<option>JCB</option>
								<option>MasterCard</option>
								<option>銀聯卡</option>
								<option>美國運通</option>
						</select></td>
					</tr>
					<tr>
						<td><label for="">卡號</label></td>
						<td><input type="text" class="card" name="cardNo_1" value="">-
							<input type="text" class="card" name="cardNo_2" value="">-
							<input type="text" class="card" name="cardNo_3" value="">-
							<input type="text" class="card" name="cardNo_4" value="">
						</td>
					</tr>
					<tr>
						<td><label for="">有效期限</label></td>
						<td><select name="month" id="month"></select>月 <select
							name="year" id="year"></select>年</td>
					</tr>
					<tr>
						<td><label for="">驗證碼</label></td>
						<td><input type="text" class="card" name="cardCheck" value="">(卡片簽名處末三碼)</td>
					</tr>
				</table>
				<div>
					<h3>持卡人資料</h3>
				</div>
				<table class="table table-condensed">
					<tr>
						<td><label for="">持卡人姓名</label></td>
						<td><input type="text" name="cardHolder"
							value="${param.cardHolder }"></td>
					</tr>
					<tr>
						<td><label for="">生日</label></td>
						<td><input type="date" name="cardHolderBirth"
							style="height: 30px;"></td>
					</tr>
					<tr>
						<td><label for="">持卡人手機</label></td>
						<td><input type="text" name="cardHolderPhone"></td>
					</tr>
					<tr>
						<td><label for="">持卡人信箱</label></td>
						<td><input type="email" name="cardHolderEmail"></td>
					</tr>
					<tr>
						<td><input type="submit" value="下一步">
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>


</body>

<script>
	for (var i = 1; i <= 12; i++) {
		$('#month').append("<option value='"+ i +"'>" + i + "</option>");
	}

	for (var i = 2015; i <= 2030; i++) {
		$('#year').append("<option value='"+ i +"'>" + i + "</option>");
	}
</script>

</html>