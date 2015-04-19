<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>

<button type="button" onclick="load()">Show</button>
</body>
<script>

function load() {
	var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}

	var url = "/softleader-iii-eeit78/campaign/campaignAction!selectAll";

	xmlhttp.open("get", url, true);
	xmlhttp.send();

	xmlhttp.onreadystatechange = function() {

		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var jsonObj = JSON.parse(xmlhttp.responseText);
			console.log("here");		
console.log(jsonObj);
			
			
		}
	}
}


</script>
</html>