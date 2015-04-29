<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>活動列表</title>
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<style>
</style>
</head>
<body>
	依名稱蒐尋：
	<input type="text" id="nameSearch">
	<button id="btn1">Click</button> <button id="btn2">返回活動列表</button>
	<div id="div1"></div>
	<div id="showColumn"></div>



</body>
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>


<script>
var totalCount = 0;

//0是第一頁

var currentPage = 0;

load();

function load(){


	$.post('/softleader-iii-eeit78/campaign/campaignAction!selectByAllConditionCount',
			{'campaignForm.name':$('#nameSearch').val()},function(data){
		
		totalCount = data;
		$('#div1').empty()
		for (var i = 0; i < Math.ceil(totalCount/2); i++) { 

		var child = $('<a href="">'+(i+1)+'</a>')
		child.on('click',makeFunction(i))
		child.appendTo($('#div1'));
		$('#div1').append(" ");
		}
		
		$.post('/softleader-iii-eeit78/campaign/campaignAction!selectByAllCondition',
				{'campaignForm.pageNum':currentPage,'campaignForm.name':$('#nameSearch').val()},function(data){
			$('#showColumn').empty();
			$(data).each(function(index,value){
				var child = $('<a></a>');
				child.attr("href","");
				child.text(value.id +", "+value.name);
				child.on('click',function(){goDetail(value)});
				var str = arrayBufferToBase64(value.image); 
				var imgchild = $('<img src="data:image/png;base64,' + str +'"/>')
				imgchild.appendTo($('#showColumn'));
				child.appendTo($('#showColumn'));
				
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
	$.post('/softleader-iii-eeit78/campaign/campaignAction!selectByAllCondition',
			{'campaignForm.pageNum':j,'campaignForm.name':$('#nameSearch').val()},function(data){
				currentPage=j;
		$('#showColumn').empty();
		$(data).each(function(index,value){
			var child = $('<a></a>');
			child.attr("href","");
			child.text(value.id +", "+value.name);
			child.on('click',function(){goDetail(value)});
			var str = arrayBufferToBase64(value.image); 
			var imgchild = $('<img src="data:image/png;base64,' + str +'"/>')
			imgchild.appendTo($('#showColumn'));
			child.appendTo($('#showColumn'));
			
		})
	})

}}


function goDetail(campaignModel){
	console.log("modelName" + campaignModel.name);
	$('#div1').empty();
	$('#showColumn').empty();
	var child = $('<p></p>');
	child.text(campaignModel.id +", "+campaignModel.name);
	child.appendTo($('#showColumn'));
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




//function makeFunction(j ){return function(){ load(j,${application.campaignShowPageSize}); }};



// for (var i = 0; i < Math.ceil(${application.campaignCount}/${application.campaignShowPageSize}); i++) { 

// 	var txtA = document.createTextNode(i+1);
// 	var eleA = document.createElement("p");
// 	eleA.appendChild(txtA);
// 	eleA.setAttribute("id","page"+i);
// 	eleA.setAttribute("name","page");
//  	console.log(eleA.getAttribute("id").substring(4));
//   	eleA.addEventListener('click',makeFunction(i));
// 	document.getElementById('div1').appendChild(eleA);
// }






// function load(pageNum,pageSize) {
// 	var xmlhttp;
// 	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
// 		xmlhttp = new XMLHttpRequest();
// 	} else {// code for IE6, IE5
// 		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
// 	}

// 	var url = "/softleader-iii-eeit78/campaign/campaignAction!selectAll?pageNum="+pageNum+"&pageSize="+pageSize;

// 	xmlhttp.open("get", url, true);
// 	xmlhttp.send();

// 	xmlhttp.onreadystatechange = function() {

// 		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
// 			var jsonObj = JSON.parse(xmlhttp.responseText);
// 			console.log("here");		
// console.log(jsonObj);
// console.log(xmlhttp.responseText);
			
// 		}
// 	}
// }

// function goToPage(pageNum,pageSize) {
// 	var xmlhttp;
// 	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
// 		xmlhttp = new XMLHttpRequest();
// 	} else {// code for IE6, IE5
// 		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
// 	}

// 	var url = "/softleader-iii-eeit78/campaign/campaignAction!selectAll?pageNum="+pageNum+"&pageSize="+pageSize;

// 	xmlhttp.open("get", url, true);
// 	xmlhttp.send();

// 	xmlhttp.onreadystatechange = function() {

// 		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
// 			var jsonObj = JSON.parse(xmlhttp.responseText);
// 			console.log("here");		
// console.log(jsonObj);
// console.log(xmlhttp.responseText);
			
			
			
			
// 		}
// 	}
// }


</script>
</html>