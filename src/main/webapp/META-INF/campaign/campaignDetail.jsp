<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>The Givers 活動詳情</title>
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/softleader-iii-eeit78/css/giver.css">

<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>
<script src="/softleader-iii-eeit78/js/useful.js"></script>
<style>
#sideDiv {
	text-align: left;
	vertical-align: top;
	height: 100%;
}

.row-table {
	display: table;
}

.row {
	margin: 0px;
}

.row-table {
	display: table;
	width: 100%;
}

strong {
	font-size: 46px;
}

pre {
	background-color: white;
	border: white;
	padding-left: 0px;
	padding-right: 0px;
	margin-left: 0px;
	margin-right: 0px;
	font-size: 16px;
}

#commentDiv {
	text-align: left;
}

.commentFont {
	font-size: 20px;
}
</style>
</head>
<body id="body">
	<jsp:include page="/header.jsp" />

	<div class="container" id="showColumn"></div>
	<div class="container">
		<nav class="navbar navbar-default"
			style="height: 80px; margin-top: 40px; display: table; background-color: white; background-image: none; border-left: 0px; border-right: 0px">
			<div class="container"
				style="display: table-cell; vertical-align: middle; padding-top: 0px; padding-bottom: 0px">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#nav2" style="float: right;">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="nav2">
					<ul class="nav navbar-nav">
						<li><a href="#" id="tab1">詳細內容<span class="sr-only">(current)</span></a></li>
						<li><a href="#" id="tab2">評論</a></li>

					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container -->
		</nav>
	</div>
	<div class="container" id="tabPageDiv">
		<div class=row id="detailRowDiv">
			<div class="col-md-8 col-md-offset-2" id="detailDiv"
				style="text-align: justify;"></div>
		</div>

		<div id="commentDiv" style="display: none">
			<div>
				<h3 class="col-md-6 col-md-offset-3">我要留言</h3>
				<div class="col-md-6 col-md-offset-3" id="No_commentPlace">
					<div>
						<br />
						<div class="col-md-2">
							<img src="../pictures/noPicture.jpg" style="width: 100%">
						</div>
						<div class="col-md-10">
							<textarea id="standardComment" class="form-control" rows="4"></textarea>
							<button type="button" class="btn btn-success btn-xs"
								onclick="launchNewComment();" style="width: 50px">確定</button>
							<button type="button" class="btn btn-warning btn-xs"
								onclick="cancelNewComment();" style="width: 50px">取消</button>
							&nbsp;&nbsp;&nbsp; <label class="checkbox-inline"> <input
								type="checkbox" id="inlineCheckbox1" value="option">匿名留言
							</label>
						</div>
					</div>
				</div>
			</div>
			<div>
				<div class="col-md-6 col-md-offset-3" id="No_responsePlace"></div>
			</div>
		</div>
	</div>

	<div class="container" id="tabPageDiv">
		<div class=row id="detailRowDiv">
			<div class="col-md-8 col-md-offset-2" id="detailDiv"
				style="text-align: justify;"></div>
		</div>

		<div id="commentDiv" style="display: none">
			<div id="leaveComment" class="row">
				<div class="col-sm-1 col-sm-offset-1">
					<img width="60px" src="/softleader-iii-eeit78/pictures/login2.png">
				</div>
				<div class="col-sm-8" style="text-align: left">
					<form
						action="/softleader-iii-eeit78/campaignComment/campaignComment">
						<textarea class="form-control" rows="4" id="comment"></textarea>
						<button class="btn btn-primary" type="submit" name="method:"
							style="margin-top: 20px;">留言</button>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>

