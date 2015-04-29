<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<style>
th {
	width: 200px;
}

#btnn {
	text-align: center;
	vertical-align: bottom;
}
</style>
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>管理者-所有團體資訊</title>


</head>
<body>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<table class="table table-condensed table-bordered">
				<tr>
					<th style="width: 10px"></th>
					<th style="width: 100px">團體名稱</th>
					<th>帳號</th>
					<th style="width: 70px">密碼</th>
					<th>信箱</th>
				</tr>
				<tbody id="tbody">
				</tbody>
			</table>
		</div>
		<div class="col-md-1"></div>
	</div>
	<div id= "detail"></div>
	<div id= "btnn">
		<input type="button" name="forward" value="上一頁" id="btnf"> <input
			type="tel" name="now" size="1" value="1" id="btnw"> <input
			type="button" name="next" value="下一頁" id="btnx"> <a
			href="<c:url value='/index.jsp' />">回首頁</a>
	</div>
	<script>
		var url = "/softleader-iii-eeit78/raiser/raiserSelectAll!getPerPage";
		$.getJSON(url, getData);

		var page = $("#btnw").val();
		var Max = Math.ceil("${raiserCount}" / 3);
		$("#btnx").before("/" + Max + "\t");

		//用數字輸入可搜尋頁數
		$("#btnw").change(function() {
			if ($("#btnw").val() <= Max && $("#btnw").val()>0) {
				page = $("#btnw").val();
			} else {
				$("#btnw").val("1");
				page=1;
			}
			$('#detail').children().remove();
			$('#tbody').children().remove();
			$.getJSON(url, {
				'page' : page
			}, getData);
		});

		//點上一頁
		$("#btnf").click(function() {
			if ($("#btnw").val() > 1) {
				page--;
				$("#btnw").val(page);
				$('#detail').children().remove();
				$('#tbody').children().remove();
				$.getJSON(url, {
					'page' : page
				}, getData);
			}
		});

		//點下一頁
		$("#btnx").click(function() {
			if ($("#btnw").val() < Max) {
				page++;
				$("#btnw").val(page);
				$('#detail').children().remove();
				$('#tbody').children().remove();
				$.getJSON(url, {
					'page' : page
				}, getData);
			}
		});

		function getData(data) {
			$(data).each(
					function(index, raiser) {
						$(tbody).append(
								"<tr><td><button id='btnchk"+raiser.id+"'><span id='spanpic' class='glyphicon glyphicon-chevron-down' ></span></button></td>"
										+ "<td><a>" + raiser.name + "</a></td>"
										+ "<td>" + raiser.account + "</td>"
										+ "<td>" + raiser.passwd + "</td>"
										+ "<td>" + raiser.email + "</td></tr>");
						$("#btnchk"+raiser.id).click(function(){
							$("#detail").children().remove();
							$("#detail").append(
								"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>團 體  帳 號:　"+raiser.account+ "</div><div class='col-md-3'></div></div>"
								+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>團 體  密 碼:　"+raiser.passwd+ "</div><div class='col-md-3'></div></div>"
								+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>團 體  名 稱:　"+raiser.name+ "</div><div class='col-md-3'></div></div>"
								+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>團 體  電 話:　"+raiser.tel+ "</div><div class='col-md-3'></div></div>"
								+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>聯絡人姓名:　"+raiser.contactPerson+ "</div><div class='col-md-3'></div></div>"
								+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>聯絡人電話:　"+raiser.contactTel+ "</div><div class='col-md-3'></div></div>"
								+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>電 子  信 箱:　"+raiser.email+ "</div><div class='col-md-3'></div></div>"
								+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>團 體  地 址:　"+raiser.address+ "</div><div class='col-md-3'></div></div>"
								+"<div class='row'><div class='col-md-3'></div><div class='col-md-6'>團 體  短 片:　"+raiser.videoUrl+ "</div><div class='col-md-3'></div></div>"
								+"<div class='row'><div class='col-md-3'></div><div class='col-md-8'>團 體  資 訊:</div><div class='col-md-3'></div></div>"
								+"<div class='row'><div class='col-md-3'></div><div class='col-md-5'>　　"+raiser.detail+ "</div></div>"
							);
						});
					});
		};
		
	</script>

</body>