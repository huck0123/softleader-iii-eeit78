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
<title>The Givers</title>	
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">

<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>
<script src="/softleader-iii-eeit78/js/useful.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<!-- <link rel="stylesheet" href="/softleader-iii-eeit78/css/giver.css"> -->
<style type="text/css">
html, body {
	text-align: center;
	width: 100%;
	height: 100%;
}

.thumbnail {
	text-align: justify;
	margin: 30px;
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
	background-image: url("pictures/rsz_thanks.jpg");
	background-size: cover;
	top: 0;
	height: 100%;
	width: 100%;
	min-height: 100%;
	position: absolute;
	display: table;
}

.outer-wrapper {
	padding-top: 60px;
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

.logo-span {
	display: inline-block;
	padding: 0px 30px 0px 30px;
}

#cover-content {
	font-weight: bold;
	text-shadow: 0px 0px 10px black;
	color: white;
	/* -webkit-text-stroke: 1px red; */
}

pre {
	background-color: white;
	border: white;
	padding-left: 0px;
	padding-right: 0px;
	margin-left: 0px;
	margin-right: 0px;
}

.row {
	margin-left: 0px;
	margin-right: 0px;
}
</style>
</head>

<body id="body">

	<div class="background-div"></div>

	<jsp:include page="/header.jsp" />


	<div class="cover-table-wrapper">
		<div style="display: table-row; height: 0px;"></div>
		<div class="cover-tr-wrapper">
			<div class="cover-td-wrapper">
				<div id="cover-content" class="container">
					<h2 style="margin-bottom: 20px">改變，從你我開始</h2>
					<h4 style="margin-bottom: 20px">讓每一分錢變得更有意義！</h4>
					<a class="btn btn-default" href="#campaignDiv">查看活動</a>
				</div>
			</div>
		</div>
	</div>

	<div id="campaignDiv" style="background-color: #f2f2f2">
		<div>
			<div class="container" style="height: 100%;border-bottom: 1px solid silver;">
				<h2 style="margin:100px 0px 0px 0px ">現正進行</h2>
				<div id="campaignRow" class="row"></div>
			</div>
		</div>
	</div>

	<div id="raiserDiv">
		<div>
			<div class="container" style="border-bottom: 1px solid silver">
				<h2 style="margin:100px 0px 0px 0px ">參與團體</h2>
				<div id="raiserRow" class="row" style="margin: 30px 0px 30px 0px"></div>
			</div>
		</div>
	</div>

	<div class="outer-wrapper"
		style="height: 100%; border-bottom: 1px solid #EEEEEE; background-color: #f2f2f2">
		<div class="inner-wrapper ">

			<div id="aboutUs" class="container"">
				<div class="blank-space10"></div>
				<h2>關於我們</h2>
				<div class="blank-space10"></div>
				<div class="row">
					<h4>TheGivers 致力於提供公益團體與民眾一個捐款平台，期望讓每一分錢都能夠用在需要的地方。</h4>
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="/footer.jsp" />
</body>


<script>
	loadCampaign();
	loadRaiser();
	
	function loadCampaign() {

		$.post('/softleader-iii-eeit78/campaign/campaignAction!selectByAllCondition',
				{'campaignForm.pageSize' : 3,},function(data) {
					data = JSON.parse(data);
			$(data).each(function(index,value){
				var rowDiv = $('#campaignRow');
				var colDiv = $('<div class="col-sm-12 col-md-4"></div>');
				var thumbnailDiv = $('<div class="thumbnail"></div>');

				var str = arrayBufferToBase64(value.image);
				var image = $('<img width="100%" src="data:image/png;base64,' + str +'"/>');
				var imageA = $('<a></a>');
				image.appendTo(imageA);
				imageA.attr('href','${pageContext.request.contextPath}/campaign/campaignDetail?id='+ value.id);

				var captionDiv = $('<div class="caption"></div>');
				var h3 = $('<h3>' + value.name+ '</h3>');
				var p = $('<p><span class="glyphicon glyphicon-pencil"></span> '+value.raiserModel.name+'</p>');
				var p1 = $('<p><pre>' + value.detail.substring(0,100)+ '...</pre></p>');

				var percent = value.currentFund/ value.goal * 100;
				var otherInfo = $('<p><span class="glyphicon glyphicon-map-marker"></span> '
						+ value.location
						+ ' <span class="glyphicon glyphicon-tag"></span> '
						+ value.type + ' </p>');
				var progressDiv = $('<div class="progress"></div>');
				var progressBarDiv = $('<div id="aa" class="progress-bar progress-bar-success" role="progressbar" style="width:'+ percent + '%"></div>');
				progressBarDiv.appendTo(progressDiv);

				var otherInfoDiv = $('<div class="row"></div>');
				var childDiv1 = $('<div class="col-md-3"><span class="glyphicon glyphicon-stats"></span><br/>進度<br/>'
												+ formatFloat(percent,2) + '%</div>');
				var childDiv2 = $('<div class="col-md-3"><span class="glyphicon glyphicon-heart"></span><br/>已募得<br/>'
												+ value.currentFund+ '</div>');
				var childDiv3 = $('<div class="col-md-3"><span class="glyphicon glyphicon-user"></span><br/>捐款數<br/></div>');

				$.post('/softleader-iii-eeit78/campaign/campaignAction!selectGiverCountByCampaignId',
					{'campaignForm.id' : value.id},function(data) {
						childDiv3.append(data);})

					var today = (new Date()).getTime();

					var d = (new Date(value.endDate)).getTime();
					var remain = Math.floor((d - today)/ (1000 * 60 * 60 * 24));
					var childDiv4 = $('<div class="col-md-3"><span class="glyphicon glyphicon-time"></span><br/>倒數<br/>'
							+ remain+ '<br/></div>');

					otherInfoDiv.append(childDiv1).append(childDiv2).append(childDiv3).append(childDiv4);

					var p2 = $('<p></p>');
					var a = $('<a href="" class="btn btn-primary" role="button" style="margin-top:10px">立即捐款</a>');
					var url = '${pageContext.request.contextPath}/donate/donate?id='
							+ value.id+ '&name='+ value.name;
					a.attr('href', url);
					a.appendTo(p2);
					captionDiv.append(h3).append(p).append(p1).append(otherInfo).append(progressDiv).append(otherInfoDiv).append(p2);
					imageA.appendTo(thumbnailDiv);
					captionDiv.appendTo(thumbnailDiv);
					thumbnailDiv.appendTo(colDiv);
					colDiv.appendTo(rowDiv);
											})
						})
	}
	
	
	function loadRaiser(){
		$.post("${pageContext.request.contextPath}/raiser/raiserSelectAll!selectAll", getData);

		function getData(raisers) {
			raisers = JSON.parse(raisers);
			$(raisers).each(function(index, raiser) {
				var span = $('<span class="logo-span"></span>');
				var a = $("<a href='<c:url value='/raiser/raiserAction!select?account="
						+ raiser.account
						+ "'/>'></a>");
				var srclogo = arrayBufferToBase64(raiser.logo);
				var strimg = $("<img src='' style='width:150px'>");
				strimg.attr("src","data:image/png;base64," + srclogo);
				
				span.append(a);
				a.append(strimg);
				$('#raiserRow').append(span);
				
							});
		}
	}
	
	$('a[href^="#campaignDiv"]').click(function() {
		$('html, body').animate(
			{scrollTop : $($.attr(this, 'href')).offset().top}, 600, 'easeInOutExpo');
				return false;
			});
	
</script>

</html>