<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!--     <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<!--     <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--      <link rel="icon" href="../../favicon.ico"> -->
<title>Insert title here</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>
<script src="/softleader-iii-eeit78/js/useful.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/softleader-iii-eeit78/css/giver.css">
<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
}

.thumbnail {
	text-align: left;
}

.cover-table-wrapper {
	height: 100%;
	width: 100%;
	min-height: 100%;
	display: table;
}

.cover-tr-wrapper {
	display: table-row;
	vertical-align: middle;
}
.cover-td-wrapper {
	display: table-cell;
	vertical-align: middle;
}

.background-div {
	z-index: -9999;
	background-image: url("pictures/bulb.jpeg");
	background-size: cover;
	top: 0;
	opacity: 0.7;
	height: 100%;
	width: 100%;
	min-height: 100%;
	position: absolute;
	display: table;
}

.outer-wrapper {
	height: 100%;
	width: 100%;
	min-height: 100%;
	display: table;
}

.inner-wrapper {
	display: table-cell;
	vertical-align: middle;
}

.blank-space10 {
	width: 100%;
	height: 10%;
}

.blank-space5 {
	width: 100%;
	height: 5%;
}

.logo-span{
display: inline-block;
padding:0px 30px 0px 30px;
}
</style>
</head>

<body id="body">

	<div class="background-div"></div>

	<div class="cover-table-wrapper">
		<div style="display: table-row; height: 0px;">
			<jsp:include page="/header.jsp" />
		</div>
		<div class="cover-tr-wrapper">
			<div class="cover-td-wrapper">
				<div class="container">
					<h2>改變，從你我開始！</h2>
					<p>TheGivers是一開放募款平台，為公益團體提供更多的管道募款</p>
					<a class="btn btn-default" href="#campaignDiv">查看活動</a>
				</div>
			</div>
		</div>
	</div>

	<div class="outer-wrapper">
		<div class="inner-wrapper ">
			<div id="campaignDiv" class="container" style="height:100%; border-bottom: 1px solid #EEEEEE">
				<div class="blank-space10"></div>
				<h2>現正進行</h2>
				<div class="blank-space10"></div>
				<div id="campaignRow"></div>
			</div>
		</div>
	</div>

	<div class="outer-wrapper">
		<div class="inner-wrapper ">

			<div id="raiserDiv" class="container" style="height:100%; border-bottom: 1px solid #EEEEEE">
				<div class="blank-space10"></div>
				<h2>參與團體</h2>
				<div class="blank-space10"></div>
				<div id="raiserRow" class="row"></div>
			</div>
		</div>
	</div>



	<div style="width: 100%; height: 1000px;"></div>
	<div style="width: 100%; height: 1000px;"></div>
	<div style="width: 100%; height: 1000px;"></div>
</body>


<script>
	loadCampaign();

	function loadCampaign() {

		$.post('/softleader-iii-eeit78/campaign/campaignAction!selectByAllCondition',
				{'campaignForm.pageSize' : 3,},function(data) {
					data = JSON.parse(data);
					$(data).each(function(index, value) {
						var rowDiv = $('#campaignRow');
						var colDiv = $('<div class="col-sm-12 col-md-4"></div>');
						var thumbnailDiv = $('<div class="thumbnail"></div>');

						var str = arrayBufferToBase64(value.image);
						var image = $('<img src="data:image/png;base64,' + str +'"/>');
						var imageA = $('<a></a>');
						image.appendTo(imageA);
						imageA.attr('href','${pageContext.request.contextPath}/campaign/campaignDetail?id='+ value.id);

						var captionDiv = $('<div class="caption"></div>');
						var h3 = $('<h3>' + value.name+ '</h3>');
						var p1 = $('<p>' + value.detail+ '</p>');

						var percent = value.currentFund/ value.goal * 100;
						var otherInfo = $('<p><span class="glyphicon glyphicon-map-marker"></span> '
								+ value.location
								+ ' <span class="glyphicon glyphicon-tag"></span> '
								+ value.type + ' </p>');
						var progressDiv = $('<div class="progress"></div>');
						var progressBarDiv = $('<div id="aa" class="progress-bar progress-bar-success" role="progressbar" style="width:'+ percent + '%"></div>');
						progressBarDiv.appendTo(progressDiv);

						var otherInfoDiv = $('<div class="row"></div>');
						var childDiv1 = $('<div class="col-md-3"><span class="glyphicon glyphicon-stats"></span> 進度<br/>'
														+ formatFloat(percent,2) + '%</div>');
						var childDiv2 = $('<div class="col-md-3"><span class="glyphicon glyphicon-heart"></span> 已募得<br/>'
														+ value.currentFund+ '</div>');
						var childDiv3 = $('<div class="col-md-3"><span class="glyphicon glyphicon-user"></span> 捐款數<br/></div>');

						$.post('/softleader-iii-eeit78/campaign/campaignAction!selectGiverCountByCampaignId',
							{'campaignForm.id' : value.id},function(data) {
								childDiv3.append(data);})

							var today = (new Date()).getTime();

							var d = (new Date(value.endDate)).getTime();
							console.log(value.endDate);
							var remain = Math.floor((d - today)/ (1000 * 60 * 60 * 24));
							var childDiv4 = $('<div class="col-md-3"><span class="glyphicon glyphicon-time"></span> 倒數日<br/>'
									+ remain+ '<br/></div>');

							otherInfoDiv.append(childDiv1).append(childDiv2).append(childDiv3).append(childDiv4);

							var p2 = $('<p></p>');
							var a = $('<a href="" class="btn btn-primary" role="button">立即捐款</a>');
							var url = '${pageContext.request.contextPath}/donate/donate?id='
									+ value.id+ '&name='+ value.name;
							a.attr('href', url);
							a.appendTo(p2);
							captionDiv.append(h3).append(p1).append(otherInfo).append(progressDiv).append(otherInfoDiv).append(p2);
							imageA.appendTo(thumbnailDiv);
							captionDiv.appendTo(thumbnailDiv);
							thumbnailDiv.appendTo(colDiv);
							colDiv.appendTo(rowDiv);

											})
						})
	}
	
	
	$.post("${pageContext.request.contextPath}/raiser/raiserSelectAll!selectAll", getData);

		function getData(raisers) {
			raisers = JSON.parse(raisers);
			$(raisers).each(function(index, raiser) {
				var span = $('<span class="logo-span"></span>');
				var a = $('<a href=""></a>');
				var srclogo = arrayBufferToBase64(raiser.logo);
				var strimg = $("<img src='' style='width:150px'>");
				strimg.attr("src","data:image/png;base64," + srclogo);
				
				span.append(a);
				a.append(strimg);
				$('#raiserRow').append(span);
				
							});
		}
</script>

</html>