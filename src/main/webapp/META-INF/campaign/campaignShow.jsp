<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
依名稱蒐尋：<input type="text" id="nameSearch">
<button id="btn1"> Click </button>
	<div id="div1"></div>
	<div id="showColumn"></div>



</body>
<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script>

var totalCount = 0;
// var pageSize = ${application.campaignShowPageSize}
load();

function load(){


	$.get('/softleader-iii-eeit78/campaign/campaignAction!selectByAllConditionCount',
			{'pageNum':0,'nameSearch':$('#nameSearch').val()},function(data){
		
		totalCount = data;
		$('#div1').empty()
		for (var i = 0; i < Math.ceil(totalCount/2); i++) { 

		var child = $('<a href="#">'+(i+1)+'</a>')
		child.on('click',makeFunction(i))
		child.appendTo($('#div1'));
		$('#div1').append(" ");
		}
		
		$.getJSON('/softleader-iii-eeit78/campaign/campaignAction!selectByAllCondition',
				{'pageNum':0,'nameSearch':$('#nameSearch').val()},function(data){
			$('#showColumn').empty();
			$(data).each(function(index,value){
				var child = $('<p>'+value.id + ', '+ value.name +'</p>');
				child.appendTo($('#showColumn'));
			})
		})
		
	})}

	$('#btn1').on('click',load);

function makeFunction(j){return function(){
	$.getJSON('/softleader-iii-eeit78/campaign/campaignAction!selectByAllCondition',
			{'pageNum':j,'nameSearch':$('#nameSearch').val()},function(data){
		$('#showColumn').empty();
		$(data).each(function(index,value){
			var child = $('<p>'+value.id + ', '+ value.name +'</p>');
			child.appendTo($('#showColumn'));
		})
	})

}}





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