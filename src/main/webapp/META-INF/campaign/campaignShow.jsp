<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html id="body">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>The Givers 募款活動</title>
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
html,body{
height: 100%}
.thumbnail {
	text-align: justify;
	margin: 15px;
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


a:hover {
	cursor: pointer;
}
.row{
margin-left: 0px;
margin-right: 0px;
}
#conditionSearchDiv{
display: table;
min-height:30%;
text-align: center;
}
.innerCaption{
height: 220px;
overflow: hidden;
margin-bottom: -40px;
}
.makeShadow{
  background: linear-gradient(to bottom, rgba(255,255,255,0), #fff 50%);
	position:relative; /*因為pre已經設relative了，若這邊沒設的話，會被pre蓋過去*/
	padding-top: 50px;
}
</style>
</head>
<body>
<jsp:include page="/header.jsp" />

	<div id="conditionSearchDiv" class="container">
		<div class="row" style="display: table-row; vertical-align: middle;">
			<div style="display: inline-block; width: 40%;">
				<div id="custom-search-input">
					<div class="input-group col-md-12">
						<input type="text" class="form-control input-lg"
							placeholder="請輸入關鍵字" id="nameSearch3" /> <span
							class="input-group-btn">
							<button class="btn btn-info btn-lg" type="button" id="btn11">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</span>
					</div>
				</div>
			</div>
		</div>
		<select id="campaign-type-input" class="form-control" name="campaignForm.type">
</select>
	</div>

	<div class="container" >
		<nav>
			<ul class="pagination">
			<li><a id="before" aria-label="Previous"><spanaria-hidden="true">&laquo;</span></a></li>
			</ul>
			<ul id="navigation" class="pagination">
			</ul>
			<ul class="pagination">
			<li><a id="after" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
			</ul>
		</nav>
	</div>

	<div class="container" id="showColumn">
		<div id="campaignRow" class=row></div>
	</div>




</body>


<script>
var totalCount = 0;
var totalPage = 0;
//0是第一頁
var currentPage =0;
var nameSearch="";
var typeSearch="";
var pageSize = 6;
load();

function load(){


	$.post('/softleader-iii-eeit78/campaign/campaignAction!selectByAllConditionCount',
			{'campaignForm.name':nameSearch,'campaignForm.type':typeSearch},function(data){
		
		totalCount = data;
		totalPage = Math.ceil(totalCount / pageSize);
		console.log("total: "+totalPage);
		$('#navigation').empty();
		
		for (var i = 0; i < Math.ceil(totalCount/pageSize); i++) { 
		var child = $('<li><a>'+(i+1)+'</a></li>')
		child.on('click',makeFunction(i))
		child.appendTo($('#navigation'));
		}
		
		$.post('/softleader-iii-eeit78/campaign/campaignAction!selectByAllCondition',
				{'campaignForm.pageNum':currentPage,'campaignForm.name':nameSearch,'campaignForm.pageSize':pageSize,
			'campaignForm.type':typeSearch},
				 function(data){
			data = JSON.parse(data);
 					$('#campaignRow').empty();
			$(data).each(function(index,value){
				var rowDiv = $('#campaignRow');
				var colDiv = $('<div class="col-sm-12 col-md-4"></div>');
				var thumbnailDiv = $('<div class="thumbnail"></div>');

				var str = arrayBufferToBase64(value.image);
				var image = $('<img style="height:200px; width:100%" src="data:image/png;base64,' + str +'"/>');
				var imageA = $('<a></a>');
				image.appendTo(imageA);
				imageA.attr('href','${pageContext.request.contextPath}/campaign/campaignDetail?id='+ value.id);
				
				var outerCaptionDiv =$('<div class="caption"></div>');
				var captionDiv = $('<div class="innerCaption"></div>');
				var captionLower = $('<div class="captionLower"></div>');
				var h3 = $('<h3>' + value.name+ '</h3>');
				var p = $('<p><span class="glyphicon glyphicon-pencil"></span> '+value.raiserModel.name+'</p>');
				var p1 = $('<p><pre>' + value.detail+ '...</pre></p>');

				var percent = value.currentFund/ value.goal * 100;
				var otherInfo = $('<p class="makeShadow"><span class="glyphicon glyphicon-map-marker"></span> '
						+ value.location
						+ ' <span class="glyphicon glyphicon-tag"></span> '
						+ value.type + ' </p>');
				var progressDiv = $('<div class="progress"></div>');
				var progressBarDiv = $('<div id="aa" class="progress-bar progress-bar-success" role="progressbar" style="width:'+ percent + '%"></div>');
				progressBarDiv.appendTo(progressDiv);

				var otherInfoDiv = $('<div class="row"></div>');
				var childDiv1 = $('<div class="col-xs-3 col-md-3" style="padding: 0"><span class="glyphicon glyphicon-stats"></span><br/>進度<br/>'
												+ formatFloat(percent,2) + '%</div>');
				var childDiv2 = $('<div class="col-xs-3 col-md-3" style="padding: 0"><span class="glyphicon glyphicon-heart"></span><br/>已募得<br/>'
												+ value.currentFund+ '</div>');
				var childDiv3 = $('<div class="col-xs-3 col-md-3" style="padding: 0"><span class="glyphicon glyphicon-user"></span><br/>捐款數<br/></div>');

				$.post('/softleader-iii-eeit78/campaign/campaignAction!selectGiverCountByCampaignId',
					{'campaignForm.id' : value.id},function(data) {
						childDiv3.append(data);})

					var today = (new Date()).getTime();

					var d = (new Date(value.endDate)).getTime();
					var remain = Math.floor((d - today)/ (1000 * 60 * 60 * 24));
					var childDiv4 = $('<div class="col-xs-3 col-md-3" style="padding: 0"><span class="glyphicon glyphicon-time"></span><br/>倒數<br/>'
							+ remain+ '<br/></div>');

					otherInfoDiv.append(childDiv1).append(childDiv2).append(childDiv3).append(childDiv4);

					var p2 = $('<p></p>');
					var a = $('<a href="" class="btn btn-primary" role="button" style="margin-top:10px">立即捐款</a>');
					var url = '${pageContext.request.contextPath}/donate/donate?id='
							+ value.id+ '&name='+ value.name;
					a.attr('href', url);
					a.appendTo(p2);
					outerCaptionDiv.append(captionDiv).append(captionLower);
					captionLower.append(otherInfo).append(progressDiv).append(otherInfoDiv).append(p2);
					captionDiv.append(h3).append(p).append(p1);
					imageA.appendTo(thumbnailDiv);
					outerCaptionDiv.appendTo(thumbnailDiv);
					thumbnailDiv.appendTo(colDiv);
					colDiv.appendTo(rowDiv);
			})
		})
	})}

	$('#btn11').on('click',filter);
	$('#campaign-type-input').on('change',filter)
	function filter(){
		nameSearch=$('#nameSearch3').val();
		typeSearch=$('#campaign-type-input').val();
		currentPage =0;
		console.log($('#campaign-type-input').val());
		load();
	}

function makeFunction(j){return function(){
	$.post('${pageContext.request.contextPath}/campaign/campaignAction!selectByAllCondition',
			{'campaignForm.pageNum':j,'campaignForm.name':nameSearch,'campaignForm.pageSize':pageSize,'campaignForm.type':typeSearch},function(data){
				data = JSON.parse(data);
				currentPage=j;
 		$('#campaignRow').empty();
		$(data).each(function(index,value){
			var rowDiv = $('#campaignRow');
			var colDiv = $('<div class="col-sm-12 col-md-4"></div>');
			var thumbnailDiv = $('<div class="thumbnail"></div>');

			var str = arrayBufferToBase64(value.image);
			var image = $('<img style="height:200px; width:100%" src="data:image/png;base64,' + str +'"/>');
			var imageA = $('<a></a>');
			image.appendTo(imageA);
			imageA.attr('href','${pageContext.request.contextPath}/campaign/campaignDetail?id='+ value.id);
			
			var outerCaptionDiv =$('<div class="caption"></div>');
			var captionDiv = $('<div class="innerCaption"></div>');
			var captionLower = $('<div class="captionLower"></div>');
			var h3 = $('<h3>' + value.name+ '</h3>');
			var p = $('<p><span class="glyphicon glyphicon-pencil"></span> '+value.raiserModel.name+'</p>');
			var p1 = $('<p><pre>' + value.detail+ '...</pre></p>');

			var percent = value.currentFund/ value.goal * 100;
			var otherInfo = $('<p class="makeShadow"><span class="glyphicon glyphicon-map-marker"></span> '
					+ value.location
					+ ' <span class="glyphicon glyphicon-tag"></span> '
					+ value.type + ' </p>');
			var progressDiv = $('<div class="progress"></div>');
			var progressBarDiv = $('<div id="aa" class="progress-bar progress-bar-success" role="progressbar" style="width:'+ percent + '%"></div>');
			progressBarDiv.appendTo(progressDiv);

			var otherInfoDiv = $('<div class="row"></div>');
			var childDiv1 = $('<div class="col-xs-3 col-md-3" style="padding: 0"><span class="glyphicon glyphicon-stats"></span><br/>進度<br/>'
											+ formatFloat(percent,2) + '%</div>');
			var childDiv2 = $('<div class="col-xs-3 col-md-3" style="padding: 0"><span class="glyphicon glyphicon-heart"></span><br/>已募得<br/>'
											+ value.currentFund+ '</div>');
			var childDiv3 = $('<div class="col-xs-3 col-md-3" style="padding: 0"><span class="glyphicon glyphicon-user"></span><br/>捐款數<br/></div>');

			$.post('/softleader-iii-eeit78/campaign/campaignAction!selectGiverCountByCampaignId',
				{'campaignForm.id' : value.id},function(data) {
					childDiv3.append(data);})

				var today = (new Date()).getTime();

				var d = (new Date(value.endDate)).getTime();
				var remain = Math.floor((d - today)/ (1000 * 60 * 60 * 24));
				var childDiv4 = $('<div class="col-xs-3 col-md-3" style="padding: 0"><span class="glyphicon glyphicon-time"></span><br/>倒數<br/>'
						+ remain+ '<br/></div>');

				otherInfoDiv.append(childDiv1).append(childDiv2).append(childDiv3).append(childDiv4);

				var p2 = $('<p></p>');
				var a = $('<a href="" class="btn btn-primary" role="button" style="margin-top:10px">立即捐款</a>');
				var url = '${pageContext.request.contextPath}/donate/donate?id='
						+ value.id+ '&name='+ value.name;
				a.attr('href', url);
				a.appendTo(p2);
				outerCaptionDiv.append(captionDiv).append(captionLower);
				captionLower.append(otherInfo).append(progressDiv).append(otherInfoDiv).append(p2);
				captionDiv.append(h3).append(p).append(p1);
				imageA.appendTo(thumbnailDiv);
				outerCaptionDiv.appendTo(thumbnailDiv);
				thumbnailDiv.appendTo(colDiv);
				colDiv.appendTo(rowDiv);
		})
	})

}}


function after(){
	console.log(currentPage);
	if(currentPage+1 < totalPage){
		currentPage++;
	}
	load();
}
$('#after').on('click', after);

function before(){
	if(currentPage > 0){
		currentPage--;
	}
	load();
}
$('#before').on('click', before);

function arrayBufferToBase64( buffer ) {
    var binary = '';
    var bytes = new Uint8Array( buffer );
    var len = bytes.byteLength;
    for (var i = 0; i < len; i++) {
        binary += String.fromCharCode( bytes[ i ] );
    }
    return window.btoa( binary );
}

appendType();
function appendType(){
	$.post('/softleader-iii-eeit78/campaign/campaignTypeAction!selectAll',
			{},function(data){		
				data = JSON.parse(data);
				$('#campaign-type-input').append('<option>所有類型</option>');
				$(data).each(function(index,value){
					var child = $('<option>'+value.name+'</option>');
					$('#campaign-type-input').append(child);
				}) //each end
	}) //post method end				
} //appendType end

</script>
</html>