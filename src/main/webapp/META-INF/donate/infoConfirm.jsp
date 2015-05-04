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
<title>確認資料</title>
</head>
<body id="body">

	<jsp:include page="../../header.jsp" />

	<div class="row container">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			${sessionScope.giver.familyName }${sessionScope.giver.name }您好!
			<form
				action="/softleader-iii-eeit78/donate/donateAction!donate.action"
				method="post">
				<div>
					<h3>捐款資訊</h3>
				</div>
				<table class="table table-condensed">
					<tr>
						<td><label for="">捐款活動名稱</label></td>
						<td><input type="hidden" name="form.campaignName" value="xxx">xxx</td>
					</tr>
					<tr>
						<td><label for="">捐款活動ID</label></td>
						<td><input type="text" name="form.campaignId" value=""></td>
					</tr>
					<tr>
						<td><label for="">捐款人ID</label></td>
						<td><input type="text" name="form.giverId"
							value="${sessionScope.giver.id }"></td>
					</tr>
					<!-- 					<tr> -->
					<!-- 						<td><label for="">捐款人IP</label></td> -->
					<!-- 						<td><input type="hidden" name="form.ip" value=""></td> -->
					<!-- 					</tr> -->
					<tr>
						<td><label for="">捐款金額</label></td>
						<td><input type="hidden" name="form.amount"
							value="${param.amount }">${param.amount }</td>
					</tr>
				</table>
				<div>
					<h3>信用卡資料</h3>
				</div>
				<table class="table table-condensed">
					<tr>
						<td><label for="">卡別</label></td>
						<td><input type="hidden" name="form.cardType"
							value="${param.cardType }">${param.cardType }</td>
					</tr>
					<tr>
						<td><label for="">卡號</label></td>
						<td><input type="hidden" name="form.cardNo"
							value="${param.cardNo_1 }${param.cardNo_2 }${param.cardNo_3 }${param.cardNo_4 }">
							${param.cardNo_1 }-${param.cardNo_ }-${param.cardNo_3 }-${param.cardNo_4 }
						</td>
					</tr>
					<tr>
						<td><label for="">有效期限</label></td>
						<td><input type="hidden" name="form.cardDeadline"
							value="${param.month }${param.year }">${param.month }月${param.year }年
						</td>
					</tr>
					<tr>
						<td><label for="">驗證碼</label></td>
						<td><input type="hidden" name="form.cardCheck"
							value="${param.cardCheck }">${param.cardCheck }(卡片簽名處末三碼)</td>
					</tr>
				</table>
				<div>
					<h3>持卡人資料</h3>
				</div>
				<table class="table table-condensed">
					<tr>
						<td><label for="">持卡人姓名</label></td>
						<td><input type="hidden" name="form.cardHolder"
							value="${param.cardHolder }">${param.cardHolder }</td>
					</tr>
					<tr>
						<td><label for="">生日</label></td>
						<td><input type="hidden" name="form.cardHolderBirth"
							value="${param.cardHolderBirth }" style="height: 30px;">${param.cardHolderBirth }</td>
					</tr>
					<tr>
						<td><label for="">持卡人手機</label></td>
						<td><input type="hidden" name="form.cardHolderPhone"
							value="${param.cardHolderPhone }">${param.cardHolderPhone }</td>
					</tr>
					<tr>
						<td><label for="">持卡人信箱</label></td>
						<td><input type="hidden" name="form.cardHolderEmail"
							value="${param.cardHolderEmail }">${param.cardHolderEmail }</td>
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
	
</script>
</html>