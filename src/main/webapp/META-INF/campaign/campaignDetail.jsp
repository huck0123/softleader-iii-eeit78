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
<style>
#sideDiv{
text-align: left;
border-bottom: silver 1px solid;
vertical-align: top;
height:100%;}
.row-table{ display:table;}


.row-table {
    display: table;
}

.left-side {
    float: none;
    display: table-cell;

}

.right-side {
    float: none;
    display: table-cell;
    border-bottom: silver 1px solid;
}

strong { font-size: 46px;}
</style>
</head>
<body id="body">

	<jsp:include page="/header.jsp" />

	依名稱蒐尋：
	<input type="text" id="nameSearch">
	

	<div class="container" id="showColumn">

	</div>

<nav class="navbar navbar-default" style="height:80px;">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
        <li><a href="#">Link</a></li>

      </ul>

    </div><!-- /.navbar-collapse -->
  </div><!-- /.container -->
</nav>

</body>


<script>
var totalCount = 0;

//0是第一頁
var currentPage = 0;

load();

function load(){
	
		$.post('/softleader-iii-eeit78/campaign/campaignAction!selectByAllCondition',
				{'campaignForm.id':"${param.id}"},function(data){

			data = JSON.parse(data);
			value = data[0];
				var rowDiv1 = $('<div  class="row"></div>');
				var titleP = $('<h3>'+value.name+'</h3>');
				var raiserP = $('<p><span class="glyphicon glyphicon-pencil"></span> '+value.raiserModel.name+'</p>');
				titleP.appendTo(rowDiv1);
				raiserP.appendTo(rowDiv1);
				rowDiv1.appendTo($('#showColumn'));

				var rowDiv2 = $('<div id="rowDiv2" class="row row-table"></div>');
				var vedioDiv = $('<div class="col-md-8 left-side"></div>');
				var iframeDiv = $('<div class="embed-responsive embed-responsive-16by9"></div>');
				var iframe = $('<iframe src="'+value.vedioUrl+'"></iframe>');
				iframeDiv.appendTo(vedioDiv);
				iframe.appendTo(iframeDiv);
				var sideDiv = $('<div id="sideDiv" class="col-md-4 right-side"></div>');
				var giverP = $('<p>已有<strong id="giverStrong"></strong>人支持</p>');
				var moneyP = $('<p>已募得<strong>'+commafy(value.currentFund)+'</strong>元/'+commafy(value.goal)+'元</p>');
				var d = new Date(value.endDate);
				
				var dateP = $('<p>於<strong>'+d.getFullYear()+'/'+d.getMonth()+'/'+d.getDate()+'</strong>結束</p>');
				

				var percent = value.currentFund/value.goal*100;
				var progressDiv = $('<div class="progress"></div>');
				var progressBarDiv = $('<div id="aa" class="progress-bar progress-bar-success" role="progressbar" style="width:'+percent+'%"></div>');
			
				progressBarDiv.appendTo(progressDiv);
				
				
				var otherInfo = $('<p><span class="glyphicon glyphicon-map-marker"></span> '+value.location+' <span class="glyphicon glyphicon-tag"></span> '+value.type+' <span class="glyphicon glyphicon-stats"></span> '+percent+'%已完成</p>');
				

				
				
				
				var url = '${pageContext.request.contextPath}/donate/donate?id='+value.id+'&name='+value.name;
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
				
				$.post('/softleader-iii-eeit78/campaign/campaignAction!selectGiverCountByCampaignId',
						{'campaignForm.id':'${param.id}'},function(data){
							console.log("getgiver: "+data);
							$('#giverStrong').text(data);
						})

				
				

		})
	}

	$('#btn1').on('click',function(){
		
	});
	


function makeFunction(j){return function(){
	$.post('',
			{'campaignForm.pageNum':j,'campaignForm.name':$('#nameSearch').val()},function(data){
				data = JSON.parse(data);
				currentPage=j;
 		$('#row').empty();
		$(data).each(function(index,value){
			var rowDiv = $('#row');
			var colDiv = $('<div class="col-sm-6 col-md-4"></div>');
			var thumbnailDiv = $('<div class="thumbnail"></div>');
			
			var str = arrayBufferToBase64(value.image); 
			var image = $('<img  src="data:image/png;base64,' + str +'"/>');
			image.on('click',function(){goDetail(value)});
			
			var captionDiv = $('<div class="caption"></div>');
			var h3 = $('<h3>'+value.name+'</h3>');
			var p1 = $('<p>'+ value.detail+'</p>');
			var p2 = $('<p></p>');
			var a = $('<a href="#" class="btn btn-primary" role="button">我要捐款</a>')
			a.appendTo(p2);
			h3.appendTo(captionDiv);
			p1.appendTo(captionDiv);
			p2.appendTo(captionDiv);
			image.appendTo(thumbnailDiv);
			captionDiv.appendTo(thumbnailDiv);
			thumbnailDiv.appendTo(colDiv);
			colDiv.appendTo(rowDiv);
		})
	})

}}


function goDetail(campaignModel){
	console.log("modelName" + campaignModel.name);
	$('#div1').empty();
	$('#row').empty();
	var child = $('<p></p>');
	child.text(campaignModel.id +", "+campaignModel.name);
	child.appendTo($('#row'));
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



