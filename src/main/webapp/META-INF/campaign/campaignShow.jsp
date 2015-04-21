<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>

	<div id="div1"></div>



</body>
<script>

var totalCount = 0;
var pageSize = ${application.campaignShowPageSize}

load(0,pageSize);

function makeFunction(j ){return function(){ load(j,${application.campaignShowPageSize}); }};

for (var i = 0; i < Math.ceil(${application.campaignCount}/${application.campaignShowPageSize}); i++) { 

	var txtA = document.createTextNode(i+1);
	var eleA = document.createElement("p");
	eleA.appendChild(txtA);
	eleA.setAttribute("id","page"+i);
	eleA.setAttribute("name","page");
 	console.log(eleA.getAttribute("id").substring(4));
  	eleA.addEventListener('click',makeFunction(i));
	document.getElementById('div1').appendChild(eleA);
}






function load(pageNum,pageSize) {
	var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}

	var url = "/softleader-iii-eeit78/campaign/campaignAction!selectAll?pageNum="+pageNum+"&pageSize="+pageSize;

	xmlhttp.open("get", url, true);
	xmlhttp.send();

	xmlhttp.onreadystatechange = function() {

		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var jsonObj = JSON.parse(xmlhttp.responseText);
			console.log("here");		
console.log(jsonObj);
console.log(xmlhttp.responseText);
			
		}
	}
}

function goToPage(pageNum,pageSize) {
	var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}

	var url = "/softleader-iii-eeit78/campaign/campaignAction!selectAll?pageNum="+pageNum+"&pageSize="+pageSize;

	xmlhttp.open("get", url, true);
	xmlhttp.send();

	xmlhttp.onreadystatechange = function() {

		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var jsonObj = JSON.parse(xmlhttp.responseText);
			console.log("here");		
console.log(jsonObj);
console.log(xmlhttp.responseText);
			
			
			
			
		}
	}
}


</script>
</html>