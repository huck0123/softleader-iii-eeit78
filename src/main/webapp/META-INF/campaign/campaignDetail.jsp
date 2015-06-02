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

#No_mainPlace {
	 margin-top:8px;
	 padding-top:24px;
	 padding-bottom:24px;
	 background-color:#FFE4CA;
	 display:inline-block;
}

#No_mainShownCommentPlace {
	 margin-bottom:24px;
	 padding-top:24px;
	 padding-bottom:16px;
	 background-color:#FFFFCE;
	 display:inline-block;
}

.nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover{
color: darkslategrey;
background-color: #f2f2f2;}
.nav-pills>li>a {
border-radius: 0;}
</style>
</head>
<body id="body">
	<jsp:include page="/header.jsp" />

	<div class="container" id="showColumn"></div>
	
<div class="container" >
  <ul class="nav nav-pills" style="border-top: 1px black solid; border-bottom:1px black solid; height:60px ">
    <li class="active" ><a data-toggle="pill" href="#detail-tab" style="width:120px; height:58px; line-height: 36px">詳細資訊</a></li>
    <li><a data-toggle="pill" href="#message-tab" style="width:120px;height:58px;line-height: 36px">留言</a></li>
  </ul>
  
  <div class="tab-content">
    <div id="detail-tab" class="tab-pane fade in active">
     		<div class=row id="detailRowDiv">
			<div class="col-md-8 col-md-offset-2" id="detailDiv"
				style="text-align: justify;"></div>
		</div>
    </div>
    <div id="message-tab" class="tab-pane fade">

    </div>
  </div>
</div>
	
	<div class="container">
	</div>

	<div class="container" id="tabPageDiv">



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
	
	<jsp:include page="/footer.jsp" />
</body>

<script>
	//0是第一頁
	var currentPage = 0;
	var totalCount = 0;
	var commentCurrentPage = 0;
	var permission = true;
	var commentCampaignId;
	var raiserId;
	
	var recordCommentOrReplyURL = '${pageContext.request.contextPath}/campaignComment/actNewComment!newComment';
	var loadAllCommentsURL =      '${pageContext.request.contextPath}/campaignComment/actAllComment!allComment';
	var getUserAccountURL =		  '${pageContext.request.contextPath}/giver/giverSelect!selectHeadshot';
	var getReplyURL =             '${pageContext.request.contextPath}/campaignComment/actReplyComment!replyComment';
	var alterCommentOrReplyURL =  '${pageContext.request.contextPath}/campaignComment/actRenewComment!renewComment';
	var deleteCommentOrReplyURL = '${pageContext.request.contextPath}/campaignComment/actDeleteComment!invalidComment';
	var getRaiserIdURL =          '${pageContext.request.contextPath}/campaign/campaignAction!selectRaiserIdById'; 
	
	load();
	
	function loadAllComments(commentCampaignId) {
		$.getJSON(loadAllCommentsURL, {
			'form.campaignId' : commentCampaignId
		}, loadComment);
	}
	
	function loadComment(datas){
		//console.log(datas);
		$.each(datas, function(name, data){
			assignFinalFixedPlace(data);
		});
	}
	
	$('#mainCommentPlace').on('click', function(){
		if("${giver}" || "${raiser.id}" == raiserId || "${admin}"){
		}else{
			alert("請先登入或註冊後再留言");
			$('#mainCommentPlace').blur();
		}
	});
	
// 	$('a[id^="a_"]').on('click', function(){
// 		console.log("aaaaa");
// 		var id = $(this).prop('id');
// 		id = id.substring(2);
// 		$('#sub_' + id).slideToggle();
// 	});
	
	function startNewComment() {
		if(confirm("確定送出留言嗎?")){
			if($('#mainCommentPlace').val().trim() == ""){
				alert("未輸入任何內容");
			}else{
				$.getJSON(recordCommentOrReplyURL, {
					'form.campaignId' : commentCampaignId,
					'form.giverId' : '${giver.id}',
					'form.replyId' : 0,
					'form.commentary' : $('#mainCommentPlace').val()
				}, assignFinalFixedPlace);
			}
		}else{
		}
	}
	
	function confirmCleanNewComment(){
		if(confirm("確定清除留言內容嗎?")){
			cleanNewComment();
		}else{
		}
	}
	
	function cleanNewComment(){
		$('#mainCommentPlace').val("");
	}
	
	function growNewReplyPlace(replyParam) {
		if("${giver}" || "${raiser.id}" == raiserId || "${admin}"){
			if(permission){
				permission = false;
				$('#btn_' + replyParam).prop('disabled', true);
				if($('#a_' + replyParam).text() == "查看所有回覆" || $('#a_' + replyParam).text() == ""){
					showOrHideAllReplies(replyParam);
				}else{
				}
				$('#sub_' + replyParam)
					.prepend('<div id="temp_' + replyParam + '" style="margin-top:2px ; margin-bottom:2px ; margin-left:8px ; margin-right:8px ; padding-top:12px ; padding-bottom:12px ; background-color:#FFF0AC ; display:inline-block;">'
					+ 			'<div class="col-md-2">'
					+ 				'<img id="img_temp" src="../pictures/noPicture.jpg" style="width:100%">'
					+ 			'</div>'
					+ 			'<div class="col-md-10">'
					+ 				'<textarea id="' + replyParam + '" class="form-control" rows="4" style="margin-bottom:4px"></textarea>'
					+ 				'<button type="button" class="btn btn-success btn-xs" onclick="startNewReply(' + replyParam + ');" style="width:50px">確定</button>&nbsp;'
					+ 				'<button type="button" class="btn btn-warning btn-xs" onclick="confirmCancelNewReply(' + replyParam + ');" style="width:50px">取消</button>'
					+ 			'</div>'
					+ 		'</div>');
				showUserPhoto("temp");
			}else{
				alert("請先完成或取消前一個留言再進行新的回覆");
			}
		}else{
			alert("請先登入或註冊後再留言");
		}
	}
	
	function startNewReply(replyId) {
		if(confirm("確定送出回覆嗎?")){
			if($('#' + replyId).val().trim() == ""){
				alert("未輸入任何內容");
			}else{
				permission = true;
				$('#btn_' + replyId).prop('disabled', false);
				$.getJSON(getReplyURL, {'form.id' : replyId}, function(data){
					if(data.replyId != 0){
						showOrHideAllReplies(replyId);
					}
				})
				$.getJSON(recordCommentOrReplyURL, {
					'form.campaignId' : commentCampaignId,
					'form.giverId' : "${giver.id}",
					'form.replyId' : replyId,
					'form.commentary' : $('#' + replyId).val()
				}, assignFinalFixedPlace);
			}
		}else{
		}
	}
	
	function confirmCancelNewReply(replyId){
		if(confirm("確定取消回覆嗎?")){
			cancelNewReply(replyId);
			permission = true;
			$('#btn_' + replyId).prop('disabled', false);
			showOrHideAllReplies(replyId);
		}else{
		}
	}
	
	function cancelNewReply(replyId){
		$('#temp_' + replyId).remove();
	}
	
	function assignFinalFixedPlace(data) {
		if (data.pendingId == 0) {
			showUserAccount(data, 'mainShownCommentPlace');
			cleanNewComment();
		}else{
			showUserAccount(data, data.pendingId);
			cancelNewReply(data.replyId);
		}
	}
	
	function showUserAccount(data, placeParam){
		$.ajax({async : false,
				dataType : "json",
				url : getUserAccountURL,
				data : {"form.id" : data.giverId},
				success : function(dataJSON){
					controlCommentOrReplyDetails(data, dataJSON.account, dataJSON.headshot, placeParam);
			  }});
			
//  	if(data.anonymous){
//  		controlCommentOrReplyDetails(data, "未知的使用者", null, placeParam);
//  	}else{
//  	}
	}
	
	function controlCommentOrReplyDetails(data, account, headshot, placeParam){
		if(placeParam == 'mainShownCommentPlace'){
	 		$('#No_' + placeParam).prepend(showCommentOrReplyContent(data, account));
	 		//console.log(data);
	 		if(!'${admin}'){
	 			if('${giver.account}' != account && '${raiser.account}' != account){
	 				$('#alt_' + data.id).text("");
	 				$('#del_' + data.id).text("");
	 			}
	 		}
	 		substantiatePhoto(data.id, headshot);
	 		slideAllReplies(data.id);
		}else{
			$('#sub_' + placeParam).append(showCommentOrReplyContent(data, account));
			$('#sign_' + placeParam).hide();
			$('#sign_' + data.id).remove();
			$('#count_' + placeParam).text(parseInt($('#count_' + placeParam).text())+1);
			//console.log(data);
			$('#a_' + data.id).remove();
			$('#count_' + data.id).remove();
			if(!'${admin}'){
	 			if('${giver.account}' != account && '${raiser.account}' != account){
	 				$('#alt_' + data.id).text("");
	 				$('#del_' + data.id).text("");
	 			}
			}
			substantiatePhoto(data.id, headshot);
			slideAllReplies(data.id);
			$.getJSON(getReplyURL, {"form.id" : data.replyId}, function(replyJSON){
 				$.getJSON(getUserAccountURL, {"form.id" : replyJSON.giverId}, function(replyDataJSON){
 					document.getElementById('p_' + data.id).insertAdjacentHTML("beforeBegin", "<p style='color:gray'>----回覆給  : " + replyDataJSON.account + "</p>");
 				});
			});
			
// 				if(replyJSON.anonymous){
//  				document.getElementById('p_' + data.id).insertAdjacentHTML("afterBegin", "<p style='color:gray'>----回覆給  : 未知的使用者</p>");
//  			}else{
//  			}


// 			var countTheFormer = 0;
// 			var theFormer;
// 			var pendingId;
// 			var pendingReplyId = placeParam;
//			
// 			do{
// 				$.getJSON(getReplyURL, {"form.id" : pendingReplyId}, function(replyJSON){
// 					pendingId = replyJSON.id;
// 					pendingReplyId = replyJSON.replyId;
// 					console.log(pendingReplyId);
// 					countTheFormer++;
// 					if(countTheFormer == 1){
// 						theFormer = replyJSON;
// 					}
// 				});
// 			}while(pendingReplyId != 0);
//			
// 			$('#sub_' + pendingId).append(showCommentOrReplyContent(data, account));
//			
// 			if(theFormer.anonymous){
// 				document.getElementById('p_' + data.id).insertAdjacentHTML("afterBegin", "<p style='color:gray'>----回覆給  : 未知的使用者</p>");
// 			}else{
// 				$.getJSON(getUserAccountURL, {"form.id" : theFormer.giverId}, function(theFormerJSON){
// 					document.getElementById('p_' + data.id).insertAdjacentHTML("afterBegin", "<p style='color:gray'>----回覆給  : " + theFormerJSON.account + "</p>");
// 				});
// 			}
//			
// 			$('#a_' + data.id).remove();
// 			substantiatePhoto(data.id, headshot);
		}
	}
	
	function showCommentOrReplyContent(data, userAccount) {
		var date = new Date(data.commentTime);
		var modifiedDate = date.getFullYear() + '/' + modifyTimeForm(date.getMonth()+1) + '/' + modifyTimeForm(date.getDate()) + '&nbsp;&nbsp;' + modifyTimeForm(date.getHours()) + ':' + modifyTimeForm(date.getMinutes());

		return '<div id="No_' + data.id + '" style="margin-top:2px ; margin-bottom:2px ; margin-left:8px ; margin-right:120px ; padding-top:12px ; padding-bottom:12px ; background-color:#FFF0AC ; display:inline-block;">'
		+ 			'<div class="col-md-2">'
		+ 				'<img id="img_' + data.id + '" src="../pictures/noPicture.jpg" style="width:100%">'
	 	+ 			'</div>'
		+ 			'<div class="col-md-10" id="forAlt_' + data.id + '">'
		+ 				'<p id="title_' + data.id + '">' + userAccount + '&nbsp;&nbsp;&nbsp;&nbsp;於&nbsp;&nbsp;&nbsp;&nbsp;' + modifiedDate + 	'</p>'
		+ 				'<p id="p_' + data.id + '">' + data.commentary + '</p>'
		+ 				'<button type="button" id="btn_' + data.id + '" class="btn btn-info btn-xs" style="width:70px" onclick="growNewReplyPlace(' + data.id + ');">'
		+ 					'<span class="glyphicon glyphicon-comment" aria-hidden="true"></span>&nbsp;&nbsp;回覆'
		+ 				'</button>&nbsp;&nbsp;&nbsp;'
		+               '<a id="a_' + data.id + '" onclick="slideAllReplies(' + data.id + ');">隱藏所有回覆</a>&nbsp;&nbsp;'
		+               '<span class="badge" id="count_' + data.id + '">0</span>&nbsp;&nbsp;&nbsp;&nbsp;'
		+               '<a id="alt_' + data.id + '" onclick="alterContent(' + data.id + ');">修改</a>&nbsp;&nbsp;&nbsp;'
		+               '<a id="del_' + data.id + '" onclick="deleteContent(' + data.id + ');">刪除</a>'
		+ 			'</div>'
		+ 	   '</div>'
		+      '<div id="sub_' + data.id + '" style="margin-top:0px ; margin-bottom:24px ; margin-left:80px ; margin-right:8px ; padding-top:4px ; padding-bottom:4px ; background-color:#FFF0AC ; display:inline-block;">'
		+      '<p id="sign_' + data.id + '" style="padding:5px;margin:-5px 0px;font-size:40;background-color:#FFFFCE">&nbsp;&nbsp;&nbsp;查無回覆</p></div>';
	}
	
	function substantiatePhoto(id, imgParam){
		if(imgParam != null){
			$('#img_' + id).attr("src", "data:image/png;base64," + arrayBufferToBase64(imgParam));
		}
	}
	
	function showUserPhoto(imgId){
		$.getJSON(getUserAccountURL, {"form.id" : "${giver.id}"}, function(dataJSON){
			substantiatePhoto(imgId, dataJSON.headshot);
		});
	}
	
	function modifyTimeForm(timeParam){
		if(timeParam < 10){
			return '0' + timeParam;
		}else{
			return timeParam;
		}
	}
	
	function slideAllReplies(id){
		if($('#a_' + id).text() == "查看所有回覆"){
			$('#sub_' + id).slideDown();
			$('#a_' + id).text("隱藏所有回覆");
			if(document.getElementById('sub_'+ id).getElementsByTagName('div').length == 0){
				$('#sign_' + id).show();
			}
		}else if($('#a_' + id).text() == "隱藏所有回覆"){
			$('#sub_' + id).slideUp();
			$('#a_' + id).text("查看所有回覆");
			$('#sign_' + id).hide();
		}else{
			$('#sub_' + id).slideToggle();
		}
	}
	
	function showOrHideAllReplies(id){
		if($('#a_' + id).text() == "查看所有回覆"){
			$('#sub_' + id).show();
			$('#a_' + id).text("隱藏所有回覆");
		}else if($('#a_' + id).text() == "隱藏所有回覆"){
			$('#sub_' + id).hide();
			$('#a_' + id).text("查看所有回覆");
		}else{
			$('#sub_' + id).toggle();
		}
	}
	
	function alterContent(id){
		if(permission){
			permission = false;
			$('#forAlt_' + id).append('<div id="temp2_' + id + '">'
							  +		  	 '<textarea id="' + id + '" class="form-control" rows="4" style="margin-bottom:4px"></textarea>'
				          	  + 	  	 '<button type="button" class="btn btn-success btn-xs" onclick="sendAlteredReply(' + id + ');" style="width:50px">確定</button>&nbsp;'
				          	  + 	  	 '<button type="button" class="btn btn-warning btn-xs" onclick="cancelAlteredReply(' + id + ');" style="width:50px">取消</button>'
				          	  +       '</div>');
			$('#' + id).val($('#p_' + id).text());
			$('#p_' + id).hide(); $('#btn_' + id).hide(); $('#a_' + id).hide(); $('#alt_' + id).hide(); $('#del_' + id).hide();
		}else{
			alert("請先完成或取消前一個留言再進行修改");
		}
	}
	
	function sendAlteredReply(id){
		if(confirm("確定送出修改嗎?")){
			if($('#' + id).val().trim() == ""){
				alert("未輸入任何內容");
			}else{
				permission = true;
				$.getJSON(alterCommentOrReplyURL, {
					'form.id' : id,
					'form.commentary' : $('#' + id).val()
				}, function(data){
					var date = new Date(data.commentTime);
					var modifiedDate = date.getFullYear() + '/' + modifyTimeForm(date.getMonth()+1) + '/' + modifyTimeForm(date.getDate()) + '&nbsp;&nbsp;' + modifyTimeForm(date.getHours()) + ':' + modifyTimeForm(date.getMinutes());
					$('#temp2_' + id).remove();
					$('#p_' + id).show(); $('#btn_' + id).show(); $('#a_' + id).show(); $('#alt_' + id).show(); $('#del_' + id).show();
					$('#title_' + id).html("${giver.account}&nbsp;&nbsp;&nbsp;&nbsp;於&nbsp;&nbsp;&nbsp;&nbsp;" + modifiedDate);
					$('#p_' + id).text(data.commentary);
				});
			}
		}else{
		}
	}
	
	function cancelAlteredReply(id){
		if(confirm("確定取消修改內容嗎?")){
			permission = true;
			$('#temp2_' + id).remove();
			$('#p_' + id).show(); $('#btn_' + id).show(); $('#a_' + id).show(); $('#alt_' + id).show(); $('#del_' + id).show();
		}else{
		}
	}
	
	function deleteContent(id){
		if(confirm("確定刪除留言嗎?")){
			$.getJSON(deleteCommentOrReplyURL, {
				'form.id' : id
			}, function(data){
				alert(data);
				if(data == "刪除成功"){
					$('#No_' + id).remove();
					$('#sub_' + id).remove();
				}
			});
		}else{
		}
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
							+ '/' + (d.getMonth()+1) + '/' + d.getDate()
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
				
				appendGiverData();
				loadAllComments(commentCampaignId);
				$.getJSON(getRaiserIdURL, {'campaignForm.id' : commentCampaignId}, function(data){
					raiserId = data;
				})
		})
	}
	
	//取得所需Giver資料，並放好
	function appendGiverData(){
		$.post('/softleader-iii-eeit78/campaign/campaignAction!selectGiverCountByCampaignId', {
			   'campaignForm.id' : '${param.id}'}, function(data) {
			   $('#giverStrong').text(data);	
			   showUserPhoto("user");
		})
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
</script>
</html>