<script>
	//0是第一頁
	var currentPage = 0;
	var totalCount = 0;
	var commentCurrentPage = 0;
	var commentCampaignId;
	var loadAllCommentUrl = '${pageContext.request.contextPath}/campaignComment/actAllComment!allComment';
	var newCommentUrl =     '${pageContext.request.contextPath}/campaignComment/actNewComment!newComment';
	
	load();

	function loadComment(commentParam) {
		$('#No_' + commentParam)
			.append('<div id="temp_'+commentParam+'" class="col-md-11 col-md-offset-1"><hr/>'
					+ '<div class="col-md-2">'
					+ 	'<img src="../pictures/noPicture.jpg" style="width:100%">'
					+ '</div>'
					+ '<div class="col-md-10">'
					+ 	'<textarea id='+commentParam+' class="form-control" rows="4"></textarea>'
					+ 	'<button type="button" class="btn btn-success btn-xs" onclick="sendNewComment('+ commentParam+ ');" style="width:50px">確定</button>&nbsp;'
					+ 	'<button type="button" class="btn btn-warning btn-xs" onclick="cancelNewComment();" style="width:50px">取消</button>&nbsp;&nbsp;&nbsp;&nbsp;'
					+ 	'<label class="checkbox-inline">'
					+ 		'<input type="checkbox" id="inlineCheckbox1" value="option">匿名留言'
					+ 	'</label>' 
					+ '</div>' + '<hr/></div>');
	}
	
	function showComment(data) {
		console.log(456);
		if (data.replyId == 0) {
			decideShowComment(data, 'responsePlace');
		} else {
			$('#temp_' + data.replyId).remove();
			decideShowComment(data, data.replyId);
		}
	}
	
	function decideShowComment(data, responseParam) {
		if(responseParam != 'responsePlace'){
			$('#No_' + responseParam).append(fixedContent(data));
			$('#No_' + data.id).attr("class", "col-md-11 col-md-offset-1");
		}else{
			$('#No_' + responseParam).prepend(fixedContent(data));
		}
	}
	
	function fixedContent(data){
		return '<div id="No_'+data.id+'"><br/><hr/>'
			 + '<div class="col-md-2">'
			 + 	'<img src="../pictures/noPicture.jpg" style="width:100%">'
		 	 + '</div>'
			 + '<div class="col-md-10" id="replyPlace">'
			 + 	'<p>${giver.name}&nbsp;&nbsp;於&nbsp;&nbsp;'
			 + 		data.commentTime
			 + 	'</p>'
			 + 	'<p>'
			 + 		data.commentary
			 + 	'</p>'
			 + 	'<button type="button" class="btn btn-info btn-xs" style="width:70px" onclick="loadComment('+ data.id+ ');">'
			 + 		'<span class="glyphicon glyphicon-comment" aria-hidden="true"></span>&nbsp;&nbsp;回覆'
			 + 	'</button>&nbsp;&nbsp;&nbsp;'
			 + 	'<span class="commentFont">15</span>&nbsp;&nbsp;&nbsp;'
			 + 	'<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>&nbsp;&nbsp;'
			 + 	'<span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;'
			 + 	'<a>查看所有回覆</a>' 
			 + '</div>' + '<br/><hr/></div>';
	}
	
	function showAllComment(datas){
		$.each(datas, function(name, data){
			showComment(data);
		})
	}

	$('#tab1').on('click', function(evt) {
		evt.preventDefault();
		$('#nav2 *, .active').removeClass("active");
		$('#tab1').parent().addClass('active');
		$('#tabPageDiv>div').hide();
		$('#detailRowDiv').slideDown();
	});

	$('#tab2').on('click', function(evt) {
		evt.preventDefault();
		$('#nav2 *, .active').removeClass("active");
		$('#tab2').parent().addClass('active');
		$('#tabPageDiv>div').hide();
		$('#commentDiv').slideDown();

	});

	function load() {
		appendCampaignDetail();
	}
	
	//將campaign detail所需的資料取出，並放好
	function appendCampaignDetail(){
		$.post('/softleader-iii-eeit78/campaign/campaignAction!selectByAllCondition', {
			'campaignForm.id' : "${param.id}"}, function(data) {
				data = JSON.parse(data);
				value = data[0];
				commentCampaignId = value.id;
				
				var rowDiv1 = $('<div  class="row"></div>');
				var titleP = $('<h3>' + value.name + '</h3>');
				var raiserP = $('<p><span class="glyphicon glyphicon-pencil"></span> '
					+ value.raiserModel.name + '</p>');
				titleP.appendTo(rowDiv1);
				raiserP.appendTo(rowDiv1);
				rowDiv1.appendTo($('#showColumn'));

				var rowDiv2 = $('<div id="rowDiv2" class="row row-table"></div>');
				var vedioDiv = $('<div class="col-sm-8 col-md-8 left-side"></div>');
				var iframeDiv = $('<div class="embed-responsive embed-responsive-16by9"></div>');
				var iframe = $('<iframe src="' + value.vedioUrl
					+ '?showinfo=0' + '"></iframe>');
				iframeDiv.appendTo(vedioDiv);
				iframe.appendTo(iframeDiv);
				
				var sideDiv = $('<div id="sideDiv" class="col-sm-4 col-md-4 right-side"></div>');
				var giverP = $('<p>已有<strong id="giverStrong"></strong>人支持</p>');
				var moneyP = $('<p>已募得<strong>'
					+ commafy(value.currentFund)
					+ '</strong>元/' + commafy(value.goal)
					+ '元</p>');
				var d = new Date(value.endDate);
				var dateP = $('<p>於<strong>' + d.getFullYear()
							+ '/' + d.getMonth() + '/' + d.getDate()
							+ '</strong>結束</p>');

				var percent = value.currentFund / value.goal * 100;
				var progressDiv = $('<div class="progress"></div>');
				var progressBarDiv = $('<div id="aa" class="progress-bar progress-bar-success" role="progressbar" style="width:'
							+ percent + '%"></div>');

				progressBarDiv.appendTo(progressDiv);

				var otherInfo = $('<p><span class="glyphicon glyphicon-map-marker"></span> '
							+ value.location
							+ ' <span class="glyphicon glyphicon-tag"></span> '
							+ value.type
							+ ' <span class="glyphicon glyphicon-stats"></span> '
							+ percent + '%已完成</p>');

				var url = '${pageContext.request.contextPath}/donate/donate?id='
							+ value.id + '&name=' + value.name;
				var donateBtn = $('<a class="btn btn-primary" role="button"><strong>立即捐款</strong></a>');
				donateBtn.attr('href', url);
				giverP.appendTo(sideDiv);
				moneyP.appendTo(sideDiv);
				dateP.appendTo(sideDiv);
				otherInfo.appendTo(sideDiv);
				progressDiv.appendTo(sideDiv);
				donateBtn.appendTo(sideDiv);
				vedioDiv.appendTo(rowDiv2);
				sideDiv.appendTo(rowDiv2);
				rowDiv2.appendTo($('#showColumn'));
				$('#detailDiv').append('<pre>' + value.detail + '</pre>');
				loadAllComment(commentCampaignId);
				
				appendGiverData();
		})
		
	}
	
	//取得所需Giver資料，並放好
	function appendGiverData(){
		$.post('/softleader-iii-eeit78/campaign/campaignAction!selectGiverCountByCampaignId', {
			'campaignForm.id' : '${param.id}'}, function(data) {
				$('#giverStrong').text(data);})
	}

	function arrayBufferToBase64(buffer) {
		var binary = '';
		var bytes = new Uint8Array(buffer);
		var len = bytes.byteLength;
		for (var i = 0; i < len; i++) {
			binary += String.fromCharCode(bytes[i]);
		}
		return window.btoa(binary);
	}
	
	function commafy(num) {
		num = num + "";
		var re = /(-?\d+)(\d{3})/
		while (re.test(num)) {
			num = num.replace(re, "$1,$2")
		}
		return num;
	}

	function launchNewComment() {
		$.getJSON(newCommentUrl, {
			'form.campaignId' : commentCampaignId,
			'form.giverId' : "${giver.id}",
			'form.replyId' : 0,
			'form.commentary' : $('#standardComment').val(),
			'form.anonymous' : "false"
		}, showComment);
	}
	
	function sendNewComment(replyId) {
		$.getJSON(newCommentUrl, {
			'form.campaignId' : commentCampaignId,
			'form.giverId' : "${giver.id}",
			'form.replyId' : replyId,
			'form.commentary' : $('#' + replyId).val(),
			'form.anonymous' : "false"
		}, showComment);
	}

	function loadAllComment(commentCampaignId) {
		$.getJSON(loadAllCommentUrl, {
			'form.campaignId' : commentCampaignId
		}, showAllComment);
	}
</script>
</html>