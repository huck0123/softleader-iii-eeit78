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
<link rel="stylesheet" href="/softleader-iii-eeit78/css/animate.css">
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>
<script src="/softleader-iii-eeit78/js/useful.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<script src="js/wow.min.js"></script>
<script>
	new WOW().init();
</script>
<!-- <link rel="stylesheet" href="/softleader-iii-eeit78/css/giver.css"> -->
<style type="text/css">
html, body {
	text-align: center;
	width: 100%;
	height: 100%;
}

.thumbnail {
	text-align: justify;
	margin: 15px;
}

.cover-table-wrapper {
	height: 100%;
	width: 100%;
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
	position: relative; /*沒設relative的話會沒反應*/
}

.row {
	margin-left: 0px;
	margin-right: 0px;
}

.innerCaption {
	height: 220px;
	overflow: hidden;
	margin-bottom: -40px;
}

.makeShadow {
	background: linear-gradient(to bottom, rgba(255, 255, 255, 0), #fff 50%);
	position: relative; /*因為pre已經設relative了，若這邊沒設的話，會被pre蓋過去*/
	padding-top: 50px;
}

@media {
	.campaign-image {
		width: 100%;
		height: auto;
	}
}

@media ( min-width : 992px) {
	.campaign-image {
		width: 100%;
		height: 200px;
	}
}
</style>
</head>

<body id="body">

	<div class="background-div"></div>

	<jsp:include page="/header.jsp" />


	<div class="cover-table-wrapper">

		<div class="cover-tr-wrapper">
			<div class="cover-td-wrapper">
				<div id="cover-content" class="container">
					<h2 data-wow-duration="1.5s"
						style="margin-bottom: 20px">改變，從你我開始</h2>
					<h4 data-wow-duration="1.5s" data-wow-delay="1.5s"
						style="margin-bottom: 20px">讓每一分錢變得更有意義！</h4>
					<a class="btn btn-default" href="#campaignDiv" data-wow-duration="1.5s" data-wow-delay="2.7s">查看活動</a>
				</div>
			</div>
		</div>
	</div>

	<div id="campaignDiv" style="background-color: #f2f2f2">
		<div>
			<div class="container" style="border-bottom: 1px solid silver;">
				<h2 style="margin: 100px 0px 60px 0px">現正進行</h2>
				<div id="campaignRow" class="row" style="margin-bottom: 60px"></div>
			</div>
		</div>
	</div>
	<!-- 	跑馬燈 -->
	<!-- 	<div><marquee onMouseOver="this.stop()" onMouseOut="this.start()" behavior="alternate" scrollamount="10" id="marquee1" ></marquee></div> -->

	<div id="raiserDiv">
		<div>
			<div class="container" style="border-bottom: 1px solid silver">
				<h2 style="margin: 100px 0px 0px 0px">參與團體</h2>
				<div id="raiserRow" class="row" style="margin: 30px 0px 30px 0px"></div>
			</div>
		</div>
	</div>

	<jsp:include page="/footer.jsp" />
</body>


<script>
	loadCampaign();
	loadRaiser();

	function loadCampaign() {

		$
				.post(
						'/softleader-iii-eeit78/campaign/campaignAction!selectByAllCondition',
						{
							'campaignForm.pageSize' : 3,
						},
						function(data) {
							data = JSON.parse(data);
							$(data)
									.each(
											function(index, value) {
												var rowDiv = $('#campaignRow');
												var colDiv = $('<div class="col-xs-12 col-md-4 wow fadeIn" data-wow-duration="2s" data-wow-delay="'+index/2+'s"></div>');
												var thumbnailDiv = $('<div class="thumbnail"></div>');

												var str = arrayBufferToBase64(value.image);
												var image = $('<img class="campaign-image" src="data:image/png;base64,' + str +'"/>');
												var imageA = $('<a></a>');
												image.appendTo(imageA);
												imageA.attr('href',
														'${pageContext.request.contextPath}/campaign/campaignDetail?id='
																+ value.id);

												var outerCaptionDiv = $('<div class="caption"></div>');
												var captionDiv = $('<div class="innerCaption"></div>');
												var captionLower = $('<div class="captionLower"></div>');
												var h3 = $('<h3>' + value.name
														+ '</h3>');
												var p = $('<p><span class="glyphicon glyphicon-pencil"></span> '
														+ value.raiserModel.name
														+ '</p>');
												var p1 = $('<p><pre>'
														+ value.detail
														+ '...</pre></p>');

												var percent = value.currentFund
														/ value.goal * 100;
												var otherInfo = $('<p class="makeShadow"><span class="glyphicon glyphicon-map-marker"></span> '
														+ value.location
														+ ' <span class="glyphicon glyphicon-tag"></span> '
														+ value.type + ' </p>');
												var progressDiv = $('<div class="progress"></div>');
												var progressBarDiv = $('<div id="aa" class="progress-bar progress-bar-success" role="progressbar" style="width:'
														+ percent + '%"></div>');
												progressBarDiv
														.appendTo(progressDiv);

												var otherInfoDiv = $('<div class="row"></div>');
												var childDiv1 = $('<div class="col-xs-3 col-md-3" style="padding: 0"><span class="glyphicon glyphicon-stats"></span><br/>進度<br/>'
														+ formatFloat(percent,
																2) + '%</div>');
												var childDiv2 = $('<div class="col-xs-3 col-md-3" style="padding: 0"><span class="glyphicon glyphicon-heart"></span><br/>已募得<br/>'
														+ value.currentFund
														+ '</div>');
												var childDiv3 = $('<div class="col-xs-3 col-md-3" style="padding: 0"><span class="glyphicon glyphicon-user"></span><br/>捐款數<br/></div>');

												$
														.post(
																'/softleader-iii-eeit78/campaign/campaignAction!selectGiverCountByCampaignId',
																{
																	'campaignForm.id' : value.id
																},
																function(data) {
																	childDiv3
																			.append(data);
																})

												var today = (new Date()).getTime();
												var d = (new Date(value.endDate)).getTime();
												
												var timeRemain = d - today;
												var days = Math.floor((d - today)/ (1000 * 60 * 60 * 24));
												var hour = Math.floor(timeRemain/3600000);
												var minutes = Math.floor((timeRemain - hour*3600000)/60000);
												var seconds = Math.floor((timeRemain - hour*3600000 - minutes *60000) / 1000);
												if( timeRemain > 86400000){
												var childDiv4 = $('<div class="col-xs-3 col-md-3" style="padding: 0"><span class="glyphicon glyphicon-time"></span><br/>倒數<br/>'
															+ days+ ' days</div>');
												} else if(timeRemain > 3600000 && timeRemain <86400000){
												var childDiv4 = $('<div class="col-xs-3 col-md-3" style="padding: 0"><span class="glyphicon glyphicon-time"></span><br/>倒數<br/>'
															+ hour+ ' hours</div>');
												} else if(timeRemain > 60000 && timeRemain < 3600000){
													var childDiv4 = $('<div class="col-xs-3 col-md-3" style="padding: 0"><span class="glyphicon glyphicon-time"></span><br/>倒數<br/>'
															+ minutes+ ' mins</div>');
												} else if(timeRemain > 0 && timeRemain < 60000){
													var childDiv4 = $('<div class="col-xs-3 col-md-3" style="padding: 0"><span class="glyphicon glyphicon-time"></span><br/>倒數<br/>'
															+ seconds+ ' secs</div>');
												}
												else{
													var childDiv4 = $('<div class="col-xs-3 col-md-3" style="padding: 0"><span class="glyphicon glyphicon-time"></span><br/>倒數<br/>'
															+ '已結束'+ '<br/></div>');
												}

												otherInfoDiv.append(childDiv1)
														.append(childDiv2)
														.append(childDiv3)
														.append(childDiv4);

												var p2 = $('<p></p>');
												var a = $('<a href="" class="btn btn-primary" role="button" style="margin-top:10px">立即捐款</a>');
												var url = '${pageContext.request.contextPath}/donate/donate?id='
														+ value.id
														+ '&name='
														+ value.name;
												a.attr('href', url);
												a.appendTo(p2);
												outerCaptionDiv.append(
														captionDiv).append(
														captionLower);
												captionLower.append(otherInfo)
														.append(progressDiv)
														.append(otherInfoDiv)
														.append(p2);
												captionDiv.append(h3).append(p)
														.append(p1);
												imageA.appendTo(thumbnailDiv);
												outerCaptionDiv
														.appendTo(thumbnailDiv);
												thumbnailDiv.appendTo(colDiv);
												colDiv.appendTo(rowDiv);
											})
						})
	}

	function loadRaiser() {
		$
				.post(
						"${pageContext.request.contextPath}/raiser/raiserSelectForOne!selectAll",
						getData);

		function getData(raisers) {
			raisers = JSON.parse(raisers);
			$(raisers)
					.each( 
							function(index, raiser) {
								var span = $('<span class="logo-span"></span>');
								var a = $("<a href='<c:url value='/raiser/raiserAction!select?account="
										+ raiser.account + "'/>'></a>");
								var srclogo = arrayBufferToBase64(raiser.logo);
								var strimg = $("<img class='wow fadeInRight' data-wow-duration='0.8s' data-wow-delay='"+index/3+"s' src='' style='width:150px'>");
								strimg.attr("src", "data:image/png;base64,"
										+ srclogo);

								span.append(a);
								a.append(strimg);
								$('#raiserRow').append(span);

							});
		}
	}

	$('a[href^="#campaignDiv"]').click(function() {
		$('html, body').animate({
			scrollTop : $($.attr(this, 'href')).offset().top
		}, 600, 'easeInOutExpo');
		return false;
	});
	// 	跑馬燈
	$
			.post(
					"/softleader-iii-eeit78/util/utilAction!util",
					function(data) {
						data = JSON.parse(data);
						$('#marquee1')
								.html(
										"<h3>募款金額最高的活動:"
												+ "<a href='/softleader-iii-eeit78/campaign/campaignDetail?id="
												+ data.highestCurrentFundID
												+ "'>"
												+ data.highestCurrentFund
												+ "</a>"
												+ "&nbsp&nbsp&nbsp捐款最的多活動:"
												+ "<a href='/softleader-iii-eeit78/campaign/campaignDetail?id="
												+ data.highestGoalID + "'>"
												+ data.highestGoal + "</a>"
												+ "</h3>");
					});

	//調整入板畫面會因header變成fixed造成長度變短的問題
	var windowHeight = $(window).height();
	console.log(windowHeight);

	$('.cover-table-wrapper').height(windowHeight - headerHeight);
	console.log($('.cover-table-wrapper').height())
	console.log(windowHeight - headerHeight);
</script>

</html>