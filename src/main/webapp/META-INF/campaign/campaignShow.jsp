<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>活動列表</title>
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/giver.css">
	<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>
<script src="/softleader-iii-eeit78/js/useful.js"></script>
<style>
html, body {
	width: 100%;
	height: 100%;
}

.thumbnail {
	text-align: justify;
 	margin:0 8% 10% 8%; 
}

.blank-space5 {
	width: 100%;
	height: 5%;
}
pre {background-color: white;
border: white;
padding-left: 0px;
padding-right: 0px;
margin-left: 0px;
margin-right: 0px;
}
.col-md-4{height: 760px}
</style>
</head>
<body id="body">

<jsp:include page="/header.jsp" />

	<div class="blank-space5"></div>


	依名稱蒐尋：
	<input type="text" id="nameSearch">
	<button id="btn1">Click</button>
	<button id="btn2">返回活動列表</button>
	<div class="container" id="div1"></div>
	<div class="blank-space5"></div>
	<div class="container" id="showColumn">
		<div id="campaignRow" class=row></div>
	</div>




</body>


<script>
var totalCount = 0;

//0是第一頁

var currentPage =0;
load();

function load(){


	$.post('/softleader-iii-eeit78/campaign/campaignAction!selectByAllConditionCount',
			{'campaignForm.name':$('#nameSearch').val()},function(data){
		
		totalCount = data;
		$('#div1').empty()
		for (var i = 0; i < Math.ceil(totalCount/6); i++) { 

		var child = $('<a>'+(i+1)+'</a>')
		child.on('click',makeFunction(i))
		child.appendTo($('#div1'));
		$('#div1').append(" ");
		}
		
		$.post('/softleader-iii-eeit78/campaign/campaignAction!selectByAllCondition',
				{'campaignForm.pageNum':currentPage,'campaignForm.name':$('#nameSearch').val()},function(data){
			data = JSON.parse(data);
 					$('#campaignRow').empty();
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
				var p1 = $('<p><pre>' + value.detail.substring(0,100)+ '</pre></p>');

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
					captionDiv.append(h3).append(p).append(p1).append(otherInfo).append(progressDiv).append(otherInfoDiv).append(p2);
					imageA.appendTo(thumbnailDiv);
					captionDiv.appendTo(thumbnailDiv);
					thumbnailDiv.appendTo(colDiv);
					colDiv.appendTo(rowDiv);
			})
		})
	})}

	$('#btn1').on('click',function(){
		currentPage = 0;
		load();
	});
	
	$('#btn2').on('click',function(){
		load();
	});

function makeFunction(j){return function(){
	$.post('${pageContext.request.contextPath}/campaign/campaignAction!selectByAllCondition',
			{'campaignForm.pageNum':j,'campaignForm.name':$('#nameSearch').val()},function(data){
				data = JSON.parse(data);
				currentPage=j;
 		$('#campaignRow').empty();
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
			var p1 = $('<p><pre>' + value.detail.substring(0,100)+ '</pre></p>');

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

}}


function loadCampaign() {

	$.post('/softleader-iii-eeit78/campaign/campaignAction!selectByAllCondition',
			{'campaignForm.pageSize' : 3,},function(data) {
				data = JSON.parse(data);
				$(data).each(function(index, value) {
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
					var p1 = $('<p><pre>' + value.detail.substring(0,100)+ '</pre></p>');

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


function arrayBufferToBase64( buffer ) {
    var binary = '';
    var bytes = new Uint8Array( buffer );
    var len = bytes.byteLength;
    for (var i = 0; i < len; i++) {
        binary += String.fromCharCode( bytes[ i ] );
    }
    return window.btoa( binary );
}

</script>
</html>