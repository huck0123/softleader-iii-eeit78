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

</head>

<body id="body">

	<div class="background-image"></div>

	<jsp:include page="/header.jsp" />



	<div id="campaignDiv" class="container">
		<div id="campaignRow"></div>

	</div>

	<div id="raiserDiv">
		<div id="raiserRow"></div>
	</div>




	<div style="width: 100%; height: 1000px;"></div>
	<div style="width: 100%; height: 1000px;"></div>
	<div style="width: 100%; height: 1000px;"></div>
</body>


<script>

loadCampaign();
loadRaiser();

function loadCampaign(){
		
		$.post('/softleader-iii-eeit78/campaign/campaignAction!selectByAllCondition',
				{'campaignForm.pageSize':3,},function(data){

			data = JSON.parse(data);
 					
			$(data).each(function(index,value){
				var rowDiv = $('#campaignRow');
				var colDiv = $('<div class="col-sm-12 col-md-4"></div>');
				var thumbnailDiv = $('<div class="thumbnail"></div>');
				
				var str = arrayBufferToBase64(value.image); 
				var image = $('<img src="data:image/png;base64,' + str +'"/>');
				var imageA = $('<a></a>');
				image.appendTo(imageA);
				imageA.attr('href','${pageContext.request.contextPath}/campaign/campaignDetail?id='+value.id);
				
				var captionDiv = $('<div class="caption"></div>');
				var h3 = $('<h3>'+value.name+'</h3>');
				var p1 = $('<p>'+ value.detail+'</p>');
				
				var percent = value.currentFund/value.goal*100;
				var otherInfo = $('<p><span class="glyphicon glyphicon-map-marker"></span> '+value.location+' <span class="glyphicon glyphicon-tag"></span> '+value.type+' <span class="glyphicon glyphicon-stats"></span> '+formatFloat(percent,2)+'%已完成</p>');
				var progressDiv = $('<div class="progress"></div>');
				var progressBarDiv = $('<div id="aa" class="progress-bar progress-bar-success" role="progressbar" style="width:'+percent+'%"></div>');
				progressBarDiv.appendTo(progressDiv);
				
				var p2 = $('<p></p>');
				var a = $('<a href="" class="btn btn-primary" role="button">立即捐款</a>');
				var url = '${pageContext.request.contextPath}/donate/donate?id='+value.id+'&name='+value.name;
				a.attr('href',url);
				a.appendTo(p2);
				h3.appendTo(captionDiv);
				p1.appendTo(captionDiv);
				otherInfo.appendTo(captionDiv);
				progressDiv.appendTo(captionDiv);
				
				p2.appendTo(captionDiv);
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