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
.thumbnail {text-align: justify;}

</style>
</head>
<body id="body">

<jsp:include page="/header.jsp" />




	依名稱蒐尋：
	<input type="text" id="nameSearch">
	<button id="btn1">Click</button> <button id="btn2">返回活動列表</button>
	<div class="container" id="div1"></div>
	<div class="container" id="showColumn">
	<div id="row" class=row></div>
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
 					$('#row').empty();
			$(data).each(function(index,value){
				var rowDiv = $('#row');
				var colDiv = $('<div class="col-sm-6 col-md-4"></div>');
				var thumbnailDiv = $('<div class="thumbnail"></div>');
				
				var str = arrayBufferToBase64(value.image); 
				var image = $('<img src="data:image/png;base64,' + str +'"/>');
				var imageA = $('<a></a>');
				image.appendTo(imageA);
				
				imageA.attr('href','${pageContext.request.contextPath}/campaign/campaignDetail?id='+value.id);
				
				var captionDiv = $('<div class="caption"></div>');
				var h3 = $('<h3>'+value.name+'</h3>');
				var p1 = $('<p>'+ value.detail+'</p>');
				var p2 = $('<p></p>');
				var a = $('<a href="" class="btn btn-primary" role="button">立即捐款</a>');
				var url = '${pageContext.request.contextPath}/donate/donate?id='+value.id+'&name='+value.name;
				a.attr('href',url);
				a.appendTo(p2);
				h3.appendTo(captionDiv);
				p1.appendTo(captionDiv);
				p2.appendTo(captionDiv);
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
 		$('#row').empty();
		$(data).each(function(index,value){
			var rowDiv = $('#row');
			var colDiv = $('<div class="col-sm-6 col-md-4"></div>');
			var thumbnailDiv = $('<div class="thumbnail"></div>');
			
			var str = arrayBufferToBase64(value.image); 
			var image = $('<img  src="data:image/png;base64,' + str +'"/>');
			var imageA = $('<a></a>');
			image.appendTo(imageA);
			imageA.attr('href','${pageContext.request.contextPath}/campaign/campaignDetail?id='+value.id);
			
			var captionDiv = $('<div class="caption"></div>');
			var h3 = $('<h3>'+value.name+'</h3>');
			var p1 = $('<p>'+ value.detail+'</p>');
			var p2 = $('<p></p>');
			var a = $('<a href="" class="btn btn-primary" role="button">我要捐款</a>');
			var url = '${pageContext.request.contextPath}/donate/donate?id='+value.id+'&name='+value.name;
			a.attr('href',url);
			
			a.appendTo(p2);
			h3.appendTo(captionDiv);
			p1.appendTo(captionDiv);
			p2.appendTo(captionDiv);
			imageA.appendTo(thumbnailDiv);
			captionDiv.appendTo(thumbnailDiv);
			thumbnailDiv.appendTo(colDiv);
			colDiv.appendTo(rowDiv);
		})
	})

}}


function goDetail(campaignModel){

	
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